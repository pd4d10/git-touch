import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:uni_links/uni_links.dart';
import 'package:nanoid/nanoid.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/utils.dart';

class ThemeMap {
  static const material = 0;
  static const cupertino = 1;
  static const all = [0, 1];
}

final prefix = 'https://api.github.com';

class Account {
  String avatarUrl;
  String token;

  /// for github enterprise
  String domain;

  Account({
    @required this.avatarUrl,
    @required this.token,
    this.domain,
  });

  Account.fromJson(input) {
    avatarUrl = input['avatarUrl'];
    token = input['token'];
    domain = input['domain'];
  }

  Map<String, dynamic> toJson() {
    var data = {'avatarUrl': avatarUrl, 'token': token};
    if (domain != null) {
      data['domain'] = domain;
    }
    return data;
  }
}

class SettingsProvider extends StatefulWidget {
  final Widget child;

  SettingsProvider({@required this.child});

  static _SettingsProviderState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedSettingsProvider)
            as _InheritedSettingsProvider)
        .data;
  }

  @override
  _SettingsProviderState createState() => new _SettingsProviderState();
}

class _SettingsProviderState extends State<SettingsProvider> {
  bool ready = false;
  int theme;
  Map<String, Account> githubAccountMap;
  String activeLogin;
  StreamSubscription<Uri> _sub;

  get token {
    if (activeLogin == null) {
      return null;
    }
    return githubAccountMap[activeLogin].token;
  }

  @override
  void initState() {
    super.initState();
    _initDataFromPref();

    _sub = getUriLinksStream().listen(_onSchemeDetected, onError: (err) {
      print(err);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sub.cancel();
  }

  // https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow
  void _onSchemeDetected(Uri uri) async {
    // get token by code
    var code = uri.queryParameters['code'];
    // print(code);
    var res = await http.post(
      'https://github.com/login/oauth/access_token',
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode({
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': code,
        'state': randomString,
      }),
    );
    print(res.body);
    var data = json.decode(res.body);
    String _token = data['access_token'];

    // get login and avatar url
    var queryData = await query('''
{
  viewer {
    login
    avatarUrl
  }
}
''', _token);
    String login = queryData['viewer']['login'];
    String avatarUrl = queryData['viewer']['avatarUrl'];

    githubAccountMap[login] = Account(avatarUrl: avatarUrl, token: _token);

    // write
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var githubData = json.encode(githubAccountMap
        .map((login, account) => MapEntry(login, account.toJson())));
    print('write github: $githubData');
    await prefs.setString('github', githubData);

    setState(() {});
  }

  void _initDataFromPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // read GitHub accounts
    try {
      var str = prefs.getString('github');
      print('read github: $str');
      Map<String, dynamic> github = json.decode(str);
      githubAccountMap = github.map<String, Account>((login, _accountMap) =>
          MapEntry(login, Account.fromJson(_accountMap)));
    } catch (err) {
      print(err);
      githubAccountMap = {};
    }

    int _theme = prefs.getInt('theme');
    if (ThemeMap.all.contains(_theme)) {
      theme = _theme;
    } else if (Platform.isIOS) {
      theme = ThemeMap.cupertino;
    }
    // theme = ThemeMap.material;

    setState(() {
      ready = true;
    });

    // print(counter);
    // await prefs.setInt('counter', counter);
  }

  void setActiveAccount(String login) {
    setState(() {
      activeLogin = login;
    });
  }

  // http timeout
  var _timeoutDuration = Duration(seconds: 10);
  // var _timeoutDuration = Duration(seconds: 1);

  Future<dynamic> query(String query, [String _token]) async {
    if (_token == null) {
      _token = token;
    }
    if (_token == null) {
      throw Exception('token is null');
    }

    final res = await http
        .post(prefix + '/graphql',
            headers: {
              HttpHeaders.authorizationHeader: 'token $_token',
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: json.encode({'query': query}))
        .timeout(_timeoutDuration);

    final data = json.decode(res.body);

    if (data['errors'] != null) {
      throw new Exception(data['errors'].toString());
    }
    // print(data);
    return data['data'];
  }

  Future<dynamic> getWithCredentials(String url, {String contentType}) async {
    var headers = {HttpHeaders.authorizationHeader: 'token $token'};
    if (contentType != null) {
      // https://developer.github.com/v3/repos/contents/#custom-media-types
      headers[HttpHeaders.contentTypeHeader] = contentType;
    }
    final res = await http
        .get(prefix + url, headers: headers)
        .timeout(_timeoutDuration);
    print(res.body);
    final data = json.decode(res.body);
    return data;
  }

  Future<dynamic> patchWithCredentials(String url) async {
    var headers = {HttpHeaders.authorizationHeader: 'token $token'};
    await http.patch(prefix + url, headers: headers).timeout(_timeoutDuration);

    return true;
  }

  Future<dynamic> putWithCredentials(String url,
      {String contentType, String body}) async {
    var headers = {HttpHeaders.authorizationHeader: 'token $token'};
    final res = await http
        .put(prefix + url, headers: headers, body: body ?? {})
        .timeout(_timeoutDuration);

    print(res.body);
    // final data = json.decode(res.body);
    // return data;
    return true;
  }

  String randomString;

  generateRandomString() {
    randomString = nanoid();
    return randomString;
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedSettingsProvider(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedSettingsProvider extends InheritedWidget {
  final _SettingsProviderState data;

  _InheritedSettingsProvider({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedSettingsProvider old) => true;
}
