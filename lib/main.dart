import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'ios/main.dart';
import 'providers/event.dart';
import 'providers/notification.dart';
import 'providers/search.dart';

class App extends StatelessWidget {
  final isIos = true;
  final EventBloc eventBloc;
  final NotificationBloc notificationBloc;
  final SearchBloc searchBloc;

  App(this.eventBloc, this.notificationBloc, this.searchBloc);

  @override
  build(context) {
    return SearchProvider(
      bloc: searchBloc,
      child: NotificationProvider(
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
      ),
    );
  }
}

void main() {
  EventBloc eventBloc = EventBloc();
  NotificationBloc notificationBloc = NotificationBloc();
  SearchBloc searchBloc = SearchBloc();

  runApp(App(eventBloc, notificationBloc, searchBloc));
}
