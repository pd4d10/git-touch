import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'token.dart';
import 'models/event.dart';
import 'models/user.dart';
import 'models/notification.dart';

final prefix = 'https://api.github.com';

Future<dynamic> getWithCredentials(String url) async {
  final res = await http.get(
    prefix + url,
    headers: {HttpHeaders.authorizationHeader: 'token $token'},
  );
  final data = json.decode(res.body);
  // if (res.body.startsWith('{')) {
  //   throw data['message'];
  // }
  return data;
}

Future<List<Event>> fetchEvents([int page = 1]) async {
  List data = await getWithCredentials(
    '/users/pd4d10/received_events/public?page=$page',
  );
  return data.map<Event>((item) {
    return Event.fromJson(item);
  }).toList();
}

Future<User> fetchUser(String login) async {
  Map<String, dynamic> data = await getWithCredentials('/users/$login');
  return User.fromJson(data);
}

Future<List<NotificationItem>> fetchNotifications(String type) async {
  List data = await getWithCredentials('/notifications?$type=true');
  print(data);
  return data
      .map<NotificationItem>((item) => NotificationItem.fromJson(item))
      .toList();
}
