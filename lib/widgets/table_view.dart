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

class TableViewItem {
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
}

class TableView extends StatelessWidget {
  final String? headerText;
  final Iterable<TableViewItem> items;
  final bool hasIcon;

  double get _leftPadding => hasIcon ? 44 : 12;

  TableView({this.headerText, required this.items, this.hasIcon = false});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (headerText != null) TableViewHeader(headerText),
        CommonStyle.border,
        ...join(
          BorderView(leftPadding: _leftPadding),
          items.map((item) {
            var leftWidget = item.leftWidget;
            if (leftWidget == null && hasIcon) {
              leftWidget = Icon(
                item.leftIconData,
                color: theme.palette.primary,
                size: 20,
              );
            }

            return LinkWidget(
              onTap: item.onTap,
              url: item.url,
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 17, color: theme.palette.text),
                overflow: TextOverflow.ellipsis,
                child: Container(
                  height: 44,
                  child: Row(
                    children: [
                      SizedBox(
                        width: _leftPadding,
                        child: Center(child: leftWidget),
                      ),
                      Expanded(child: item.text),
                      if (item.rightWidget != null) ...[
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 17,
                            color: theme.palette.tertiaryText,
                          ),
                          child: item.rightWidget!,
                        ),
                        SizedBox(width: 6)
                      ],
                      if ((item.onTap != null || item.url != null) &&
                          !item.hideRightChevron)
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
          }).toList(),
        ),
        CommonStyle.border,
      ],
    );
  }
}
