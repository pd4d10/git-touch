import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'providers/providers.dart';
import 'providers/settings.dart';
import 'screens/screens.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int active = 0;

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.rss_feed),
        title: Text('News'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text('Search'),
      ),
      BottomNavigationBarItem(
        icon: StreamBuilder<int>(builder: (context, snapshot) {
          int count = snapshot.data;
          // print(count);

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
        icon: Icon(Icons.person),
        title: Text('Me'),
      ),
    ];
  }

  _buildScreen(int index) {
    switch (index) {
      case 0:
        return NewsScreen();
      case 1:
        return SearchScreen();
      case 2:
        return NotificationScreen();
      case 3:
        return ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).layout) {
      case LayoutMap.cupertino:
        return CupertinoApp(
          home: CupertinoTheme(
            data: CupertinoThemeData(
                // brightness: Brightness.dark,
                // barBackgroundColor: Color.fromRGBO(0x24, 0x29, 0x2e, 1),
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
          home: Scaffold(
            // appBar: AppBar(title: Text('Home')),
            body: _buildScreen(active),
            bottomNavigationBar: BottomNavigationBar(
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
  final isIos = Platform.isIOS;
  final NotificationBloc notificationBloc;
  final SearchBloc searchBloc;

  App(this.notificationBloc, this.searchBloc);

  @override
  build(context) {
    return SearchProvider(
      bloc: searchBloc,
      child: NotificationProvider(
        bloc: notificationBloc,
        child: SettingsProvider(
          child: DefaultTextStyle(
            style: TextStyle(color: Color(0xff24292e)),
            child: Home(),
            // theme: ThemeData(
            //   textTheme: TextTheme(
            //     title: TextStyle(color: Colors.red),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}

void main() async {
  NotificationBloc notificationBloc = NotificationBloc();
  SearchBloc searchBloc = SearchBloc();

  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  // print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

  // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

  runApp(App(notificationBloc, searchBloc));
}
