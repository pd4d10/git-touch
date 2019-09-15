import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/object.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import 'package:launch_review/launch_review.dart';
import '../scaffolds/simple.dart';
import '../widgets/table_view.dart';
import '../screens/repo.dart';
import '../screens/login.dart';

class SettingsScreen extends StatelessWidget {
  Widget _buildRightWidget(bool checked) {
    if (!checked) return null;
    return Icon(Octicons.check, color: CupertinoColors.activeBlue, size: 24);
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeModel>(context);

    return SimpleScaffold(
      title: AppBarTitle('Settings'),
      bodyBuilder: () {
        return Column(
          children: <Widget>[
            borderView1,
            TableView(headerText: 'ACCOUNTS', items: [
              TableViewItem(
                text: Text('Switch to another account'),
                screenBuilder: (_) => LoginScreen(),
              ),
            ]),
            borderView1,
            TableView(headerText: 'THEME', items: [
              TableViewItem(
                text: Text('Material'),
                rightWidget:
                    _buildRightWidget(themeProvider.theme == ThemeMap.material),
                onTap: () {
                  if (themeProvider.theme != ThemeMap.material) {
                    themeProvider.setTheme(ThemeMap.material);
                  }
                },
                hideRightChevron: true,
              ),
              TableViewItem(
                text: Text('Cupertino'),
                rightWidget: _buildRightWidget(
                    themeProvider.theme == ThemeMap.cupertino),
                onTap: () {
                  if (themeProvider.theme != ThemeMap.cupertino) {
                    themeProvider.setTheme(ThemeMap.cupertino);
                  }
                },
                hideRightChevron: true,
              ),
            ]),
            borderView1,
            TableView(headerText: 'ABOUT', items: [
              TableViewItem(
                text: Text('Source Code'),
                screenBuilder: (_) => RepoScreen('pd4d10', 'git-touch'),
              ),
              TableViewItem(
                text: Text('License'),
                rightWidget: Text('MIT'),
                screenBuilder: (_) => ObjectScreen(
                  owner: 'pd4d10',
                  name: 'git-touch',
                  branch: 'master',
                  paths: ['LICENSE'],
                  type: 'blob',
                ),
              ),
              TableViewItem(
                text: Text('Rate This App'),
                onTap: () {
                  LaunchReview.launch(
                    androidAppId: 'io.github.pd4d10.gittouch',
                    iOSAppId: '1452042346',
                  );
                },
              ),
            ]),
          ],
        );
      },
    );
  }
}
