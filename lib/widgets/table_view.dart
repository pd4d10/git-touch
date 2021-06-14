import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/border_view.dart';
import 'package:provider/provider.dart';
import 'link.dart';

class TableViewHeader extends StatelessWidget {
  final String? title;

  TableViewHeader(this.title);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        title!.toUpperCase(),
        style: TextStyle(color: theme.palette.secondaryText, fontSize: 13),
      ),
    );
  }
}

class TableViewItem extends StatelessWidget {
  final Widget text;
  final IconData? leftIconData;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final void Function()? onTap;
  final String? url;
  final bool hideRightChevron;

  TableViewItem({
    required this.text,
    this.leftIconData,
    this.leftWidget,
    this.rightWidget,
    this.onTap,
    this.url,
    this.hideRightChevron = false,
  }) : assert(leftIconData == null || leftWidget == null);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return LinkWidget(
      onTap: onTap,
      url: url,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 17, color: theme.palette.text),
        overflow: TextOverflow.ellipsis,
        child: Container(
          height: 44,
          child: Row(
            children: [
              SizedBox(
                width: (leftWidget == null && leftIconData == null) ? 12 : 44,
                child: Center(
                    child: leftWidget ??
                        Icon(
                          leftIconData,
                          color: theme.palette.primary,
                          size: 20,
                        )),
              ),
              Expanded(child: text),
              if (rightWidget != null) ...[
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 17,
                    color: theme.palette.tertiaryText,
                  ),
                  child: rightWidget!,
                ),
                SizedBox(width: 6)
              ],
              if ((onTap != null || url != null) && !hideRightChevron)
                Icon(Ionicons.chevron_forward,
                    size: 20, color: theme.palette.tertiaryText)
              else
                SizedBox(width: 2),
              SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class TableView extends StatelessWidget {
  final String? headerText;
  final Iterable<Widget> items;
  final bool? hasIcon;

  TableView({this.headerText, required this.items, this.hasIcon = true});

  double get _leftPadding => hasIcon == true ? 44 : 12;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (headerText != null) TableViewHeader(headerText),
        ...join(
          BorderView(leftPadding: _leftPadding),
          items.toList(),
        ),
        CommonStyle.border,
      ],
    );
  }
}
