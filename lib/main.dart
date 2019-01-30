import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_flux/providers/providers.dart';
import 'package:git_flux/providers/settings.dart';
import 'package:git_flux/ios/ios.dart';
import 'package:git_flux/android/android.dart';

class App extends StatelessWidget {
  final isIos = Platform.isIOS;
  final SettingsBloc settingsBloc;
  final NotificationBloc notificationBloc;
  final SearchBloc searchBloc;

  App(this.settingsBloc, this.notificationBloc, this.searchBloc);

  _buildScreen() {
    // return IssueScreen(11609, 'flutter', 'flutter');

    // return IosHome();

    if (Platform.isIOS) {
      return IosHome();
    } else if (Platform.isAndroid) {
      return AndroidHome();
    }
  }

  @override
  build(context) {
    return SearchProvider(
      bloc: searchBloc,
      child: NotificationProvider(
        bloc: notificationBloc,
        child: EventProvider(
          bloc: settingsBloc,
          child: MaterialApp(
            home: DefaultTextStyle(
              style: TextStyle(color: Color(0xff24292e)),
              child: _buildScreen(),
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

void main() async {
  SettingsBloc eventBloc = SettingsBloc();
  NotificationBloc notificationBloc = NotificationBloc();
  SearchBloc searchBloc = SearchBloc();

  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  // print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

  // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

  runApp(App(eventBloc, notificationBloc, searchBloc));
}
