import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/settings.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/issues.dart';
import 'package:git_touch/screens/repo.dart';
import 'package:git_touch/screens/user.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/notification.dart';
import 'screens/news.dart';
import 'screens/notifications.dart';
import 'screens/search.dart';
import 'screens/login.dart';
import 'screens/issue.dart';
import 'screens/repos.dart';
import 'screens/organization.dart';
import 'screens/trending.dart';
import 'utils/utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int active = 0;
  // String login;

  @override
  void initState() {
    super.initState();
    nextTick(() {
      // FIXME:
      Provider.of<ThemeModel>(context).init();
      Provider.of<SettingsModel>(context).init();
    });
  }

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

  List<BottomNavigationBarItem> _buildNavigationItems() {
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
        return UserScreen(
          Provider.of<SettingsModel>(context).activeLogin,
          isMe: true,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<SettingsModel>(context);
    var themData = ThemeData(
      // primaryColor: HSLColor.fromColor(Palette.primary)
      //     .withLightness(0.3)
      //     .toColor(),
      // primaryColor: Color(0xff333333),
      primaryColor: PrimerColors.gray900,
      accentColor: PrimerColors.gray900,
    );

    // TODO:
    if (!settings.ready || !Provider.of<ThemeModel>(context).ready) {
      return MaterialApp(theme: themData, home: Scaffold(body: Text('a')));
    }

    // print(settings.activeLogin);
    if (settings.activeLogin == null) {
      return MaterialApp(theme: themData, home: LoginScreen());
    }

    switch (Provider.of<ThemeModel>(context).theme) {
      case ThemeMap.cupertino:
        return CupertinoApp(
          home: CupertinoTheme(
            data: CupertinoThemeData(
              primaryColor: PrimerColors.blue500,
            ),
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(items: _buildNavigationItems()),
              tabBuilder: (context, index) {
                return CupertinoTabView(builder: (context) {
                  return _buildScreen(index);
                });
              },
            ),
          ),
        );
      default:
        return MaterialApp(
          theme: themData,
          home: Scaffold(
            body: _buildScreen(active),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: PrimerColors.blue500,
              // unselectedItemColor: PrimerColors.gray500,
              items: _buildNavigationItems(),
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

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => NotificationModel()),
        ChangeNotifierProvider(builder: (context) => ThemeModel()),
        ChangeNotifierProvider(builder: (context) => SettingsModel()),
      ],
      child: Home(),
    );
  }
}

void main() async {
  // Platform messages may fail, so we use a try/catch PlatformException.

  // try {
  //   String initialLink = await getInitialLink();
  //   print(initialLink);
  // } on PlatformException {
  //   print('test');
  // }

  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  // print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

  // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

  runApp(App());
}
