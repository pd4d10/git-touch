import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/settings.dart';
import '../scaffolds/simple.dart';
import '../utils/constants.dart';
import '../widgets/link.dart';
import '../widgets/loading.dart';
import '../models/account.dart';
import 'login_gitlab.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _buildAccountItem(MapEntry<String, AccountModel> entry, int type) {
    var settings = SettingsProvider.of(context);

    return Link(
      onTap: () {
        // Navigator.of(context).pop();
        settings.setActiveAccount(entry.key, type);
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
          settings.activeLogin == entry.key ? Icon(Icons.check) : Container(),
        ]),
      ),
    );
  }

  Widget _buildAddItem(
      {String text, Function onTap, WidgetBuilder screenBuilder}) {
    return Link(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add),
            Text(text, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      onTap: onTap,
      screenBuilder: screenBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    var settings = SettingsProvider.of(context);

    return SimpleScaffold(
      title: Text('Select account'),
      bodyBuilder: () {
        if (settings.loading) {
          return Center(child: Loading());
        }

        return Container(
          child: Column(
            children: settings.githubAccountMap.entries
                .map<Widget>(
                    (entry) => _buildAccountItem(entry, PlatformType.github))
                .toList()
                  ..addAll(
                    settings.gitlabAccountMap.entries
                        .map<Widget>((entry) =>
                            _buildAccountItem(entry, PlatformType.gitlab))
                        .toList(),
                  )
                  ..addAll([
                    _buildAddItem(
                      text: 'GitHub Account',
                      onTap: () {
                        var state = settings.generateRandomString();
                        launch(
                          'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=gittouch://login&scope=user%20repo&state=$state',
                        );
                      },
                    ),
                    _buildAddItem(
                      text: 'GitLab Account',
                      screenBuilder: (_) => LoginGitlabScreen(),
                    )
                  ]),
          ),
        );
      },
    );
  }
}
