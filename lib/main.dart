import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_flux/providers/providers.dart';
import 'package:git_flux/ios/main.dart';
import 'package:git_flux/screens/screens.dart';

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
            home: DefaultTextStyle(
              style: TextStyle(color: Color(0xff24292e)),
              child: IosHomePage(title: 'GitFlux'),
              // child: IssueScreen(11609, 'flutter', 'flutter'),
            ),
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

void main() {
  EventBloc eventBloc = EventBloc();
  NotificationBloc notificationBloc = NotificationBloc();
  SearchBloc searchBloc = SearchBloc();

  runApp(App(eventBloc, notificationBloc, searchBloc));
}
