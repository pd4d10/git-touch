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

Future<dynamic> getWithCredentials(String url, {String contentType}) async {
  var headers = {HttpHeaders.authorizationHeader: 'token $token'};
  if (contentType != null) {
    // https://developer.github.com/v3/repos/contents/#custom-media-types
    headers[HttpHeaders.contentTypeHeader] = contentType;
  }
  final res = await http.get(
    prefix + url,
    headers: headers,
  );
  final data = json.decode(res.body);
  return data;
}

Future<dynamic> postWithCredentials(String url, String body,
    {String contentType}) async {
  var headers = {HttpHeaders.authorizationHeader: 'token $token'};
  if (contentType != null) {
    headers[HttpHeaders.contentTypeHeader] = contentType;
  }
  final res = await http.post(prefix + url, headers: headers, body: body);
  final data = json.decode(res.body);
  return data;
}

Future<dynamic> putWithCredentials(String url,
    {String contentType, String body}) async {
  var headers = {HttpHeaders.authorizationHeader: 'token $token'};
  if (contentType != null) {
    headers[HttpHeaders.contentTypeHeader] = contentType;
  }
  final res = await http.put(prefix + url, headers: headers, body: body ?? {});
  final data = json.decode(res.body);
  return data;
}

Future<dynamic> patchWithCredentials(String url) async {
  var headers = {HttpHeaders.authorizationHeader: 'token $token'};
  await http.patch(prefix + url, headers: headers);
  return true;
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
