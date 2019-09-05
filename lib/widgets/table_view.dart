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
  final Widget leftWidget;
  final Widget rightWidget;
  final void Function() onTap;
  final WidgetBuilder screenBuilder;

  TableViewItem({
    this.text,
    this.leftWidget,
    this.rightWidget,
    this.onTap,
    this.screenBuilder,
  });
}

class TableView extends StatelessWidget {
  final String headerText;
  final List<TableViewItem> items;

  TableView({this.headerText, @required this.items});

  static final _border = BorderView();
  static final _seperator = BorderView();

  Widget _buildItem(TableViewItem item) {
    var widget = Container(
      height: 44,
      child: Row(children: [
        ...(item.leftWidget == null
            ? []
            : [
                SizedBox(width: 12),
                item.leftWidget,
              ]),
        SizedBox(width: 12),
        Expanded(
          child: DefaultTextStyle(
            child: item.text,
            style: TextStyle(fontSize: 18, color: PrimerColors.gray900),
          ),
        ),
        ...(item.rightWidget == null ? [] : [item.rightWidget]),
        SizedBox(width: 12),
      ]),
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
        ...(headerText == null
            ? []
            : [
                Container(
                  color: PrimerColors.gray100,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    headerText,
                    style: TextStyle(color: PrimerColors.gray600, fontSize: 13),
                  ),
                )
              ]),
        _border,
        ...join(_seperator, items.map(_buildItem).toList()),
        _border,
      ],
    );
  }
}
