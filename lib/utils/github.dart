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
  final res =
      await postWithCredentials('/graphql', json.encode({'query': query}));
  if (res['errors'] != null) {
    throw new Exception(res['errors'].toString());
  }
  // print(res);
  return res['data'];
}

Future<List<Event>> fetchEvents(int page) async {
  List data = await getWithCredentials(
    '/users/pd4d10/received_events/public?page=$page',
  );
  return data.map<Event>((item) => Event.fromJSON(item)).toList();
}
