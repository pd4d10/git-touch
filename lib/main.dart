import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'providers/providers.dart';
import 'providers/settings.dart';
import 'screens/screens.dart';
import 'screens/inbox.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int active = 0;

  Widget _buildNotificationIcon(BuildContext context) {
    int count = NotificationProvider.of(context).count;
    if (count == 0) {
      return Icon(Icons.notifications);
    }

    // String text = count > 99 ? '99+' : count.toString();

    // https://stackoverflow.com/a/45434404
    return new Stack(children: <Widget>[
      new Icon(Icons.notifications),
      new Positioned(
        // draw a red marble
        top: 0.0,
        right: 0.0,
        child: new Icon(Icons.brightness_1, size: 8.0, color: Colors.redAccent),
      )
    ]);
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.rss_feed),
        title: Text('News'),
      ),
      BottomNavigationBarItem(
        icon: _buildNotificationIcon(context),
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
    ];
  }

  _buildScreen(int index) {
    switch (index) {
      case 0:
        return NewsScreen();
      case 1:
        return NotificationScreen();
      case 2:
        return SearchScreen();
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
                // primaryColor: Color(0xff24292e),
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
  final SearchBloc searchBloc;

  App(this.searchBloc);

  @override
  build(context) {
    return SearchProvider(
      bloc: searchBloc,
      child: NotificationProvider(
        child: SettingsProvider(
          child: DefaultTextStyle(
            // style: TextStyle(color: Color(0xff24292e)),
            style: TextStyle(color: Colors.black),
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
  SearchBloc searchBloc = SearchBloc();

  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  // print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

  // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

  runApp(App(searchBloc));
}
