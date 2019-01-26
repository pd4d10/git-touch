import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:github/server.dart';
export 'package:github/server.dart';
import '../token.dart';

var ghClient = createGitHubClient(auth: Authentication.withToken(token));

final prefix = 'https://api.github.com';
final endpoint = '/graphql';

Future<dynamic> getWithCredentials(String url) async {
  final res = await http.get(
    prefix + url,
    headers: {HttpHeaders.authorizationHeader: 'token $token'},
  );
  final data = json.decode(res.body);
  return data;
}

Future<dynamic> postWithCredentials(String url, String body) async {
  final res = await http.post(
    prefix + url,
    headers: {HttpHeaders.authorizationHeader: 'token $token'},
    body: body,
  );
  final data = json.decode(res.body);
  return data;
}

Future<dynamic> query(String query) async {
  final data =
      await postWithCredentials('/graphql', json.encode({'query': query}));
  if (data['errors'] != null) {
    throw new Exception(data['errors'].toString());
  }
  print(data);
  return data['data'];
}

Future<List<Event>> fetchEvents(int page) async {
  List data = await getWithCredentials(
    '/users/pd4d10/received_events/public?page=$page',
  );
  return data.map<Event>((item) => Event.fromJSON(item)).toList();
}

class NotificationGroup {
  String fullName;
  List<Notification> items = [];

  NotificationGroup(this.fullName);
}

Future<List<NotificationGroup>> fetchNotifications([int index = 0]) async {
  var data = await ghClient.activity
      .listNotifications(all: index == 2, participating: index == 1)
      .toList();

  Map<String, NotificationGroup> groupMap = {};
  data.forEach((item) {
    String repo = item.repository.fullName;
    if (groupMap[repo] == null) {
      groupMap[repo] = NotificationGroup(repo);
    }

    groupMap[repo].items.add(item);
  });
  return groupMap.values.toList();
}
