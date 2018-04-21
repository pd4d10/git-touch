import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'token.dart';

final prefix = 'https://api.github.com';

// class PushEvent extends Event {
//   PushEvent(Map<String, dynamic> json) : super(json) {}
// }

// class IssuesEvent extends Event {
//   String issueTitle;
//   String issueUrl;

//   IssuesEvent(Map<String, dynamic> json) : super(json) {
//     issueTitle = json['issue']['title'];
//     issueUrl = json['issue']['url'];
//   }
// }

class Event {
  String type;
  String actor;
  String id;
  String avatar;
  String repo;
  Map<String, dynamic> payload;

  Event(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    actor = json['actor']['login'];
    avatar = json['actor']['avatar_url'];
    repo = json['repo']['name'];
    payload = json['payload'];
  }

  // factory Event.fromJson(Map<String, dynamic> json) {
  //   switch (json['type']) {
  //     case 'PushEvent':
  //       return new PushEvent(json);
  //     default:
  //       return null;
  //   }
  // }
}

Future<List<Event>> fetchEvents([int page = 1]) async {
  final res = await http.get(
    prefix + '/users/pd4d10/received_events/public?page=$page',
    headers: {HttpHeaders.AUTHORIZATION: 'token $token'},
  );
  List<dynamic> resJson = json.decode(res.body);

  return resJson.map((item) {
    return new Event(item);
  }).toList();
}
