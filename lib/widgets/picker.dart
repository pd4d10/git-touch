import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';

class PickerItem<T> {
  final T value;
  final String text;
  PickerItem(this.value, {@required this.text});
}

class PickerGroupItem<T> {
  final String title;
  final T value;
  final Iterable<PickerItem<T>> items;
  final Function(T value) onChange;
  PickerGroupItem({
    @required this.title,
    @required this.value,
    @required this.items,
    @required this.onChange,
  });
}

class PickerGroup extends StatelessWidget {
  final Iterable<PickerGroupItem<String>> items;

  static Timer _debounce;

  PickerGroup({@required this.items});

  showPicker(BuildContext context, PickerGroupItem<String> groupItem) async {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        await showCupertinoModalPopup<void>(
          context: context,
          builder: (context) {
            return Container(
              height: 300,
              child: CupertinoPicker(
                backgroundColor: CupertinoColors.white,
                children: groupItem.items.map((v) => Text(v.text)).toList(),
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                    initialItem: groupItem.items
                        .toList()
                        .indexWhere((v) => v.value == groupItem.value)),
                onSelectedItemChanged: (index) {
                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    return groupItem
                        .onChange(groupItem.items.toList()[index].value);
                  });
                },
              ),
            );
          },
        );
        break;
      default:
        final value = await showMenu(
          context: context,
          initialValue: groupItem.value,
          items: groupItem.items
              .map((item) =>
                  PopupMenuItem(value: item.value, child: Text(item.text)))
              .toList(),
          position: RelativeRect.fill,
        );
        if (value != null) {
          groupItem.onChange(value);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
      default:
        //  TODO: Material
        return TableView(
          items: items.map((item) {
            return TableViewItem(
              text: Text(item.title),
              rightWidget: Text(item.value),
              onTap: () {
                showPicker(context, item);
              },
            );
          }),
        );
    }
  }
}
