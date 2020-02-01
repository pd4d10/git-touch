import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import '../widgets/link.dart';
import '../widgets/loading.dart';
import '../widgets/avatar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _token = '';
  String _gitlabToken = '';
  String _gitlabDomain = 'https://gitlab.com';
  String _giteaToken = '';
  String _giteaDomain = 'https://try.gitea.io';

  Widget _buildAccountItem(int index) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    final account = auth.accounts[index];

    return Link(
      onTap: () {
        auth.setActiveAccountAndReload(index);
      },
      child: Container(
        padding: CommonStyle.padding,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.palette.border)),
        ),
        child: Row(
          children: <Widget>[
            Avatar(url: account.avatarUrl, size: AvatarSize.large),
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
            (index == auth.activeAccountIndex)
                ? Icon(Icons.check)
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddItem({String text, Function onTap}) {
    final theme = Provider.of<ThemeModel>(context);

    return Link(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.palette.border)),
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
    final theme = Provider.of<ThemeModel>(context);

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
                              'user, repo, read:org, notifications',
                              style: TextStyle(
                                  fontSize: 16, color: theme.palette.primary),
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
                  ),
                  // _buildAddItem(
                  //   text: 'GitLab Account by Token',
                  //   onTap: () async {
                  //     final result =
                  //         await Provider.of<ThemeModel>(context).showConfirm(
                  //       context,
                  //       Column(
                  //         children: <Widget>[
                  //           CupertinoTextField(
                  //             placeholder: 'Domain',
                  //             onChanged: (v) {
                  //               setState(() {
                  //                 _gitlabDomain = v;
                  //               });
                  //             },
                  //           ),
                  //           SizedBox(height: 8),
                  //           CupertinoTextField(
                  //             placeholder: 'Access token',
                  //             onChanged: (v) {
                  //               setState(() {
                  //                 _gitlabToken = v;
                  //               });
                  //             },
                  //           ),
                  //           SizedBox(height: 8),
                  //           Text(
                  //             'GitTouch needs these permissions',
                  //             style: TextStyle(
                  //                 fontSize: 14, fontWeight: FontWeight.w400),
                  //           ),
                  //           SizedBox(height: 8),
                  //           Text(
                  //             'api, read_user, read_repository',
                  //             style: TextStyle(
                  //                 fontSize: 16, color: theme.palette.primary),
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //     if (result == true) {
                  //       try {
                  //         await auth.loginToGitlab(_gitlabDomain, _gitlabToken);
                  //         // TODO: Custom domain
                  //       } catch (err) {
                  //         Provider.of<ThemeModel>(context).showConfirm(
                  //             context, Text('Token invalid: $err'));
                  //       }
                  //     }
                  //   },
                  // ),
                  // _buildAddItem(
                  //   text: 'Gitea Account by Token',
                  //   onTap: () async {
                  //     final result =
                  //         await Provider.of<ThemeModel>(context).showConfirm(
                  //       context,
                  //       Column(
                  //         children: <Widget>[
                  //           CupertinoTextField(
                  //             placeholder: 'Domain',
                  //             onChanged: (v) {
                  //               setState(() {
                  //                 _giteaDomain = v;
                  //               });
                  //             },
                  //           ),
                  //           SizedBox(height: 8),
                  //           CupertinoTextField(
                  //             placeholder: 'Access token',
                  //             onChanged: (v) {
                  //               setState(() {
                  //                 _giteaToken = v;
                  //               });
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //     if (result == true) {
                  //       try {
                  //         await auth.loginToGitea(_giteaDomain, _giteaToken);
                  //       } catch (err) {
                  //         Provider.of<ThemeModel>(context).showConfirm(
                  //             context, Text('Token invalid: $err'));
                  //       }
                  //     }
                  //   },
                  // )
                ],
              ),
            ),
    );
  }
}
