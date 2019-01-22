import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'dart:io';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'android/main.dart';
import 'ios/main.dart';
// import 'token.dart';

class App extends StatelessWidget {
  final isIos = true;

  // final ValueNotifier<GraphQLClient> client = ValueNotifier(
  //   GraphQLClient(
  //     cache: InMemoryCache(),
  //     link: HttpLink(
  //       uri: 'https://api.github.com/graphql',
  //       headers: {HttpHeaders.authorizationHeader: 'token $token'},
  //     ),
  //   ),
  // );

  @override
  build(context) {
    return MaterialApp(
      title: 'GitFlux',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTextStyle(
        style: TextStyle(color: CupertinoColors.black),
        child: IosHomePage(title: 'GitFlux'),
      ),
      routes: {
        // '/notification': (context) =>  IosNotificationTab(),
        // '/profile': (context) =>  IosProfileTab(),
      },
    );
  }
}

void main() => runApp(App());
