import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import '../widgets/link.dart';
import '../widgets/loading.dart';
import '../widgets/avatar.dart';
// import 'login_gitlab.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _token = '';

  Widget _buildAccountItem(int index) {
    final settings = Provider.of<AuthModel>(context);
    final account = settings.accounts[index];

    return Link(
      onTap: () {
        // Navigator.of(context).pop();
        settings.setActiveAccountIndex(index);
      },
      child: Container(
        padding: CommonStyle.padding,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          children: <Widget>[
            Avatar.large(url: account.avatarUrl),
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
            (index == settings.activeAccountIndex)
                ? Icon(Icons.check)
                : Container(),
          ],
        ),
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
    final auth = Provider.of<AuthModel>(context);

    return SingleScaffold(
      title: AppBarTitle('Select account'),
      body: auth.loading
          ? Center(child: Loading())
          : Container(
              child: Column(
                children: [
                  ...List.generate(auth.accounts.length, _buildAccountItem),
                  _buildAddItem(
                    text: 'GitHub Account by OAuth',
                    onTap: auth.redirectToGithubOauth,
                  ),
                  _buildAddItem(
                    text: 'GitHub Account by Token',
                    onTap: () async {
                      var result =
                          await Provider.of<ThemeModel>(context).showConfirm(
                        context,
                        Column(
                          children: <Widget>[
                            CupertinoTextField(
                              placeholder: 'Access token',
                              onChanged: (v) {
                                setState(() {
                                  _token = v;
                                });
                              },
                            ),
                            SizedBox(height: 8),
                            Text(
                              'GitTouch needs these permissions',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'user, repo, read:org',
                              style: TextStyle(
                                  fontSize: 16, color: PrimerColors.blue500),
                            )
                          ],
                        ),
                      );
                      if (result == true) {
                        try {
                          await auth.loginWithToken(_token);
                        } catch (err) {
                          Provider.of<ThemeModel>(context).showConfirm(
                              context, Text('Token invalid: $err'));
                        }
                      }
                    },
                  )
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
