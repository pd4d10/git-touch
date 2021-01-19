import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/text_field.dart';
import 'package:provider/provider.dart';
import '../widgets/link.dart';
import '../widgets/loading.dart';
import '../widgets/avatar.dart';
import '../generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _tokenController = TextEditingController();
  final _domainController = TextEditingController();

  // For Bitbucket
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // @override
  // initState() {
  //   super.initState();
  //   _tokenController.addListener(() {
  //     print(_tokenController.text);
  //   });
  // }

  Widget _buildAccountItem(int index) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    final account = auth.accounts[index];
    return Link(
      onTap: () {
        auth.setActiveAccountAndReload(index);
      },
      onLongPress: () {
        theme.showActions(context, [
          ActionItem(
            text: S.of(context).removeAccount,
            isDestructiveAction: true,
            onTap: (_) {
              auth.removeAccount(index);
            },
          ),
        ]);
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
                  Text(
                    account.login,
                    style: TextStyle(fontSize: 20, color: theme.palette.text),
                  ),
                  Padding(padding: EdgeInsets.only(top: 6)),
                  Text(
                    account.domain,
                    style: TextStyle(color: theme.palette.secondaryText),
                  )
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

  Widget _buildAddItem({IconData brand, String text, Function onTap}) {
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
            SizedBox(width: 4),
            Icon(brand),
            SizedBox(width: 8),
            Text(text, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildPopup(
    BuildContext context, {
    List<Widget> notes,
    bool showDomain = false,
  }) {
    return Column(
      children: <Widget>[
        if (showDomain)
          MyTextField(controller: _domainController, placeholder: 'Domain'),
        SizedBox(height: 8),
        MyTextField(placeholder: 'Access token', controller: _tokenController),
        SizedBox(height: 8),
        if (notes != null) ...notes,
      ],
    );
  }

  void showError(err) {
    context
        .read<ThemeModel>()
        .showConfirm(context, Text(S.of(context).somethingBadHappens + '$err'));
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    return SingleScaffold(
      title: AppBarTitle(S.of(context).selectAccount),
      body: auth.loading
          ? Center(child: Loading())
          : Container(
              child: Column(
                children: [
                  ...List.generate(auth.accounts.length, _buildAccountItem),
                  _buildAddItem(
                    text: S.of(context).githubAccount,
                    brand: FontAwesome5Brands.github,
                    onTap: () async {
                      theme.showActions(context, [
                        ActionItem(
                          text: 'via OAuth',
                          onTap: (_) {
                            auth.redirectToGithubOauth();
                          },
                        ),
                        ActionItem(
                          text: 'via Personal token',
                          onTap: (_) async {
                            final result = await theme.showConfirm(
                              context,
                              _buildPopup(context, notes: [
                                Text(
                                  S.of(context).permissionRequiredMessage,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'user, repo, read:org, notifications',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: theme.palette.primary),
                                )
                              ]),
                            );
                            if (result == true) {
                              try {
                                await auth
                                    .loginWithToken(_tokenController.text);
                                _tokenController.clear();
                              } catch (err) {
                                showError(err);
                              }
                            }
                          },
                        ),
                      ]);
                    },
                  ),
                  _buildAddItem(
                    text: S.of(context).gitlabAccount,
                    brand: FontAwesome5Brands.gitlab,
                    onTap: () async {
                      _domainController.text = 'https://gitlab.com';
                      final result = await theme.showConfirm(
                        context,
                        _buildPopup(
                          context,
                          showDomain: true,
                          notes: [
                            Text(
                              S.of(context).permissionRequiredMessage,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'api, read_user, read_repository',
                              style: TextStyle(
                                  fontSize: 16, color: theme.palette.primary),
                            )
                          ],
                        ),
                      );
                      if (result == true) {
                        try {
                          await auth.loginToGitlab(
                              _domainController.text, _tokenController.text);
                          _tokenController.clear();
                        } catch (err) {
                          showError(err);
                        }
                      }
                    },
                  ),
                  _buildAddItem(
                    text: S.of(context).bitbucketAccount,
                    brand: FontAwesome5Brands.bitbucket,
                    onTap: () async {
                      _domainController.text = 'https://bitbucket.org';
                      final result = await theme.showConfirm(
                        context,
                        Column(
                          children: <Widget>[
                            MyTextField(
                                controller: _domainController,
                                placeholder: 'Domain'),
                            SizedBox(height: 8),
                            MyTextField(
                                placeholder: 'Username',
                                controller: _usernameController),
                            SizedBox(height: 8),
                            MyTextField(
                                placeholder: 'App password',
                                controller: _passwordController),
                            SizedBox(height: 8),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text:
                                      'Note: App password is different with the password. Follow ',
                                ),
                                TextSpan(
                                  text: 'this guide',
                                  style:
                                      TextStyle(color: theme.palette.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      theme.push(context,
                                          'https://support.atlassian.com/bitbucket-cloud/docs/app-passwords/');
                                    },
                                ),
                                TextSpan(text: ' to create one.')
                              ]),
                            ),
                            SizedBox(height: 8),
                            Text(
                              S.of(context).permissionRequiredMessage,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Account: read\nTeam membership: read\nProjects: read\nRepositories: read\nPull requests: read\nIssues: read\nSnippets: read',
                              style: TextStyle(
                                  fontSize: 16, color: theme.palette.primary),
                            )
                          ],
                        ),
                      );
                      if (result == true) {
                        try {
                          await auth.loginToBb(
                              _domainController.text,
                              _usernameController.text,
                              _passwordController.text);
                        } catch (err) {
                          showError(err);
                        }
                      }
                    },
                  ),
                  _buildAddItem(
                    text: S.of(context).giteaAccount,
                    brand: Octicons.git_branch, // TODO: brand icon
                    onTap: () async {
                      _domainController.text = 'https://gitea.com';
                      final result = await theme.showConfirm(
                          context,
                          Column(
                            children: [
                              _buildPopup(context, showDomain: true),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                  text:
                                      'Note: To login with Codeberg change the domain name to: ',
                                ),
                              ])),
                              SizedBox(height: 8),
                              Text(
                                'https://codeberg.org',
                                style: TextStyle(
                                    fontSize: 16, color: theme.palette.primary),
                              ),
                            ],
                          ));
                      if (result == true) {
                        try {
                          await auth.loginToGitea(
                              _domainController.text, _tokenController.text);
                          _tokenController.clear();
                        } catch (err) {
                          showError(err);
                        }
                      }
                    },
                  ),
                  _buildAddItem(
                    text: S.of(context).giteeAccount + '(码云)',
                    brand: Octicons.git_branch, // TODO: brand icon
                    onTap: () async {
                      final result = await theme.showConfirm(
                        context,
                        _buildPopup(context),
                      );
                      if (result == true) {
                        try {
                          await auth.loginToGitee(_tokenController.text);
                          _tokenController.clear();
                        } catch (err) {
                          showError(err);
                        }
                      }
                    },
                  ),
                  Container(
                    padding: CommonStyle.padding,
                    child: Text(
                      S.of(context).longPressToRemoveAccount,
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.palette.secondaryText,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
