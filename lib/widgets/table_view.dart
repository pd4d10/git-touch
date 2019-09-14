import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:primer/primer.dart';
import 'link.dart';

class TableViewSeperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: PrimerColors.gray100,
    );
  }
}

class TableViewItem {
  final Widget text;
  final IconData leftIconData;
  final Widget leftWidget;
  final Widget rightWidget;
  final void Function() onTap;
  final WidgetBuilder screenBuilder;
  final bool hideRightChevron;

  TableViewItem({
    @required this.text,
    this.leftIconData,
    this.leftWidget,
    this.rightWidget,
    this.onTap,
    this.screenBuilder,
    this.hideRightChevron = false,
  }) : assert(leftIconData == null || leftWidget == null);
}

class TableView extends StatelessWidget {
  final String headerText;
  final Iterable<TableViewItem> items;

  TableView({this.headerText, @required this.items});

  Widget _buildItem(TableViewItem item) {
    if (item == null) return null;

    var leftWidget =
        item.leftWidget ?? Icon(item.leftIconData, color: PrimerColors.blue500);
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
      child: SizedBox(
        height: 44,
        child: Row(children: [
          SizedBox(width: 44, child: leftWidget),
          Expanded(child: item.text),
          if (item.rightWidget != null) item.rightWidget,
          if ((item.onTap != null || item.screenBuilder != null) &&
              !item.hideRightChevron) ...[
            Icon(CupertinoIcons.right_chevron,
                size: 24, color: PrimerColors.gray300),
            SizedBox(width: 4),
          ],
        ]),
      ),
    );

    if (item.onTap == null && item.screenBuilder == null) {
      return widget;
    }
    return Link(
      onTap: item.onTap,
      screenBuilder: item.screenBuilder,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (headerText != null)
          Container(
            color: PrimerColors.gray100,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              headerText,
              style: TextStyle(color: PrimerColors.gray600, fontSize: 13),
            ),
          ),
        borderView,
        ...join(BorderView(leftPadding: 44), items.map(_buildItem).toList()),
        borderView,
      ],
    );
  }
}
