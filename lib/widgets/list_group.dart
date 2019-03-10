import 'package:flutter/material.dart';
import '../widgets/empty.dart';

var borderColor = Color.fromRGBO(27, 31, 35, .15);

class ListGroup<T> extends StatelessWidget {
  final Widget title;
  final List<T> items;
  final Widget Function(T item, int index) itemBuilder;
  final EdgeInsetsGeometry padding;

  ListGroup({
    @required this.title,
    @required this.items,
    @required this.itemBuilder,
    this.padding = const EdgeInsets.only(left: 10, right: 10, bottom: 10),
  });

  Widget _buildItem(MapEntry<int, T> entry) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: itemBuilder(entry.value, entry.key),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Color(0xfff6f8fa),
              padding: EdgeInsets.all(8),
              child: title,
            ),
            items.isEmpty
                ? EmptyWidget()
                : Column(
                    children: items.asMap().entries.map(_buildItem).toList())
          ],
        ),
      ),
    );
  }
}
