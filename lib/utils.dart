import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'token.dart';
import 'models/event.dart';
import 'models/user.dart';

final prefix = 'https://api.github.com';

Future<List<Event>> fetchEvents([int page = 1]) async {
  final res = await http.get(
    prefix + '/users/pd4d10/received_events/public?page=$page',
    headers: {HttpHeaders.authorizationHeader: 'token $token'},
  );

  print(res.body);
  List<dynamic> data = json.decode(res.body);

  return data.map((item) {
    return Event.fromJson(item);
  }).toList();
}

Future<User> fetchUser(String login) async {
  final res = await http.get(
    prefix + '/users/$login',
    headers: {HttpHeaders.authorizationHeader: 'token $token'},
  );
  Map<String, dynamic> data = json.decode(res.body);

  return User.fromJson(data);
}
