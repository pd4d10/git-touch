import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/border_view.dart';
import 'package:primer/primer.dart';
import 'link.dart';

class TableViewHeader extends StatelessWidget {
  final String title;

  TableViewHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(color: PrimerColors.gray600, fontSize: 13),
      ),
    );
  }
}

class TableViewItem {
  final Widget text;
  final IconData leftIconData;
  final Widget leftWidget;
  final Widget rightWidget;
  final void Function() onTap;
  final String url;
  final WidgetBuilder screenBuilder;
  final bool hideRightChevron;

  TableViewItem({
    @required this.text,
    this.leftIconData,
    this.leftWidget,
    this.rightWidget,
    this.onTap,
    this.url,
    this.screenBuilder,
    this.hideRightChevron = false,
  }) : assert(leftIconData == null || leftWidget == null);
}

class TableView extends StatelessWidget {
  final String headerText;
  final Iterable<TableViewItem> items;
  final bool hasIcon;

  double get _leftPadding => hasIcon ? 44 : 12;

  TableView({this.headerText, @required this.items, this.hasIcon = false});

  Widget _buildItem(TableViewItem item) {
    if (item == null) return null;

    var leftWidget = item.leftWidget;
    if (leftWidget == null && hasIcon) {
      leftWidget = Icon(
        item.leftIconData,
        color: PrimerColors.blue500,
        size: 18,
      );
    }
    // Container(
    //   width: 24,
    //   height: 24,
    //   // decoration: BoxDecoration(
    //   //     borderRadius: BorderRadius.circular(4), color: PrimerColors.blue400),
    //   child: Icon(iconData, size: 24, color: PrimerColors.gray600),
    // )

    var widget = DefaultTextStyle(
      style: TextStyle(fontSize: 16, color: PrimerColors.gray900),
      overflow: TextOverflow.ellipsis,
      child: Container(
        height: 44,
        child: Row(
          children: [
            SizedBox(width: _leftPadding, child: leftWidget),
            Expanded(child: item.text),
            if (item.rightWidget != null) ...[
              DefaultTextStyle(
                style: TextStyle(fontSize: 16, color: PrimerColors.gray500),
                child: item.rightWidget,
              ),
              SizedBox(width: 6)
            ],
            if ((item.onTap != null ||
                    item.screenBuilder != null ||
                    item.url != null) &&
                !item.hideRightChevron)
              Icon(CupertinoIcons.right_chevron,
                  size: 20, color: PrimerColors.gray300)
            else
              SizedBox(width: 2),
            SizedBox(width: 8),
          ],
        ),
      ),
    );

    return Link(
      onTap: item.onTap,
      screenBuilder: item.screenBuilder,
      url: item.url,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (headerText != null) TableViewHeader(headerText),
        CommonStyle.border,
        ...join(BorderView(leftPadding: _leftPadding),
            items.map(_buildItem).toList()),
        CommonStyle.border,
      ],
    );
  }
}
