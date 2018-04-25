import 'package:flutter/material.dart';

class AndroidHomePage extends StatefulWidget {
  AndroidHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AndroidHomePageState createState() => new _AndroidHomePageState();
}

class _AndroidHomePageState extends State<AndroidHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        child: new Column(
          children: [
            new UserAccountsDrawerHeader(
              accountName: const Text('xxx'),
              accountEmail: const Text('xxx@gmail.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: const NetworkImage(
                  'https://avatars0.githubusercontent.com/u/9524411',
                ),
              ),
              margin: EdgeInsets.zero,
              // onDetailsPressed: () {
              // },
            ),
            new MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: new Expanded(
                child: new ListView(
                  padding: const EdgeInsets.only(top: 8.0),
                  children: <Widget>[
                    new Stack(
                      children: [
                        new Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: ['A', 'B'].map((String id) {
                            return new ListTile(
                              leading: new CircleAvatar(child: new Text(id)),
                              title: new Text('Drawer item $id'),
                              onTap: () {},
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
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
