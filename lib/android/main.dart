import 'package:flutter/material.dart';
import 'user.dart';
import 'home.dart';

class AndroidHomePage extends StatefulWidget {
  AndroidHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AndroidHomePageState createState() => _AndroidHomePageState();
}

class _AndroidHomePageState extends State<AndroidHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  message() {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text('Refresh complete'),
        action: SnackBarAction(
          label: 'RETRY',
          onPressed: () {
            // _refreshIndicatorKey.currentState.show();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('123'),
              accountEmail: Text('xxx@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://avatars0.githubusercontent.com/u/9524411',
                ),
              ),
              margin: EdgeInsets.zero,
              // onDetailsPressed: () {
              // },
            ),
            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 8.0),
                  children: [
                    Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: ['Home', 'Settings'].map((id) {
                            return ListTile(
                              // leading:  CircleAvatar(child:  Text(id)),
                              title: Text(id),
                              onTap: () {
                                var route = PageRouteBuilder(
                                  settings: RouteSettings(
                                    name: 'test',
                                    isInitialRoute: false,
                                  ),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return UserPage('a', 'avatar');
                                  },
                                );

                                Navigator.of(context).push(route);
                              },
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: HomePage(message),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
