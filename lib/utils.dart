import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'token.dart';

final prefix = 'https://api.github.com';

class Event {
  String type;
  String actor;
  String id;
  String avatar;
  String repo;
  Map<String, dynamic> payload;

  Event(data) {
    id = data['id'];
    type = data['type'];
    actor = data['actor']['login'];
    avatar = data['actor']['avatar_url'];
    repo = data['repo']['name'];
    payload = data['payload'];
  }
}

class User {
  String login;
  String avatar;
  String name;
  int repos;
  int followers;
  int following;

  User(data) {
    login = data['login'];
    avatar = data['avatar_url'];
    name = data['name'];
    repos = data['public_repos'];
    followers = data['followers'];
    following = data['following'];
  }
}

Future<List<Event>> fetchEvents([int page = 1]) async {
  final res = await http.get(
    prefix + '/users/pd4d10/received_events/public?page=$page',
    headers: {HttpHeaders.AUTHORIZATION: 'token $token'},
  );
  List<dynamic> data = json.decode(res.body);

  return data.map((item) {
    return new Event(item);
  }).toList();
}

Future<User> fetchUser(String login) async {
  final res = await http.get(
    prefix + '/users/$login',
    headers: {HttpHeaders.AUTHORIZATION: 'token $token'},
  );
  Map<String, dynamic> data = json.decode(res.body);

  return new User(data);
}
