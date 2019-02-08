import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/settings.dart';
import '../scaffolds/simple.dart';
import '../utils/utils.dart';
import '../widgets/link.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var settings = SettingsProvider.of(context);

    return SimpleScaffold(
      title: Text('Select account'),
      bodyBuilder: () {
        return Container(
          child: Column(
            children: settings.githubAccountMap.entries.map<Widget>((entry) {
              return Link(
                beforeRedirect: () {
                  // Navigator.of(context).pop();
                  settings.setActiveAccount(entry.key);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12)),
                  ),
                  child: Row(children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(entry.value.avatarUrl),
                      radius: 24,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(entry.key, style: TextStyle(fontSize: 20)),
                          Padding(padding: EdgeInsets.only(top: 6)),
                          Text(entry.value.domain ?? 'https://github.com')
                        ],
                      ),
                    ),
                    settings.activeLogin == entry.key
                        ? Icon(Icons.check)
                        : Container(),
                  ]),
                ),
              );
            }).toList()
              ..add(
                Link(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add),
                        Text('Add account', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  beforeRedirect: () {
                    var state = settings.generateRandomString();
                    launch(
                      'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=gittouch://login&scope=user%20repo&state=$state',
                      forceSafariVC: false, // this makes URL Scheme work
                    );
                  },
                ),
              ),
          ),
        );
      },
    );
  }
}
