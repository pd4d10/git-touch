import 'package:flutter/material.dart';
import 'android/main.dart';
import 'ios/main.dart';

class App extends StatelessWidget {
  final isIos = false;

  @override
  build(context) {
    return MaterialApp(
      title: 'GitFlux',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isIos
          ? IosHomePage(title: 'GitFlux')
          : AndroidHomePage(title: 'GitFlux'),
      routes: {
        // '/notification': (context) =>  IosNotificationTab(),
        // '/profile': (context) =>  IosProfileTab(),
      },
    );
  }
}

void main() => runApp(App());
