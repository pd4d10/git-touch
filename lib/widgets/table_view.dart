import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'link.dart';

class TableViewItem {
  final String text;
  final bool checked;
  final void Function() onTap;
  final WidgetBuilder screenBuilder;

  TableViewItem({
    this.text,
    this.checked = false,
    this.onTap,
    this.screenBuilder,
  });
}

class TableView extends StatelessWidget {
  final String title;
  final List<TableViewItem> items;

  TableView({this.title, this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12)),
            ),
            padding: EdgeInsets.only(top: 4),
          ),
        ]..addAll(items.map((item) {
            List<Widget> children = [
              Expanded(
                child: Text(
                  item.text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
            ];
            if (item.checked) {
              children
                  .add(Icon(Icons.check, color: CupertinoColors.activeBlue));
            }

            return Link(
              beforeRedirect: item.onTap,
              screenBuilder: item.screenBuilder,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                padding: EdgeInsets.all(12),
                child: Row(children: children),
              ),
            );
          }).toList()),
      ),
    );
  }
}
