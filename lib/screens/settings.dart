import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
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
  Widget _buildRightWidget(bool checked) {
    if (!checked) return null;
    return Icon(Octicons.check, color: CupertinoColors.activeBlue, size: 20);
  }

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
                text: Text('Switch to another account'),
                screenBuilder: (_) => LoginScreen(),
              ),
            ]),
            TableViewSeperator(),
            TableView(headerText: 'THEME', items: [
              TableViewItem(
                text: Text('material'),
                rightWidget:
                    _buildRightWidget(themeProvider.theme == ThemeMap.material),
                onTap: () {
                  if (themeProvider.theme != ThemeMap.material) {
                    themeProvider.setTheme(ThemeMap.material);
                  }
                },
              ),
              TableViewItem(
                text: Text('cupertino'),
                rightWidget: _buildRightWidget(
                    themeProvider.theme == ThemeMap.cupertino),
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
                text: Text('Review'),
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
                text: Text('pd4d10/git-touch'),
                screenBuilder: (_) => RepoScreen('pd4d10', 'git-touch'),
              )
            ]),
            TableViewSeperator(),
            TableView(headerText: 'LICENSE', items: [
              TableViewItem(
                text: Text('MIT'),
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
