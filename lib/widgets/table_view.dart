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
  final String headerText;
  final List<TableViewItem> items;

  TableView({this.headerText, @required this.items});

  static const _border = SizedBox(
    height: 1,
    child: const DecoratedBox(
      decoration: const BoxDecoration(color: PrimerColors.gray200),
    ),
  );

  static const _seperator = SizedBox(
    height: 1,
    child: const DecoratedBox(
      decoration: const BoxDecoration(color: PrimerColors.gray200),
    ),
  );

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
        ...join(
          _seperator,
          items.map((item) {
            return Link(
              onTap: item.onTap,
              screenBuilder: item.screenBuilder,
              child: Container(
                height: 44,
                child: Row(children: [
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item.text,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ...(item.checked
                      ? [
                          Icon(Icons.check,
                              color: CupertinoColors.activeBlue, size: 20)
                        ]
                      : []),
                  SizedBox(width: 12),
                ]),
              ),
            );
          }).toList(),
        ),
        _border,
      ],
    );
  }
}
