import 'package:flutter/material.dart';

class NotificationModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  setCount(int v) {
    _count = v;
    notifyListeners();
  }
}
