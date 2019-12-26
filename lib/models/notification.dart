import 'package:flutter/material.dart';
import 'package:git_touch/models/github.dart';
import 'package:tuple/tuple.dart';

import '../utils/utils.dart';

class NotificationGroup {
  String fullName;
  List<GithubNotificationItem> items = [];

  Tuple2<String, String> _repo;
  String get owner {
    if (_repo == null) {
      _repo = parseRepositoryFullName(fullName);
    }
    return _repo.item1;
  }

  String get name {
    if (_repo == null) {
      _repo = parseRepositoryFullName(fullName);
    }
    return _repo.item2;
  }

  String get key => '_$hashCode';

  NotificationGroup(this.fullName);
}

class NotificationModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  setCount(int v) {
    _count = v;
    notifyListeners();
  }
}
