import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/locale.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    final code = Provider.of<CodeModel>(context);
    return SingleScaffold(
      title: Text(AppLocalizations.of(context)!.settings),
      body: Column(
        children: <Widget>[
          CommonStyle.verticalGap,
          AntList(
            mode: AntListMode.card,
            header: Text(AppLocalizations.of(context)!.system),
            children: [
              if (auth.activeAccount!.platform == PlatformType.github) ...[
                AntListItem(
                  child: Text(AppLocalizations.of(context)!.githubStatus),
                  onClick: () {
                    launchStringUrl('https://www.githubstatus.com/');
                  },
                ),
                AntListItem(
                  child: const Text('Meta'),
                  onClick: () {
                    context.push('/settings/github-meta');
                  },
                ),
                AntListItem(
                  onClick: () {
                    launchStringUrl(
                        'https://github.com/settings/connections/applications/$clientId');
                  },
                  extra: Text(auth.activeAccount!.login),
                  child: Text(AppLocalizations.of(context)!.reviewPermissions),
                ),
              ],
              if (auth.activeAccount!.platform == PlatformType.gitlab)
                AntListItem(
                  onClick: () {
                    launchStringUrl('${auth.activeAccount!.domain}/help');
                  },
                  extra: FutureBuilder<String>(
                    future:
                        auth.fetchGitlab('/version').then((v) => v['version']),
                    builder: (context, snapshot) {
                      return Text(snapshot.data ?? '');
                    },
                  ),
                  child: Text(AppLocalizations.of(context)!.gitlabStatus),
                ),
              if (auth.activeAccount!.platform == PlatformType.gitea)
                AntListItem(
                  prefix: const Icon(Octicons.info),
                  onClick: () {
                    context.push('/gitea/status');
                  },
                  extra: FutureBuilder<String>(
                    future:
                        auth.fetchGitea('/version').then((v) => v['version']),
                    builder: (context, snapshot) {
                      return Text(snapshot.data ?? '');
                    },
                  ),
                  child: Text(AppLocalizations.of(context)!.giteaStatus),
                ),
              AntListItem(
                onClick: () {
                  context.push('/login');
                },
                extra: Text(auth.activeAccount!.login),
                child: Text(AppLocalizations.of(context)!.switchAccounts),
              ),
              AntListItem(
                extra: Text(theme.locale == null
                    ? AppLocalizations.of(context)!.followSystem
                    : localeNameMap[theme.locale!] ?? theme.locale!),
                onClick: () {
                  // TODO: too many options, better use a new page
                  theme.showActions(context, [
                    for (final key in [
                      null,
                      ...AppLocalizations.supportedLocales
                          .map((l) => l.toString())
                          .where((key) => localeNameMap[key] != null)
                    ])
                      ActionItem(
                        text: key == null
                            ? AppLocalizations.of(context)!.followSystem
                            : localeNameMap[key],
                        onTap: (_) async {
                          final res = await theme.showConfirm(
                            context,
                            const Text(
                                'The app will reload to make the language setting take effect'),
                          );
                          if (res == true && theme.locale != key) {
                            await theme.setLocale(key);
                            auth.reloadApp();
                          }
                        },
                      )
                  ]);
                },
                child: Text(AppLocalizations.of(context)!.appLanguage),
              )
            ],
          ),
          CommonStyle.verticalGap,
          AntList(
            mode: AntListMode.card,
            header: Text(AppLocalizations.of(context)!.theme),
            children: [
              AntListItem(
                extra: Text(theme.brighnessValue == AppBrightnessType.light
                    ? AppLocalizations.of(context)!.light
                    : theme.brighnessValue == AppBrightnessType.dark
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.followSystem),
                onClick: () {
                  theme.showActions(context, [
                    for (var t in [
                      Tuple2(AppLocalizations.of(context)!.followSystem,
                          AppBrightnessType.followSystem),
                      Tuple2(AppLocalizations.of(context)!.light,
                          AppBrightnessType.light),
                      Tuple2(AppLocalizations.of(context)!.dark,
                          AppBrightnessType.dark),
                    ])
                      ActionItem(
                        text: t.item1,
                        onTap: (_) {
                          if (theme.brighnessValue != t.item2) {
                            theme.setBrightness(t.item2);
                          }
                        },
                      )
                  ]);
                },
                child: Text(AppLocalizations.of(context)!.brightness),
              ),
              AntListItem(
                onClick: () {
                  context.push('/choose-code-theme');
                },
                extra: Text('${code.fontFamily}, ${code.fontSize}pt'),
                child: Text(AppLocalizations.of(context)!.codeTheme),
              ),
              AntListItem(
                extra: Text(theme.markdown == AppMarkdownType.flutter
                    ? AppLocalizations.of(context)!.flutter
                    : AppLocalizations.of(context)!.webview),
                onClick: () {
                  theme.showActions(context, [
                    for (var t in [
                      Tuple2(AppLocalizations.of(context)!.flutter,
                          AppMarkdownType.flutter),
                      Tuple2(AppLocalizations.of(context)!.webview,
                          AppMarkdownType.webview),
                    ])
                      ActionItem(
                        text: t.item1,
                        onTap: (_) {
                          if (theme.markdown != t.item2) {
                            theme.setMarkdown(t.item2);
                          }
                        },
                      )
                  ]);
                },
                child: Text(AppLocalizations.of(context)!.markdownRenderEngine),
              ),
            ],
          ),
          CommonStyle.verticalGap,
          AntList(
            mode: AntListMode.card,
            header: Text(AppLocalizations.of(context)!.feedback),
            children: [
              AntListItem(
                extra: const Text('git-touch/git-touch'),
                onClick: () {
                  const suffix = 'git-touch/git-touch/issues/new';
                  if (auth.activeAccount!.platform == PlatformType.github) {
                    context.push('/github/$suffix');
                  } else {
                    launchStringUrl('https://github.com/$suffix');
                  }
                },
                child: Text(AppLocalizations.of(context)!.submitAnIssue),
              ),
              AntListItem(
                child: Text(AppLocalizations.of(context)!.rateThisApp),
                onClick: () {
                  InAppReview.instance
                      .openStoreListing(appStoreId: '1452042346');
                },
              ),
              AntListItem(
                extra: const Text('pd4d10@gmail.com'),
                arrow: null,
                onClick: () {
                  launchStringUrl('mailto:pd4d10@gmail.com');
                },
                child: Text(AppLocalizations.of(context)!.email),
              ),
            ],
          ),
          CommonStyle.verticalGap,
          AntList(
            mode: AntListMode.card,
            header: Text(AppLocalizations.of(context)!.about),
            children: [
              AntListItem(
                extra: FutureBuilder<String>(
                  future:
                      PackageInfo.fromPlatform().then((info) => info.version),
                  builder: (context, snapshot) {
                    return Text(snapshot.data ?? '');
                  },
                ),
                child: Text(AppLocalizations.of(context)!.version),
              ),
              AntListItem(
                extra: const Text('git-touch/git-touch'),
                onClick: () {
                  const suffix = 'git-touch/git-touch';
                  if (auth.activeAccount!.platform == PlatformType.github) {
                    context.push('/github/$suffix');
                  } else {
                    launchStringUrl('https://github.com/$suffix');
                  }
                },
                child: Text(AppLocalizations.of(context)!.sourceCode),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
