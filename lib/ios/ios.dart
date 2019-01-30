import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';
import 'news.dart';
import 'notification.dart';
import 'search.dart';
import 'profile.dart';

class IosHome extends StatefulWidget {
  IosHome({Key key}) : super(key: key);

  @override
  _IosHomeState createState() => _IosHomeState();
}

class _IosHomeState extends State<IosHome> {
  @override
  Widget build(context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
          // brightness: Brightness.dark,
          // barBackgroundColor: Color.fromRGBO(0x24, 0x29, 0x2e, 1),
          ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: buildNavigationItems()),
        tabBuilder: (context, index) {
          return CupertinoTabView(builder: (context) {
            switch (index) {
              case 0:
                return NewsScreen();
              case 1:
                return NotificationScreen();
              case 2:
                return SearchScreen();
              case 3:
                return ProfileScreen();
              default:
            }
          });
        },
      ),
    );
  }
}
