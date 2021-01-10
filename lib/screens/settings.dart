import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  Widget _buildRightWidget(BuildContext context, bool checked) {
    final theme = Provider.of<ThemeModel>(context);
    if (!checked) return null;
    return Icon(Icons.check, color: theme.palette.primary, size: 24);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    final code = Provider.of<CodeModel>(context);
    return SingleScaffold(
      title: AppBarTitle(S.of(context).settings),
      body: Column(
        children: <Widget>[
          CommonStyle.verticalGap,
          TableView(headerText: S.of(context).system, items: [
            if (auth.activeAccount.platform == PlatformType.github) ...[
              TableViewItem(
                text: Text(S.of(context).githubStatus),
                url: 'https://www.githubstatus.com/',
              ),
              TableViewItem(
                text: Text(S.of(context).reviewPermissions),
                url:
                    'https://github.com/settings/connections/applications/$clientId',
                rightWidget: Text(auth.activeAccount.login),
              ),
            ],
            if (auth.activeAccount.platform == PlatformType.gitlab)
              TableViewItem(
                text: Text(S.of(context).gitlabStatus),
                url: '${auth.activeAccount.domain}/help',
                rightWidget: FutureBuilder<String>(
                  future:
                      auth.fetchGitlab('/version').then((v) => v['version']),
                  builder: (context, snapshot) {
                    return Text(snapshot.data ?? '');
                  },
                ),
              ),
            if (auth.activeAccount.platform == PlatformType.gitea)
              TableViewItem(
                leftIconData: Octicons.info,
                text: Text(S.of(context).giteaStatus),
                url: '/gitea/status',
                rightWidget: FutureBuilder<String>(
                  future: auth.fetchGitea('/version').then((v) => v['version']),
                  builder: (context, snapshot) {
                    return Text(snapshot.data ?? '');
                  },
                ),
              ),
            TableViewItem(
              text: Text(S.of(context).switchAccounts),
              url: '/login',
              rightWidget: Text(auth.activeAccount.login),
            ),
          ]),
          CommonStyle.verticalGap,
          TableView(headerText: 'theme', items: [
            TableViewItem(
              text: Text(S.of(context).brightness),
              rightWidget: Text(theme.brighnessValue == AppBrightnessType.light
                  ? 'Light'
                  : theme.brighnessValue == AppBrightnessType.dark
                      ? 'Dark'
                      : 'Follow system'),
              onTap: () {
                theme.showActions(context, [
                  for (var t in [
                    Tuple2(S.of(context).followSystem,
                        AppBrightnessType.followSystem),
                    Tuple2(S.of(context).light, AppBrightnessType.light),
                    Tuple2(S.of(context).dark, AppBrightnessType.dark),
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
              text: Text(S.of(context).scaffoldTheme),
              rightWidget: Text(theme.theme == AppThemeType.cupertino
                  ? S.of(context).cupertino
                  : S.of(context).material),
              onTap: () {
                theme.showActions(context, [
                  for (var t in [
                    Tuple2(S.of(context).material, AppThemeType.material),
                    Tuple2(S.of(context).cupertino, AppThemeType.cupertino),
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
              text: Text(S.of(context).codeTheme),
              url: '/choose-code-theme',
              rightWidget: Text('${code.fontFamily}, ${code.fontSize}pt'),
            ),
            TableViewItem(
              text: Text(S.of(context).markdownRenderEngine),
              rightWidget: Text(theme.markdown == AppMarkdownType.flutter
                  ? S.of(context).flutter
                  : S.of(context).webview),
              onTap: () {
                theme.showActions(context, [
                  for (var t in [
                    Tuple2(S.of(context).flutter, AppMarkdownType.flutter),
                    Tuple2(S.of(context).webview, AppMarkdownType.webview),
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
          TableView(headerText: S.of(context).feedback, items: [
            TableViewItem(
              text: Text(S.of(context).submitAnIssue),
              rightWidget: Text('pd4d10/git-touch'),
              url: (auth.activeAccount.platform == PlatformType.github
                      ? '/github'
                      : 'https://github.com') +
                  '/pd4d10/git-touch/issues/new',
            ),
            TableViewItem(
              text: Text(S.of(context).rateThisApp),
              onTap: () {
                LaunchReview.launch(
                  androidAppId: 'io.github.pd4d10.gittouch',
                  iOSAppId: '1452042346',
                );
              },
            ),
            TableViewItem(
              text: Text(S.of(context).email),
              rightWidget: Text('pd4d10@gmail.com'),
              hideRightChevron: true,
              url: 'mailto:pd4d10@gmail.com',
            ),
          ]),
          CommonStyle.verticalGap,
          TableView(headerText: S.of(context).about, items: [
            TableViewItem(
                text: Text(S.of(context).version),
                rightWidget: FutureBuilder<String>(
                  future:
                      PackageInfo.fromPlatform().then((info) => info.version),
                  builder: (context, snapshot) {
                    return Text(snapshot.data ?? '');
                  },
                )),
            TableViewItem(
              text: Text(S.of(context).sourceCode),
              rightWidget: Text('pd4d10/git-touch'),
              url: (auth.activeAccount.platform == PlatformType.github
                      ? '/github'
                      : 'https://github.com') +
                  '/pd4d10/git-touch',
            ),
          ])
        ],
      ),
    );
  }
}
