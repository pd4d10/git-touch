import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/locale.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    final code = Provider.of<CodeModel>(context);
    return SingleScaffold(
      title: AppBarTitle(AppLocalizations.of(context)!.settings),
      body: Column(
        children: <Widget>[
          CommonStyle.verticalGap,
          TableView(headerText: AppLocalizations.of(context)!.system, items: [
            if (auth.activeAccount!.platform == PlatformType.github) ...[
              TableViewItem(
                text: Text(AppLocalizations.of(context)!.githubStatus),
                url: 'https://www.githubstatus.com/',
              ),
              TableViewItem(
                text: Text(AppLocalizations.of(context)!.reviewPermissions),
                url:
                    'https://github.com/settings/connections/applications/$clientId',
                rightWidget: Text(auth.activeAccount!.login),
              ),
            ],
            if (auth.activeAccount!.platform == PlatformType.gitlab)
              TableViewItem(
                text: Text(AppLocalizations.of(context)!.gitlabStatus),
                url: '${auth.activeAccount!.domain}/help',
                rightWidget: FutureBuilder<String>(
                  future:
                      auth.fetchGitlab('/version').then((v) => v['version']),
                  builder: (context, snapshot) {
                    return Text(snapshot.data ?? '');
                  },
                ),
              ),
            if (auth.activeAccount!.platform == PlatformType.gitea)
              TableViewItem(
                leftIconData: Octicons.info,
                text: Text(AppLocalizations.of(context)!.giteaStatus),
                url: '/gitea/status',
                rightWidget: FutureBuilder<String>(
                  future: auth.fetchGitea('/version').then((v) => v['version']),
                  builder: (context, snapshot) {
                    return Text(snapshot.data ?? '');
                  },
                ),
              ),
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.switchAccounts),
              url: '/login',
              rightWidget: Text(auth.activeAccount!.login),
            ),
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.appLanguage),
              rightWidget: Text(theme.locale == null
                  ? AppLocalizations.of(context)!.followSystem
                  : localeNameMap[theme.locale!] ?? theme.locale!),
              onTap: () {
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
                          Text(
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
            )
          ]),
          CommonStyle.verticalGap,
          TableView(headerText: AppLocalizations.of(context)!.theme, items: [
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.brightness),
              rightWidget: Text(theme.brighnessValue == AppBrightnessType.light
                  ? AppLocalizations.of(context)!.light
                  : theme.brighnessValue == AppBrightnessType.dark
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.followSystem),
              onTap: () {
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
                        if (theme.brighnessValue != t.item2)
                          theme.setBrightness(t.item2);
                      },
                    )
                ]);
              },
            ),
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.scaffoldTheme),
              rightWidget: Text(theme.theme == AppThemeType.cupertino
                  ? AppLocalizations.of(context)!.cupertino
                  : AppLocalizations.of(context)!.material),
              onTap: () {
                theme.showActions(context, [
                  for (var t in [
                    Tuple2(AppLocalizations.of(context)!.material,
                        AppThemeType.material),
                    Tuple2(AppLocalizations.of(context)!.cupertino,
                        AppThemeType.cupertino),
                  ])
                    ActionItem(
                      text: t.item1,
                      onTap: (_) {
                        if (theme.theme != t.item2) {
                          theme.setTheme(t.item2);
                        }
                      },
                    )
                ]);
              },
            ),
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.codeTheme),
              url: '/choose-code-theme',
              rightWidget: Text('${code.fontFamily}, ${code.fontSize}pt'),
            ),
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.markdownRenderEngine),
              rightWidget: Text(theme.markdown == AppMarkdownType.flutter
                  ? AppLocalizations.of(context)!.flutter
                  : AppLocalizations.of(context)!.webview),
              onTap: () {
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
            ),
          ]),
          CommonStyle.verticalGap,
          TableView(headerText: AppLocalizations.of(context)!.feedback, items: [
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.submitAnIssue),
              rightWidget: Text('git-touch/git-touch'),
              url: (auth.activeAccount!.platform == PlatformType.github
                      ? '/github'
                      : 'https://github.com') +
                  '/git-touch/git-touch/issues/new',
            ),
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.rateThisApp),
              onTap: () {
                LaunchReview.launch(
                  androidAppId: 'io.github.pd4d10.gittouch',
                  iOSAppId: '1452042346',
                );
              },
            ),
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.email),
              rightWidget: Text('pd4d10@gmail.com'),
              hideRightChevron: true,
              url: 'mailto:pd4d10@gmail.com',
            ),
          ]),
          CommonStyle.verticalGap,
          TableView(headerText: AppLocalizations.of(context)!.about, items: [
            TableViewItem(
                text: Text(AppLocalizations.of(context)!.version),
                rightWidget: FutureBuilder<String>(
                  future:
                      PackageInfo.fromPlatform().then((info) => info.version),
                  builder: (context, snapshot) {
                    return Text(snapshot.data ?? '');
                  },
                )),
            TableViewItem(
              text: Text(AppLocalizations.of(context)!.sourceCode),
              rightWidget: Text('git-touch/git-touch'),
              url: (auth.activeAccount!.platform == PlatformType.github
                      ? '/github'
                      : 'https://github.com') +
                  '/git-touch/git-touch',
            ),
          ])
        ],
      ),
    );
  }
}
