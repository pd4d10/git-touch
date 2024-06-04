import 'dart:async';
import 'dart:convert';

import 'package:ferry/ferry.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/account.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:github/github.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:http/http.dart' as http;
import 'package:nanoid/nanoid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
// import 'package:in_app_review/in_app_review.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart';

const clientId = 'df930d7d2e219f26142a';

class PlatformType {
  static const github = 'github';
  static const gitlab = 'gitlab';
  static const bitbucket = 'bitbucket';
  static const gitea = 'gitea';
  static const gitee = 'gitee';
  static const gogs = 'gogs';
}

class DataWithPage<T> {
  DataWithPage({
    required this.data,
    required this.cursor,
    required this.hasMore,
    required this.total,
  });
  T data;
  int cursor;
  bool hasMore;
  int total;
}

class AuthModel with ChangeNotifier {
  static const _apiPrefix = 'https://api.github.com';

  // static final inAppReview = InAppReview.instance;
  var hasRequestedReview = true;

  List<Account> _accounts = [];
  int? activeAccountIndex;
  late StreamSubscription<Uri?> _sub;
  bool loading = true;

  List<Account>? get accounts => _accounts;
  Account? get activeAccount {
    if (activeAccountIndex == null || _accounts.isEmpty) return null;
    return _accounts[activeAccountIndex!];
  }

  String get token => activeAccount!.token;

