import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:uni_links/uni_links.dart';
import 'package:nanoid/nanoid.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../utils/utils.dart';
import '../utils/constants.dart';
import '../models/account.dart';

class PlatformType {
  static const github = 0;
  static const gitlab = 1;
}

// abstract class Model<T> {
//   Future<T> query(BuildContext context) {
//     var settings = SettingsProvider.of(context);

//     switch (settings.platformType) {
//       case PlatformType.github:
//         return queryGithub(settings);
//       case PlatformType.gitlab:
//         return queryGitlab(settings);
//       default:
//         return null;
//     }
//   }

//   Future<T> queryGithub(SettingsProviderState settings);
//   Future<T> queryGitlab(SettingsProviderState settings);
// }

class ThemeMap {
  static const material = 0;
  static const cupertino = 1;
  static const values = [0, 1];
}

class SettingsProvider extends StatefulWidget {
  final Widget child;

  SettingsProvider({@required this.child});

  static SettingsProviderState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedSettingsProvider)
            as _InheritedSettingsProvider)
        .data;
  }

  @override
  SettingsProviderState createState() => new SettingsProviderState();
}

class SettingsProviderState extends State<SettingsProvider> {
  bool ready = false;
  int theme;

  Map<String, AccountModel> githubAccountMap;
  Map<String, AccountModel> gitlabAccountMap;

  int activePlatform;
  String activeLogin;

  StreamSubscription<Uri> _sub;
  bool loading = false;

  // PlatformType platformType;

  String prefix = 'https://api.github.com';

  Future<void> setTheme(int _theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    theme = _theme;
    await prefs.setInt('theme', theme);
    print('write theme: $theme');

    setState(() {});
  }

  String get token {
    if (activeLogin == null) return null;

    switch (activePlatform) {
      case PlatformType.github:
        return githubAccountMap[activeLogin].token;
      case PlatformType.gitlab:
        return gitlabAccountMap[activeLogin].token;
      default:
        return null;
    }
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
  Future<void> _onSchemeDetected(Uri uri) async {
    try {
      // FIXME:
      await closeWebView();
    } catch (err) {}

    setState(() {
      loading = true;
    });

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
    // print(res.body);
    var data = json.decode(res.body);
    _loginWithToken(data['access_token']);
  }

  Future<void> _loginWithToken(String token) async {
    // get login and avatar url
    var queryData = await query('''
{
  viewer {
    login
    avatarUrl
  }
}
''', token);
    String login = queryData['viewer']['login'];
    String avatarUrl = queryData['viewer']['avatarUrl'];

    githubAccountMap[login] = AccountModel(avatarUrl: avatarUrl, token: token);

    // write
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'github',
        json.encode(githubAccountMap
            .map((login, account) => MapEntry(login, account.toJson()))));

    setState(() {
      loading = false;
    });
  }

  Future<void> loginToGitlab(String domain, String token) async {
    setState(() {
      loading = true;
    });

    try {
      var res = await http
          .get('$domain/api/v4/user', headers: {'Private-Token': token});
      var info = json.decode(res.body);

      if (info['message'] != null) {
        throw info['message'];
      }

      String login = info['username'];
      String avatarUrl = info['avatar_url'];
      gitlabAccountMap[login] =
          AccountModel(token: token, avatarUrl: avatarUrl, domain: domain);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'gitlab',
          json.encode(gitlabAccountMap
              .map((login, account) => MapEntry(login, account.toJson()))));
    } catch (err) {
      print(err);
      // TODO: show errors
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void _initDataFromPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // read GitHub accounts
    try {
      String str = prefs.getString('github');
      print('read github: $str');

      Map<String, dynamic> data = json.decode(str ?? '{}');
      githubAccountMap = data.map<String, AccountModel>((login, _accountMap) =>
          MapEntry(login, AccountModel.fromJson(_accountMap)));
    } catch (err) {
      print(err);
      githubAccountMap = {};
    }

    try {
      String str = prefs.getString('gitlab');
      print('read gitlab: $str');

      Map<String, dynamic> data = json.decode(str ?? '{}');
      gitlabAccountMap = data.map<String, AccountModel>((login, _accountMap) =>
          MapEntry(login, AccountModel.fromJson(_accountMap)));
    } catch (err) {
      print(err);
      gitlabAccountMap = {};
    }

    int _theme = prefs.getInt('theme');
    print('read theme: $_theme');
    if (ThemeMap.values.contains(_theme)) {
      theme = _theme;
    } else if (Platform.isIOS) {
      theme = ThemeMap.cupertino;
    }

    setState(() {
      ready = true;
    });
  }

  void setActiveAccount(String login, int type) {
    setState(() {
      activeLogin = login;
      activePlatform = type;
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
    // print(data);

    if (data['errors'] != null) {
      throw new Exception(data['errors'].toString());
    }

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
    // print(res.body);
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

    // print(res.body);
    return true;
  }

  Future<dynamic> deleteWithCredentials(String url) async {
    var headers = {HttpHeaders.authorizationHeader: 'token $token'};
    final res = await http
        .delete(prefix + url, headers: headers)
        .timeout(_timeoutDuration);
    // print(res.body);
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
  final SettingsProviderState data;

  _InheritedSettingsProvider({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedSettingsProvider old) => true;
}
