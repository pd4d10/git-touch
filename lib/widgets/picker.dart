import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerItem<T> {
  final T value;
  final String text;
  PickerItem(this.value, {@required this.text});
}

class PickerGroupItem<T> {
  final T value;
  final List<PickerItem<T>> items;
  final Function(T value) onChange;

  PickerGroupItem({
    @required this.value,
    @required this.items,
    @required this.onChange,
  });
}