  _addAccount(Account account) async {
    _accounts = [...accounts!, account];
    // Save
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageKeys.accounts, json.encode(_accounts));
  }

  removeAccount(int index) async {
    if (activeAccountIndex == index) {
      activeAccountIndex = null;
    }
    _accounts.removeAt(index);
    // Save
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageKeys.accounts, json.encode(_accounts));
    notifyListeners();
  }

  // https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow
  Future<void> _onSchemeDetected(Uri? uri) async {
    await closeInAppWebView();

    loading = true;
    notifyListeners();

    // Get token by code
    final res = await http.post(
      Uri.parse('https://git-touch-oauth.vercel.app/api/token'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode({
        'client_id': clientId,
        'code': uri!.queryParameters['code'],
        'state': _oauthState,
      }),
    );
    final token = json.decode(res.body)['access_token'] as String;
    await loginWithToken(token);
  }

  Future<void> loginWithToken(String t) async {
    try {
      final queryData = await query('''
{
  viewer {
    login
    avatarUrl
  }
}
''', t);

      await _addAccount(Account(
        platform: PlatformType.github,
        domain: 'https://github.com',
        token: t,
        login: queryData['viewer']['login'] as String,
        avatarUrl: queryData['viewer']['avatarUrl'] as String,
      ));
    } finally {
      loading = true;
      notifyListeners();
    }
  }

  Future<void> loginToGitlab(String domain, String token) async {
    domain = domain.trim();
    token = token.trim();
    loading = true;
    notifyListeners();
    try {
      final res = await http.get(Uri.parse('$domain/api/v4/user'),
          headers: {'Private-Token': token});
      final info = json.decode(res.body);
      if (info['message'] != null) {
        throw info['message'];
      }
      if (info['error'] != null) {
        throw info['error'] + '. ' + (info['error_description'] ?? '');
      }
      final user = GitlabUser.fromJson(info);
      await _addAccount(Account(
        platform: PlatformType.gitlab,
        domain: domain,
        token: token,
        login: user.username!,
        avatarUrl: user.avatarUrl!,
        gitlabId: user.id,
      ));
    } finally {
      loading = true;
      notifyListeners();
    }
  }

  Future<String> fetchWithGitlabToken(String p) async {
    final res = await http.get(Uri.parse(p), headers: {'Private-Token': token});
    return res.body;
  }

  Future fetchGitlab(String p,
      {isPost = true, Map<String, dynamic> body = const {}}) async {
    http.Response res;
    if (isPost) {
      res = await http.post(
        Uri.parse('${activeAccount!.domain}/api/v4$p'),
        headers: {
          'Private-Token': token,
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(body),
      );
    } else {
      res = await http.get(Uri.parse('${activeAccount!.domain}/api/v4$p'),
          headers: {'Private-Token': token});
    }
    final info = json.decode(utf8.decode(res.bodyBytes));
    if (info is Map && info['message'] != null) throw info['message'];
    return info;
  }

  Future<DataWithPage> fetchGitlabWithPage(String p) async {
    final res = await http.get(Uri.parse('${activeAccount!.domain}/api/v4$p'),
        headers: {'Private-Token': token});
    final next = int.tryParse(
        res.headers['X-Next-Pages'] ?? res.headers['x-next-page'] ?? '');
    final info = json.decode(utf8.decode(res.bodyBytes));
    if (info is Map && info['message'] != null) throw info['message'];
    return DataWithPage(
      data: info,
      cursor: next ?? 1,
      hasMore: next != null,
      total: int.tryParse(
              res.headers['X-Total'] ?? res.headers['x-total'] ?? '') ??
          kTotalCountFallback,
    );
  }

  Future loginToGitea(String domain, String token) async {
    domain = domain.trim();
    token = token.trim();
    try {
      loading = true;
      notifyListeners();
      final res = await http.get(Uri.parse('$domain/api/v1/user'),
          headers: {'Authorization': 'token $token'});
      final info = json.decode(res.body);
      if (info['message'] != null) {
        throw info['message'];
      }
      final user = GiteaUser.fromJson(info);

      await _addAccount(Account(
        platform: PlatformType.gitea,
        domain: domain,
        token: token,
        login: user.login!,
        avatarUrl: user.avatarUrl!,
      ));
    } finally {
      loading = true;
      notifyListeners();
    }
  }

  Future fetchGitea(
    String p, {
    requestType = 'GET',
    Map<String, dynamic> body = const {},
  }) async {
    late http.Response res;
    final headers = <String, String>{
      'Authorization': 'token $token',
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    switch (requestType) {
      case 'DELETE':
        {
          await http.delete(
            Uri.parse('${activeAccount!.domain}/api/v1$p'),
            headers: headers,
          );
          break;
        }
      case 'POST':
        {
          res = await http.post(
            Uri.parse('${activeAccount!.domain}/api/v1$p'),
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        }
      case 'PATCH':
        {
          res = await http.patch(
            Uri.parse('${activeAccount!.domain}/api/v1$p'),
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        }
      default:
        {
          res = await http.get(Uri.parse('${activeAccount!.domain}/api/v1$p'),
              headers: headers);
          break;
        }
    }
    if (requestType != 'DELETE') {
      final info = json.decode(utf8.decode(res.bodyBytes));
      return info;
    }
    return;
  }

  Future<DataWithPage> fetchGiteaWithPage(String path,
      {int? page, int? limit}) async {
    page = page ?? 1;
    limit = limit ?? kPageSize;

    var uri = Uri.parse('${activeAccount!.domain}/api/v1$path');
    uri = uri.replace(
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        ...uri.queryParameters,
      },
    );
    final res = await http.get(uri, headers: {'Authorization': 'token $token'});
    final info = json.decode(utf8.decode(res.bodyBytes));

    return DataWithPage(
      data: info,
      cursor: page + 1,
      hasMore: info is List && info.isNotEmpty,
      total: int.tryParse(res.headers['x-total-count'] ?? '') ??
          kTotalCountFallback,
    );
  }

  Future loginToGogs(String domain, String token) async {
    domain = domain.trim();
    token = token.trim();
    try {
      loading = true;
      notifyListeners();
      final res = await http.get(Uri.parse('$domain/api/v1/user'),
          headers: {'Authorization': 'token $token'});
      final info = json.decode(res.body);
      if (info['message'] != null) {
        throw info['message'];
      }
      final user = GogsUser.fromJson(info);

      await _addAccount(Account(
        platform: PlatformType.gogs,
        domain: domain,
        token: token,
        login: user.username!,
        avatarUrl: user.avatarUrl!,
      ));
    } finally {
      loading = true;
      notifyListeners();
    }
  }

  // TODO: refactor
  Future fetchGogs(
    String p, {
    requestType = 'GET',
    Map<String, dynamic> body = const {},
  }) async {
    late http.Response res;
    final headers = <String, String>{
      'Authorization': 'token $token',
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    switch (requestType) {
      case 'DELETE':
        {
          await http.delete(
            Uri.parse('${activeAccount!.domain}/api/v1$p'),
            headers: headers,
          );
          break;
        }
      case 'POST':
        {
          res = await http.post(
            Uri.parse('${activeAccount!.domain}/api/v1$p'),
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        }
      case 'PATCH':
        {
          res = await http.patch(
            Uri.parse('${activeAccount!.domain}/api/v1$p'),
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        }
      default:
        {
          res = await http.get(Uri.parse('${activeAccount!.domain}/api/v1$p'),
              headers: headers);
          break;
        }
    }
    if (requestType != 'DELETE') {
      final info = json.decode(utf8.decode(res.bodyBytes));
      return info;
    }
    return;
  }

  Future<DataWithPage> fetchGogsWithPage(String path,
      {int? page, int? limit}) async {
    page = page ?? 1;
    limit = limit ?? kPageSize;

    var uri = Uri.parse('${activeAccount!.domain}/api/v1$path');
    uri = uri.replace(
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        ...uri.queryParameters,
      },
    );
    final res = await http.get(uri, headers: {'Authorization': 'token $token'});
    final info = json.decode(utf8.decode(res.bodyBytes));

    return DataWithPage(
      data: info,
      cursor: page + 1,
      hasMore: info is List && info.isNotEmpty,
      total: int.tryParse(res.headers['x-total-count'] ?? '') ??
          kTotalCountFallback,
    );
  }

  Future fetchGitee(
    String p, {
    requestType = 'GET',
    Map<String, dynamic> body = const {},
  }) async {
    http.Response res;
    final headers = <String, String>{
      'Authorization': 'token $token',
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    switch (requestType) {
      case 'DELETE':
        {
          await http.delete(
            Uri.parse('${activeAccount!.domain}/api/v5$p'),
            headers: headers,
          );
          return;
        }
      case 'PUT':
        {
          await http.put(
            Uri.parse('${activeAccount!.domain}/api/v5$p'),
            headers: headers,
          );
          return;
        }
      case 'POST':
        {
          res = await http.post(
            Uri.parse('${activeAccount!.domain}/api/v5$p'),
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        }
      case 'PATCH':
        {
          res = await http.patch(
            Uri.parse('${activeAccount!.domain}/api/v5$p'),
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        }
      case 'NO CONTENT':
        {
          res = await http.get(Uri.parse('${activeAccount!.domain}/api/v5$p'),
              headers: headers);
          return res;
        }
      default:
        {
          res = await http.get(Uri.parse('${activeAccount!.domain}/api/v5$p'),
              headers: headers);
          break;
        }
    }
    final info = json.decode(utf8.decode(res.bodyBytes));
    return info;
  }

  Future<DataWithPage> fetchGiteeWithPage(String path,
      {int? page, int? limit}) async {
    page = page ?? 1;
    limit = limit ?? kPageSize;

    var uri = Uri.parse('${activeAccount!.domain}/api/v5$path');
    uri = uri.replace(
      queryParameters: {
        'page': page.toString(),
        'per_page': limit.toString(),
        ...uri.queryParameters,
      },
    );
    final res = await http.get(uri, headers: {'Authorization': 'token $token'});
    final info = json.decode(utf8.decode(res.bodyBytes));

    final totalPage = int.tryParse(res.headers['total_page'] ?? '');
    final totalCount =
        int.tryParse(res.headers['total_count'] ?? '') ?? kTotalCountFallback;

    return DataWithPage(
      data: info,
      cursor: page + 1,
      hasMore: totalPage == null ? info.length > limit : totalPage > page,
      total: totalCount,
    );
  }

  Future loginToBb(String domain, String username, String appPassword) async {
    domain = domain.trim();
    username = username.trim();
    appPassword = appPassword.trim();
    try {
      loading = true;
      notifyListeners();
      final uri = Uri.parse('$domain/api/2.0/user')
          .replace(userInfo: '$username:$appPassword');
      final res = await http.get(uri);
      if (res.statusCode >= 400) {
        throw 'status ${res.statusCode}';
      }
      final info = json.decode(res.body);
      final user = BbUser.fromJson(info);
      await _addAccount(Account(
        platform: PlatformType.bitbucket,
        domain: domain,
        token: user.username!,
        login: username,
        avatarUrl: user.avatarUrl!,
        appPassword: appPassword,
        accountId: user.accountId,
      ));
    } finally {
      loading = true;
      notifyListeners();
    }
  }

  Future<http.Response> fetchBb(
    String p, {
    isPost = true,
    Map<String, dynamic> body = const {},
  }) async {
    if (p.startsWith('/') && !p.startsWith('/api')) p = '/api/2.0$p';
    final input = Uri.parse(p);
    final uri = Uri.parse(activeAccount!.domain).replace(
      userInfo: '${activeAccount!.login}:${activeAccount!.appPassword}',
      path: input.path,
      queryParameters: {
        'pagelen': kPageSize.toString(),
        ...input.queryParameters
      },
    );
    if (isPost) {
      return http.post(
        uri,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(body),
      );
    }
    return http.get(uri);
  }

  Future fetchBbJson(
    String p, {
    isPost = true,
    Map<String, dynamic> body = const {},
  }) async {
    final res = await fetchBb(
      p,
      isPost: isPost,
      body: body,
    );
    return json.decode(utf8.decode(res.bodyBytes));
  }

  Future<ListPayload<dynamic, String?>> fetchBbWithPage(String p) async {
    final data = await fetchBbJson(p);
    final v = BbPagination.fromJson(data);
    return ListPayload(
      cursor: v.next,
      items: v.values,
      hasMore: v.next != null,
    );
  }

  Future loginToGitee(String token) async {
    token = token.trim();
    try {
      loading = true;
      notifyListeners();
      final res = await http.get(Uri.parse('https://gitee.com/api/v5/user'),
          headers: {'Authorization': 'token $token'});
      final info = json.decode(res.body);
      if (info['message'] != null) {
        throw info['message'];
      }
      final user = GiteeUser.fromJson(info);

      await _addAccount(Account(
        platform: PlatformType.gitee,
        domain: 'https://gitee.com',
        token: token,
        login: user.login!,
        avatarUrl: user.avatarUrl!,
      ));
    } finally {
      loading = true;
      notifyListeners();
    }
  }

  Future<void> init() async {
    // Listen scheme
    _sub = uriLinkStream.listen(_onSchemeDetected, onError: (err) {
      Fimber.e('getUriLinksStream failed', ex: err);
    });

    final prefs = await SharedPreferences.getInstance();

    // Read accounts
    try {
      final str = prefs.getString(StorageKeys.accounts);
      // Fimber.d('read accounts: $str');
      _accounts = (json.decode(str ?? '[]') as List)
          .map((item) => Account.fromJson(item))
          .toList();
      activeAccountIndex = prefs.getInt(StorageKeys.iDefaultAccount);

      if (activeAccount != null) {
        _activeTab = prefs.getInt(
                StorageKeys.getDefaultStartTabKey(activeAccount!.platform)) ??
            0;
      }
    } catch (err) {
      Fimber.e('prefs getAccount failed', ex: err);
      _accounts = [];
    }

    notifyListeners();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  Future<void> setDefaultAccount(int v) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.iDefaultAccount, v);
    Fimber.d('write default account: $v');
    notifyListeners();
  }

  var rootKey = UniqueKey();
  reloadApp() {
    rootKey = UniqueKey();
    notifyListeners();
  }

  setActiveAccountAndReload(int index) async {
    // https://stackoverflow.com/a/50116077
    rootKey = UniqueKey();
    activeAccountIndex = index;
    setDefaultAccount(activeAccountIndex!);
    final prefs = await SharedPreferences.getInstance();
    _activeTab = prefs.getInt(
            StorageKeys.getDefaultStartTabKey(activeAccount!.platform)) ??
        0;
    _ghClient = null;
    _ghGqlClient = null;
    _glGqlClient = null;
    notifyListeners();

    // TODO: strategy
    // waiting for 1min to request review
    // if (!hasRequestedReview) {
    //   hasRequestedReview = true;
    //   Timer(Duration(minutes: 1), () async {
    //     if (await inAppReview.isAvailable()) {
    //       inAppReview.requestReview();
    //     }
    //   });
    // }
  }

  // http timeout
  final _timeoutDuration = const Duration(seconds: 10);
  // var _timeoutDuration = Duration(seconds: 1);

  GitHub? _ghClient;
  GitHub get ghClient {
    _ghClient ??= GitHub(auth: Authentication.withToken(token));
    return _ghClient!;
  }

  Client? _ghGqlClient;
  Client get ghGqlClient {
    return _ghGqlClient ??= Client(
      link: HttpLink(
        '$_apiPrefix/graphql',
        defaultHeaders: {HttpHeaders.authorizationHeader: 'token $token'},
      ),
      // https://ferrygraphql.com/docs/fetch-policies#default-fetchpolicies
      defaultFetchPolicies: {OperationType.query: FetchPolicy.NetworkOnly},
    );
  }

  Client? _glGqlClient;
  Client get glGqlClient {
    return _glGqlClient ??= Client(
      link: HttpLink(
        Uri.parse(activeAccount!.domain)
            .replace(path: '/api/graphql')
            .toString(),
        defaultHeaders: {'Private-Token': token},
      ),
      // https://ferrygraphql.com/docs/fetch-policies#default-fetchpolicies
      defaultFetchPolicies: {OperationType.query: FetchPolicy.NetworkOnly},
    );
  }

  Future<dynamic> query(String query, [String? t]) async {
    t ??= token;

    final res = await http
        .post(Uri.parse('$_apiPrefix/graphql'),
            headers: {
              HttpHeaders.authorizationHeader: 'token $t',
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: json.encode({'query': query}))
        .timeout(_timeoutDuration);

    // Fimber.d(res.body);
    final data = json.decode(res.body);

    if (data['errors'] != null) {
      throw data['errors'][0]['message'];
    }

    return data['data'];
  }

  String? _oauthState;
  void redirectToGithubOauth([publicOnly = true]) {
    _oauthState = nanoid();
    final repoScope = publicOnly ? 'public_repo' : 'repo';
    final scope = Uri.encodeComponent(
        ['user', repoScope, 'read:org', 'notifications'].join(','));
    launchStringUrl(
      'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=gittouch://login&scope=$scope&state=$_oauthState',
    );
  }

  int _activeTab = 0;
  int get activeTab => _activeTab;

  Future<void> setActiveTab(int v) async {
    _activeTab = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
        StorageKeys.getDefaultStartTabKey(activeAccount!.platform), v);
    Fimber.d('write default start tab for ${activeAccount!.platform}: $v');
    notifyListeners();
  }
}
