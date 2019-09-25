import 'package:flutter/material.dart';
import 'package:git_touch/models/settings.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import '../widgets/link.dart';
import '../widgets/loading.dart';
import '../models/account.dart';
import '../widgets/avatar.dart';
// import 'login_gitlab.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _buildAccountItem(AccountModel account) {
    var settings = Provider.of<SettingsModel>(context);

    return Link(
      onTap: () {
        // Navigator.of(context).pop();
        settings.setActiveAccount(
            account.platform, account.domain, account.login);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(children: <Widget>[
          Avatar(url: account.avatarUrl, size: 24),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(account.login, style: TextStyle(fontSize: 20)),
                Padding(padding: EdgeInsets.only(top: 6)),
                Text(account.domain)
              ],
            ),
          ),
          (settings.activePlatform == account.platform &&
                  settings.activeDomain == account.domain &&
                  settings.activeLogin == account.login)
              ? Icon(Icons.check)
              : Container(),
        ]),
      ),
    );
  }

  Widget _buildAddItem({String text, Function onTap}) {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<SettingsModel>(context);

    List<AccountModel> accounts = [];
    settings.accountMap.forEach((platform, v0) {
      v0.forEach((domain, v1) {
        v1.forEach((login, v2) {
          accounts.add(AccountModel(
            avatarUrl: v2.avatarUrl,
            token: v2.token,
            platform: platform,
            domain: domain,
            login: login,
          ));
        });
      });
    });

    return SingleScaffold(
      title: AppBarTitle('Select account'),
      body: settings.loading
          ? Center(child: Loading())
          : Container(
              child: Column(
                children: [
                  ...settings.githubAccountMap.entries
                      .map<Widget>((entry) => _buildAccountItem(AccountModel(
                          avatarUrl: entry.value.avatarUrl,
                          token: entry.value.token,
                          platform: PlatformType.github,
                          domain: 'https://github.com',
                          login: entry.key)))
                      .toList(),
                  ...accounts.map(_buildAccountItem),
                  _buildAddItem(
                    text: 'GitHub Account',
                    onTap: settings.redirectToGithubOauth,
                  ),
                  // _buildAddItem(
                  //   text: 'GitLab Account',
                  //   screenBuilder: (_) => LoginGitlabScreen(),
                  // )
                ],
              ),
            ),
    );
  }
}
