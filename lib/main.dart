import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/commits.dart';
import 'package:git_touch/screens/credits.dart';
import 'package:git_touch/screens/gitlab_issue.dart';
import 'package:git_touch/screens/gitlab_todos.dart';
import 'package:git_touch/screens/gitlab_user.dart';
import 'package:git_touch/screens/issue_form.dart';
import 'package:git_touch/screens/issues.dart';
import 'package:git_touch/screens/notification.dart';
import 'package:git_touch/screens/object.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/screens/repositories.dart';
import 'package:git_touch/screens/settings.dart';
import 'package:git_touch/screens/user.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/notification.dart';
import 'package:fluro/fluro.dart';
import 'screens/news.dart';
import 'screens/search.dart';
import 'screens/login.dart';
import 'screens/issue.dart';
import 'screens/trending.dart';
import 'utils/utils.dart';
import 'package:fimber/fimber.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int active = 0;
  // String login;

  Widget _buildNotificationIcon(BuildContext context, bool isActive) {
    final iconData = isActive ? Icons.notifications : Icons.notifications_none;
    int count = Provider.of<NotificationModel>(context).count;
    if (count == 0) {
      return Icon(iconData);
    }

    // String text = count > 99 ? '99+' : count.toString();
    return Stack(
      children: <Widget>[
        Icon(iconData),
        Positioned(
            right: -2,
            top: -2,
            child: Icon(Octicons.primitive_dot,
                color: PrimerColors.red500, size: 14))
      ],
    );
  }

  List<BottomNavigationBarItem> get _navigationItems {
    switch (Provider.of<AuthModel>(context).activeAccount.platform) {
      case PlatformType.github:
        return [
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: _buildNotificationIcon(context, false),
            activeIcon: _buildNotificationIcon(context, true),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text('Trending'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ];
      case PlatformType.gitlab:
        return [
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            title: Text('Todos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ];
    }
  }

  _buildScreen(int index) {
    // return IssuesScreen(owner: 'flutter', name: 'flutter', isPullRequest: true);
    // return IssueScreen(number: 29, owner: 'reactjs', name: 'rfcs');
    // return IssueScreen(
    //     number: 68, owner: 'reactjs', name: 'rfcs', isPullRequest: true);
    // return ReposScreen('pd4d10');
    // return OrganizationScreen('flutter');
    // return TrendingScreen();
    // return RepoScreen('flutter', 'flutter');
    // return Image.asset('images/spinner.webp', width: 32, height: 32);
    final auth = Provider.of<AuthModel>(context);

    switch (auth.activeAccount.platform) {
      case PlatformType.github:
        switch (index) {
          case 0:
            return NewsScreen();
          case 1:
            return NotificationScreen();
          case 2:
            return TrendingScreen();
          case 3:
            return SearchScreen();
          case 4:
            return UserScreen(auth.activeAccount.login);
        }
        break;
      case PlatformType.gitlab:
        switch (index) {
          case 0:
            return GitlabTodosScreen();
          case 1:
            return GitlabUserScreen(auth.activeAccount.login);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);

    final themData = ThemeData(
      brightness: theme.brightness,
      primaryColor: PrimerColors.white,
      accentColor: PrimerColors.blue500,
    );

    // TODO:
    if (!auth.ready || !Provider.of<ThemeModel>(context).ready) {
      return MaterialApp(theme: themData, home: Scaffold(body: Text('a')));
    }

    // Fimber.d(settings.activeLogin);
    if (auth.activeAccount == null) {
      return MaterialApp(theme: themData, home: LoginScreen());
    }

    switch (theme.theme) {
      case AppThemeType.cupertino:
        return CupertinoApp(
          theme: CupertinoThemeData(
            brightness: theme.brightness,
            primaryColor: PrimerColors.blue500,
          ),
          home: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: _navigationItems),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return _buildScreen(index);
                },
              );
            },
          ),
        );
      default:
        return MaterialApp(
          theme: themData,
          home: Scaffold(
            body: _buildScreen(active),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: PrimerColors.blue500,
              items: _navigationItems,
              currentIndex: active,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  active = index;
                });
              },
            ),
          ),
        );
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Platform messages may fail, so we use a try/catch PlatformException.

  // try {
  //   String initialLink = await getInitialLink();
  //   Fimber.d(initialLink);
  // } on PlatformException {
  //   Fimber.d('test');
  // }

  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  // Fimber.d('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

  // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // Fimber.d('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

  // TODO: Later, should check to enable debug log in debug build only
  Fimber.plantTree(DebugTree());

  final notificationModel = NotificationModel();
  final themeModel = ThemeModel();
  final authModel = AuthModel();
  final codeModel = CodeModel();
  await Future.wait([
    themeModel.init(),
    authModel.init(),
    codeModel.init(),
  ]);

  // github
  themeModel.router.define('/login', handler: Handler(
    handlerFunc: (context, params) {
      return LoginScreen();
    },
  ));
  themeModel.router.define('/settings', handler: Handler(
    handlerFunc: (context, params) {
      return SettingsScreen();
    },
  ));
  themeModel.router.define('/help/credits', handler: Handler(
    handlerFunc: (context, params) {
      return CreditsScreen();
    },
  ));
  themeModel.router.define('/:login', handler: Handler(
    handlerFunc: (context, params) {
      return UserScreen(params['login'].first);
    },
  ));
  themeModel.router.define('/:owner/:name', handler: Handler(
    handlerFunc: (context, params) {
      if (params['ref'] == null) {
        return RepositoryScreen(params['owner'].first, params['name'].first);
      } else {
        return RepositoryScreen(params['owner'].first, params['name'].first,
            branch: params['ref'].first);
      }
    },
  ));
  themeModel.router.define('/:owner/:name/issues', handler: Handler(
    handlerFunc: (context, params) {
      return IssuesScreen(params['owner'].first, params['name'].first);
    },
  ));
  themeModel.router.define('/:owner/:name/pulls', handler: Handler(
    handlerFunc: (context, params) {
      return IssuesScreen(params['owner'].first, params['name'].first,
          isPullRequest: true);
    },
  ));
  themeModel.router.define('/:owner/:name/issues/:number', handler: Handler(
    handlerFunc: (context, params) {
      return IssueScreen(params['owner'].first, params['name'].first,
          int.parse(params['number'].first));
    },
  ));
  themeModel.router.define('/:owner/:name/pulls/:number', handler: Handler(
    handlerFunc: (context, params) {
      return IssueScreen(
        params['owner'].first,
        params['name'].first,
        int.parse(params['number'].first),
        isPullRequest: true,
      );
    },
  ));
  themeModel.router.define('/:owner/:name/commits', handler: Handler(
    handlerFunc: (context, params) {
      return CommitsScreen(params['owner'].first, params['name'].first);
    },
  ));
  themeModel.router.define('/:owner/:name/blob/:ref', handler: Handler(
    handlerFunc: (context, params) {
      final pathParam = params['path'];
      return ObjectScreen(
        params['owner'].first,
        params['name'].first,
        params['ref'].first,
        paths: pathParam?.first?.urldecode?.split('/') ?? [],
      );
    },
  ));
  themeModel.router.define('/:owner/:name/issues/new', handler: Handler(
    handlerFunc: (context, params) {
      return IssueFormScreen(params['owner'].first, params['name'].first);
    },
  ));

  // gitlab
  themeModel.router.define('/project/:id/issue/:iid', handler: Handler(
    handlerFunc: (context, params) {
      return GitlabIssueScreen(
          int.parse(['id'].first), int.parse(params['iid'].first));
    },
  ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => notificationModel),
      ChangeNotifierProvider(create: (context) => themeModel),
      ChangeNotifierProvider(create: (context) => authModel),
      ChangeNotifierProvider(create: (context) => codeModel),
    ],
    child: Home(),
  ));
}
