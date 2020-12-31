import 'dart:convert';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;
import '../generated/l10n.dart';

class GtRepoScreen extends StatelessWidget {
  final String owner;
  final String name;
  GtRepoScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GiteaRepository, MarkdownViewData>>(
      title: AppBarTitle(S.of(context).repository),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final repo = await auth.fetchGitea('/repos/$owner/$name').then((v) {
          return GiteaRepository.fromJson(v);
        });

        final md = () =>
            auth.fetchGitea('/repos/$owner/$name/contents/README.md').then((v) {
              return (v['content'] as String)?.base64ToUtf8;
            });
        final html = () => md().then((v) async {
              final res = await http.post(
                '${auth.activeAccount.domain}/api/v1/markdown/raw',
                headers: {'Authorization': 'token ${auth.token}'},
                body: v,
              );
              return utf8.decode(res.bodyBytes).normalizedHtml;
            });
        final readmeData = MarkdownViewData(context, md: md, html: html);

        return Tuple2(repo, readmeData);
      },
      bodyBuilder: (t, setState) {
        final theme = Provider.of<ThemeModel>(context);
        final p = t.item1;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.owner.avatarUrl,
              avatarLink: '/gitea/${p.owner.login}',
              owner: p.owner.login,
              name: p.name,
              description: p.description,
              homepageUrl: p.website,
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  text: 'Watchers',
                  url: '/gitea/$owner/$name/watchers',
                ),
                EntryItem(
                  count: p.starsCount,
                  text: 'Stars',
                  url: '/gitea/$owner/$name/stargazers',
                ),
                EntryItem(
                  count: p.forksCount,
                  text: 'Forks',
                  url: '/gitea/$owner/$name/forks',
                ),
              ],
            ),
            CommonStyle.border,
            TableView(
              hasIcon: true,
              items: [
                TableViewItem(
                  leftIconData: Octicons.code,
                  text: Text('Code'),
                  rightWidget: Text(filesize(p.size * 1000)),
                  url: '/gitea/$owner/$name/blob',
                ),
                TableViewItem(
                  leftIconData: Octicons.issue_opened,
                  text: Text('Issues'),
                  rightWidget: Text(numberFormat.format(p.openIssuesCount)),
                  url: '/gitea/$owner/$name/issues',
                ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text('Pull requests'),
                  rightWidget: Text(numberFormat.format(p.openPrCounter)),
                  url: '/gitea/$owner/$name/pulls',
                ),
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  url: '/gitea/$owner/$name/commits',
                ),
              ],
            ),
            CommonStyle.verticalGap,
            MarkdownView(t.item2),
          ],
        );
      },
    );
  }
}
