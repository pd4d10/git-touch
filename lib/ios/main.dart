import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'notification.dart';
import 'profile.dart';
import 'issue.dart';

class IosHomePage extends StatefulWidget {
  IosHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IosHomePageState createState() => _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble),
              title: Text('Notification'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              title: Text('Profile'),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return DefaultTextStyle(
            style: TextStyle(
              // fontFamily: '.SF UI Text',
              // fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: CupertinoTabView(
              builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return IosHomeTab();
                    break;
                  case 1:
                    return IosNotificationTab();
                    break;
                  case 2:
                    return IosProfileTab();
                    break;
                  default:
                }
              },
            ),
          );
        },
      ),
    );
  }
}
