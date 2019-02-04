import 'package:flutter/material.dart';

class ListGroup<T> extends StatelessWidget {
  final Widget title;
  final List<T> items;
  final Widget Function(T item) itemBuilder;

  ListGroup({this.title, this.items, this.itemBuilder});

  Widget _buildItem(T item) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: itemBuilder(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4),
              color: Color(0x10000000),
              child: title,
            ),
            Column(children: items.map(_buildItem).toList())
          ],
        ),
      ),
    );
  }
}
