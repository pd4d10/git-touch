import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'dart:io';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'android/main.dart';
import 'ios/main.dart';
// import 'token.dart';
import 'providers/event.dart';
import 'providers/notification.dart';

class App extends StatelessWidget {
  final isIos = true;
  final EventBloc eventBloc;
  final NotificationBloc notificationBloc;

  App(this.eventBloc, this.notificationBloc);

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
    return NotificationProvider(
      bloc: notificationBloc,
      child: EventProvider(
        bloc: eventBloc,
        child: MaterialApp(
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
        ),
      ),
    );
  }
}

void main() {
  EventBloc eventBloc = EventBloc();
  NotificationBloc notificationBloc = NotificationBloc();

  runApp(App(eventBloc, notificationBloc));
}
