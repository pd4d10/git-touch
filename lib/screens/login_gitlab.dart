import 'package:flutter/material.dart';
import 'package:git_touch/models/settings.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import '../scaffolds/simple.dart';

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
      title: AppBarTitle('Login to GitLab'),
      child: Column(
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
              Provider.of<SettingsModel>(context)
                  .loginToGitlab(_domain, _token);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
