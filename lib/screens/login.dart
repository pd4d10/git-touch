import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:git_touch/widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _tokenController = TextEditingController();
  final _domainController = TextEditingController();

  // For Bitbucket
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _buildAccountItem(int index) {
    final auth = Provider.of<AuthModel>(context);
    final account = auth.accounts![index];
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.endToStart,
      background: Container(
        color: AntTheme.of(context).colorDanger,
        padding: const EdgeInsets.only(right: 12),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppLocalizations.of(context)!.removeAccount,
            style: TextStyle(
              fontSize: 16,
              color: AntTheme.of(context).colorBackground,
            ),
          ),
        ),
      ),
      onDismissed: (_) {
        auth.removeAccount(index);
      },
      child: AntListItem(
        onClick: () {
          auth.setActiveAccountAndReload(index);
        },
        arrow: null,
        prefix: Avatar(url: account.avatarUrl),
        extra: index == auth.activeAccountIndex
            ? const Icon(Ionicons.checkmark)
            : null,
        description: Text(account.domain),
        child: Text(account.login),
      ),
    );
  }

  Widget _buildAddItem({
    IconData? brand,
    required String text,
    void Function()? onTap,
  }) {
    return AntListItem(
      onClick: onTap,
      child: Row(
        children: <Widget>[
          const Icon(Ionicons.add),
          const SizedBox(width: 4),
          Icon(brand),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildPopup(
    BuildContext context, {
    List<Widget>? notes,
    bool showDomain = true,
  }) {
    return Column(
      children: <Widget>[
        if (showDomain)
          MyTextField(controller: _domainController, placeholder: 'Domain'),
        const SizedBox(height: 8),
        MyTextField(placeholder: 'Access token', controller: _tokenController),
        const SizedBox(height: 8),
        if (notes != null) ...notes,
      ],
    );
  }

  void showError(err) {
    context.read<ThemeModel>().showConfirm(context,
        Text('${AppLocalizations.of(context)!.somethingBadHappens}$err'));
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    return SingleScaffold(
      title: Text(AppLocalizations.of(context)!.selectAccount),
      body: auth.loading
          ? const Center(child: Loading())
          : Column(
              children: [
                AntList(
                  children: [
                    ...List.generate(auth.accounts!.length, _buildAccountItem),
                    _buildAddItem(
                      text: AppLocalizations.of(context)!.githubAccount,
                      brand: Ionicons.logo_github,
                      onTap: () async {
                        theme.showActions(context, [
                          ActionItem(
                            text: 'via OAuth',
                            onTap: (_) {
                              auth.redirectToGithubOauth();
                            },
                          ),
                          ActionItem(
                            text: 'via OAuth (Public repos only)',
                            onTap: (_) {
                              auth.redirectToGithubOauth(true);
                            },
                          ),
                          ActionItem(
                            text: 'via Personal token',
                            onTap: (_) async {
                              final result = await theme.showConfirm(
                                context,
                                _buildPopup(context, notes: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .permissionRequiredMessage,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'user, repo, read:org, notifications',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            AntTheme.of(context).colorPrimary),
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
                      text: AppLocalizations.of(context)!.gitlabAccount,
                      brand: Ionicons.git_branch_outline,
                      onTap: () async {
                        _domainController.text = 'https://gitlab.com';
                        final result = await theme.showConfirm(
                          context,
                          _buildPopup(
                            context,
                            showDomain: true,
                            notes: [
                              Text(
                                AppLocalizations.of(context)!
                                    .permissionRequiredMessage,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'api, read_user, read_repository',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AntTheme.of(context).colorPrimary),
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
                      text: AppLocalizations.of(context)!.bitbucketAccount,
                      brand: Ionicons.logo_bitbucket,
                      onTap: () async {
                        _domainController.text = 'https://bitbucket.org';
                        final result = await theme.showConfirm(
                          context,
                          Column(
                            children: <Widget>[
                              MyTextField(
                                  controller: _domainController,
                                  placeholder: 'Domain'),
                              const SizedBox(height: 8),
                              MyTextField(
                                  placeholder: 'Username',
                                  controller: _usernameController),
                              const SizedBox(height: 8),
                              MyTextField(
                                  placeholder: 'App password',
                                  controller: _passwordController),
                              const SizedBox(height: 8),
                              Text.rich(
                                TextSpan(children: [
                                  const TextSpan(
                                    text:
                                        'Note: App password is different with the password. Follow ',
                                  ),
                                  TextSpan(
                                    text: 'this guide',
                                    style: TextStyle(
                                        color:
                                            AntTheme.of(context).colorPrimary),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushUrl(
                                            'https://support.atlassian.com/bitbucket-cloud/docs/app-passwords/');
                                      },
                                  ),
                                  const TextSpan(text: ' to create one.')
                                ]),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                AppLocalizations.of(context)!
                                    .permissionRequiredMessage,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Account: read\nTeam membership: read\nProjects: read\nRepositories: read\nPull requests: read\nIssues: read\nSnippets: read',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AntTheme.of(context).colorPrimary),
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
                      text: AppLocalizations.of(context)!.giteaAccount,
                      brand: Ionicons.git_branch_outline, // TODO: brand icon
                      onTap: () async {
                        _domainController.text = 'https://gitea.com';
                        final result = await theme.showConfirm(
                            context,
                            Column(
                              children: [
                                _buildPopup(context, showDomain: true),
                                const Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text:
                                        'Note: To login with Codeberg change the domain name to: ',
                                  ),
                                ])),
                                const SizedBox(height: 8),
                                Text(
                                  'https://codeberg.org',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AntTheme.of(context).colorPrimary),
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
                      text: '${AppLocalizations.of(context)!.giteeAccount}(码云)',
                      brand: Ionicons.git_branch_outline, // TODO: brand icon
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
                    _buildAddItem(
                      text: 'Gogs Account',
                      brand: Ionicons.git_branch_outline, // TODO: brand icon
                      onTap: () async {
                        _domainController.text = 'https://gogs.com';
                        final result = await theme.showConfirm(
                          context,
                          _buildPopup(context, showDomain: true),
                        );
                        if (result == true) {
                          try {
                            await auth.loginToGogs(
                                _domainController.text, _tokenController.text);
                            _tokenController.clear();
                          } catch (err) {
                            showError(err);
                          }
                        }
                      },
                    ),
                  ],
                ),
                Container(
                  padding: CommonStyle.padding,
                  child: Text(
                    'Swipe to left to remove account',
                    style: TextStyle(
                      fontSize: 16,
                      color: AntTheme.of(context).colorTextSecondary,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
