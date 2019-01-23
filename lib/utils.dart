import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'token.dart';
import 'models/user.dart';

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

Future<User> fetchUser(String login) async {
  Map<String, dynamic> data = await getWithCredentials('/users/$login');
  return User.fromJson(data);
}
