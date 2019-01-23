import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'token.dart';
import 'models/user.dart';

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

Future<User> fetchUser(String login) async {
  Map<String, dynamic> data = await getWithCredentials('/users/$login');
  return User.fromJson(data);
}
