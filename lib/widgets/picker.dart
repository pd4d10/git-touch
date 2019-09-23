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

  PickerGroup({@required this.items});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeModel>(context);
    switch (themeProvider.theme) {
      case AppThemeType.cupertino:
      default:
        //  TODO: Material
        return TableView(
          items: items.map((item) {
            return TableViewItem(
              text: Text(item.title),
              rightWidget: Text(item.value),
              onTap: () {
                themeProvider.showPicker(context, item);
              },
            );
          }),
        );
    }
  }
}
