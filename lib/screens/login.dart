import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var settings = SettingsProvider.of(context);

    List<Widget> children =
        settings.githubAccountMap.entries.map<Widget>((entry) {
      return RaisedButton(
        child: Text(entry.key),
        onPressed: () {
          settings.setActiveAccount(entry.key);
        },
      );
    }).toList();

    children.add(RaisedButton(
      child: Text('Login'),
      onPressed: () {
        var state = settings.generateRandomString();
        launch(
          'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=gittouch://login&scope=user%20repo&state=$state',
          forceSafariVC: false, // this makes URL Scheme work
        );
      },
    ));

    return MaterialApp(
      home: Scaffold(
        body: Center(child: Column(children: children)),
      ),
    );
  }
}
