import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'notification.dart';
import 'profile.dart';

class IosHomePage extends StatefulWidget {
  IosHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IosHomePageState createState() => _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {
  @override
  Widget build(context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notification'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Me'),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(builder: (context) {
            switch (index) {
              case 0:
                return HomeScreen();
              case 1:
                return NotificationScreen();
              case 2:
                return ProfileScreen();
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
