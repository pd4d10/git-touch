import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationPayload {
  String id;
  String type;
  String owner;
  String name;
  int number;
  String title;
  String updateAt;
  bool unread;

  String state;

  String get key => '_' + number.toString();

  NotificationPayload.fromJson(input) {
    id = input['id'];
    type = input['subject']['type'];
    name = input['repository']['name'];
    owner = input['repository']['owner']['login'];

    String url = input['subject']['url'];

    if (type == 'Issue' || type == 'PullRequest') {
      String numberStr = url.split('/').lastWhere((_) => true);
      number = int.parse(numberStr);
    } else {
      // Fimber.d(input);
    }

    title = input['subject']['title'];
    updateAt = timeago.format(DateTime.parse(input['updated_at']));
    unread = input['unread'];
  }
}

class NotificationGroup {
  String owner;
  String name;
  get repo => owner + '/' + name;
  List<NotificationPayload> items = [];

  // Add heading _ to fix number case
  // - => __
  // . => ___
  String get key =>
      ('_' + owner + '_' + name).replaceAll('-', '__').replaceAll('.', '___');

  NotificationGroup(this.owner, this.name);
}

class NotificationModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  setCount(int v) {
    _count = v;
    notifyListeners();
  }
}
