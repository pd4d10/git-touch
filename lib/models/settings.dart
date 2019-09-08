import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:uni_links/uni_links.dart';
import 'package:nanoid/nanoid.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../utils/utils.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';
import 'account.dart';

class PlatformType {
  static const github = 'github';
  static const gitlab = 'gitlab';
}

// abstract class Model<T> {
//   Future<T> query(BuildContext context) {
//     var settings = Provider.of<SettingsModel>(context);

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

class SettingsModel with ChangeNotifier {
  bool ready = false;

  Map<String, AccountModel> githubAccountMap;
  Map<String, Map<String, Map<String, AccountModel>>> accountMap;

  String activePlatform;
  String activeDomain;
  String activeLogin;

  StreamSubscription<Uri> _sub;
  bool loading = false;

  // PlatformType platformType;

  String _apiPrefix = 'https://api.github.com';

  String get token {
    if (activeLogin == null) return null;

    switch (activePlatform) {
      case PlatformType.github:
        return githubAccountMap[activeLogin].token;
      default:
        return accountMap[activePlatform][activeDomain][activeLogin].token;
    }
  }

  // https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow
  Future<void> _onSchemeDetected(Uri uri) async {
    await closeWebView();

    loading = true;
    notifyListeners();

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
        'state': _oauthState,
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
        StorageKeys.github,
        json.encode(githubAccountMap
            .map((login, account) => MapEntry(login, account.toJson()))));

    loading = false;
    notifyListeners();
  }

  Future<void> loginToGitlab(String domain, String token) async {
    loading = true;
    notifyListeners();

    try {
      var res = await http
          .get('$domain/api/v4/user', headers: {'Private-Token': token});
      var info = json.decode(res.body);

      if (info['message'] != null) {
        throw info['message'];
      }

      String login = info['username'];
      String avatarUrl = info['avatar_url'];

      if (accountMap[PlatformType.gitlab] == null)
        accountMap[PlatformType.gitlab] = {};
      if (accountMap[PlatformType.gitlab][domain] == null)
        accountMap[PlatformType.gitlab][domain] = {};

      accountMap[PlatformType.gitlab][domain][login] =
          AccountModel(token: token, avatarUrl: avatarUrl);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String str = json.encode(accountMap.map((type, v0) {
        return MapEntry(type, v0.map((domain, v1) {
          return MapEntry(domain, v1.map((login, v2) {
            return MapEntry(login, v2.toJson());
          }));
        }));
      }));
      await prefs.setString(StorageKeys.account, str);
    } catch (err) {
      print(err);
      // TODO: show errors
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void init() async {
    _sub = getUriLinksStream().listen(_onSchemeDetected, onError: (err) {
      print(err);
    });

    var prefs = await SharedPreferences.getInstance();

    // read GitHub accounts
    try {
      String str = prefs.getString(StorageKeys.github);
      print('read github: $str');

      Map<String, dynamic> data = json.decode(str ?? '{}');
      githubAccountMap = data.map<String, AccountModel>((login, _accountMap) =>
          MapEntry(login, AccountModel.fromJson(_accountMap)));
    } catch (err) {
      print(err);
      githubAccountMap = {};
    }

    // read accounts
    try {
      String str = prefs.getString(StorageKeys.account);
      print('read account: $str');

      var data = Map<String, Map<String, dynamic>>.from(
          Map<String, dynamic>.from(json.decode(str ?? '{}')));

      accountMap = {};
      data.forEach((platform, v0) {
        accountMap[platform] = {};
        v0.forEach((domain, v1) {
          accountMap[platform][domain] = {};
          v1.forEach((login, v2) {
            accountMap[platform][domain][login] = AccountModel.fromJson(v2);
          });
        });
      });

      // TODO: type cast
      // accountMap = data.map((type, v0) {
      //   return MapEntry(type, v0.map((domain, v1) {
      //     return MapEntry(domain, v1.map((login, v2) {
      //       return MapEntry(login, AccountModel.fromJson(v2));
      //     }));
      //   }));
      // });
    } catch (err) {
      print(err);
      accountMap = {};
    }

    ready = true;
    notifyListeners();
  }

  void setActiveAccount(String platform, String domain, String login) {
    activePlatform = platform;
    activeDomain = domain;
    activeLogin = login;
    notifyListeners();
  }

  Map<String, String> get _headers =>
      {HttpHeaders.authorizationHeader: 'token $token'};

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
        .post(_apiPrefix + '/graphql',
            headers: {
              HttpHeaders.authorizationHeader: 'token $_token',
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: json.encode({'query': query}))
        .timeout(_timeoutDuration);

    // print(res.body);
    final data = json.decode(res.body);

    if (data['errors'] != null) {
      throw Exception(data['errors'][0]['message']);
    }

    return data['data'];
  }

  Future<dynamic> getWithCredentials(String url, {String contentType}) async {
    var headers = _headers;
    if (contentType != null) {
      // https://developer.github.com/v3/repos/contents/#custom-media-types
      headers[HttpHeaders.contentTypeHeader] = contentType;
    }
    final res = await http
        .get(_apiPrefix + url, headers: headers)
        .timeout(_timeoutDuration);
    // print(res.body);
    final data = json.decode(res.body);
    return data;
  }

  Future<void> patchWithCredentials(String url) async {
    await http
        .patch(_apiPrefix + url, headers: _headers)
        .timeout(_timeoutDuration);
  }

  Future<void> putWithCredentials(String url,
      {String contentType, String body}) async {
    await http
        .put(_apiPrefix + url, headers: _headers, body: body ?? {})
        .timeout(_timeoutDuration);
  }

  Future<void> postWithCredentials(String url,
      {String contentType, String body}) async {
    final res = await http
        .post(_apiPrefix + url, headers: _headers, body: body ?? {})
        .timeout(_timeoutDuration);
    // print(res.body);
  }

  Future<void> deleteWithCredentials(String url) async {
    await http
        .delete(_apiPrefix + url, headers: _headers)
        .timeout(_timeoutDuration);
  }

  String _oauthState;
  void redirectToGithubOauth() {
    _oauthState = nanoid();
    launch(
      'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=gittouch://login&scope=user%20repo&state=$_oauthState',
    );
  }
}
