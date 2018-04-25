import 'package:flutter/material.dart';
import 'android/main.dart';
import 'ios/main.dart';

class App extends StatelessWidget {
  final isIos = true;

  @override
  build(context) {
    return new MaterialApp(
      title: 'GitFlux',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isIos ? new IosHomePage(title: 'GitFlux') : new AndroidHomePage(title: 'GitFlux'),
      routes: {
        // '/notification': (context) => new IosNotificationTab(),
        // '/profile': (context) => new IosProfileTab(),
      },
    );
  }
}

void main() => runApp(new App());
