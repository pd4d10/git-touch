import 'package:flutter/material.dart';
import '../scaffolds/simple.dart';
import '../providers/settings.dart';

class LoginGitlabScreen extends StatefulWidget {
  @override
  _LoginGitlabScreenState createState() => _LoginGitlabScreenState();
}

class _LoginGitlabScreenState extends State<LoginGitlabScreen> {
  String _token;
  String _domain;

  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: Text('Login to GitLab'),
      bodyBuilder: () {
        return Column(
          children: <Widget>[
            TextField(
              // decoration: InputDecoration(icon: Icon(Icons.more_vert)),
              onChanged: (value) {
                _domain = value;
              },
            ),
            TextField(
              onChanged: (value) {
                _token = value;
              },
            ),
            MaterialButton(
              child: Text('Login'),
              onPressed: () {
                SettingsProvider.of(context).loginToGitlab(_domain, _token);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
