import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'notification.dart';
import 'search.dart';
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
    return CupertinoTheme(
      data: CupertinoThemeData(
          // brightness: Brightness.dark,
          // barBackgroundColor: Color.fromRGBO(0x24, 0x29, 0x2e, 1),
          ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed),
              title: Text('News'),
            ),
            BottomNavigationBarItem(
              icon: StreamBuilder<int>(builder: (context, snapshot) {
                int count = snapshot.data;
                print(count);

                // https://stackoverflow.com/a/45434404
                if (count != null && count > 0) {
                  return Stack(children: <Widget>[
                    Icon(Icons.notifications),
                    Positioned(
                      // draw a red marble
                      top: 0,
                      right: 0,
                      child: Icon(Icons.brightness_1,
                          size: 8.0, color: Colors.redAccent),
                    )
                  ]);
                } else {
                  return Icon(Icons.notifications);
                }
              }),
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
