import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import '../scaffolds/simple.dart';
import '../widgets/table_view.dart';
import '../screens/repo.dart';
import '../screens/login.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeModel>(context);

    return SimpleScaffold(
      title: Text('Settings'),
      bodyBuilder: () {
        return Column(
          children: <Widget>[
            TableViewSeperator(),
            TableView(headerText: 'ACCOUNTS', items: [
              TableViewItem(
                text: 'Switch to another account',
                screenBuilder: (_) => LoginScreen(),
              ),
            ]),
            TableViewSeperator(),
            TableView(headerText: 'THEME', items: [
              TableViewItem(
                text: 'material',
                checked: themeProvider.theme == ThemeMap.material,
                onTap: () {
                  if (themeProvider.theme != ThemeMap.material) {
                    themeProvider.setTheme(ThemeMap.material);
                  }
                },
              ),
              TableViewItem(
                text: 'cupertino',
                checked: themeProvider.theme == ThemeMap.cupertino,
                onTap: () {
                  if (themeProvider.theme != ThemeMap.cupertino) {
                    themeProvider.setTheme(ThemeMap.cupertino);
                  }
                },
              ),
            ]),
            TableViewSeperator(),
            TableView(headerText: 'REVIEW', items: [
              TableViewItem(
                text: 'Review',
                onTap: () {
                  LaunchReview.launch(
                    androidAppId: 'io.github.pd4d10.gittouch',
                    iOSAppId: '1452042346',
                  );
                },
              )
            ]),
            TableViewSeperator(),
            TableView(headerText: 'SOURCE CODE', items: [
              TableViewItem(
                text: 'pd4d10/git-touch',
                screenBuilder: (_) => RepoScreen('pd4d10', 'git-touch'),
              )
            ]),
            TableViewSeperator(),
            TableView(headerText: 'LICENSE', items: [
              TableViewItem(
                text: 'MIT',
                onTap: () {
                  launch(
                      'https://github.com/pd4d10/git-touch/blob/master/LICENSE');
                },
              )
            ]),
            TableViewSeperator(),
          ],
        );
      },
    );
  }
}
