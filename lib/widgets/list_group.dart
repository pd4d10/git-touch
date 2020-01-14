import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/theme.dart';
import '../widgets/empty.dart';

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

  Widget _buildItem(BuildContext context, MapEntry<int, T> entry) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.paletteOf(context).border)),
      ),
      child: itemBuilder(entry.value, entry.key),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: theme.paletteOf(context).border),
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(padding: EdgeInsets.all(8), child: title),
            items.isEmpty
                ? EmptyWidget()
                : Column(
                    children: items
                        .asMap()
                        .entries
                        .map((e) => _buildItem(context, e))
                        .toList())
          ],
        ),
      ),
    );
  }
}
