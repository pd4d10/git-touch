import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
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

class GeRepoScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;
  GeRepoScreen(this.owner, this.name, {this.branch});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple3<GiteeRepo, MarkdownViewData, List<GiteeBranch>>>(
      title: AppBarTitle(S.of(context).repository),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final repo = await auth.fetchGitee('/repos/$owner/$name').then((v) {
          return GiteeRepo.fromJson(v);
        });

        final md =
            () => auth.fetchGitee('/repos/$owner/$name/readme').then((v) {
                  return (v['content'] as String)?.base64ToUtf8;
                });
        final html = () => md().then((v) async {
              final res = await http.post(
                '${auth.activeAccount.domain}/api/v5/markdown',
                headers: {'Authorization': 'token ${auth.token}'},
                body: {'text': v},
              );
              return utf8.decode(res.bodyBytes).normalizedHtml;
            });
        final readmeData = MarkdownViewData(context, md: md, html: html);
        final branches =
            await auth.fetchGitee('/repos/$owner/$name/branches').then((v) {
          return [for (var branch in v) GiteeBranch.fromJson(branch)];
        });
        return Tuple3(repo, readmeData, branches);
      },
      bodyBuilder: (t, setState) {
        final p = t.item1;
        final branches = t.item3;
        final theme = context.read<ThemeModel>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.owner.avatarUrl,
              avatarLink: '/gitee/${p.namespace.path}',
              owner: p.namespace.path,
              name: p.path,
              description: p.description,
              homepageUrl: p.homepage,
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  text: 'Watchers',
                  url: '/gitee/$owner/$name/watchers',
                ),
                EntryItem(
                  count: p.stargazersCount,
                  text: 'Stars',
                  url: '/gitee/$owner/$name/stargazers',
                ),
                EntryItem(
                  count: p.forksCount,
                  text: 'Forks',
                  url: '/gitee/$owner/$name/forks',
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
                  rightWidget: Text(p.license ?? ''),
                  url:
                      '/gitee/$owner/$name/tree/${branch == null ? p.defaultBranch : branch}',
                ),
                TableViewItem(
                  leftIconData: Octicons.issue_opened,
                  text: Text('Issues'),
                  rightWidget: Text(numberFormat.format(p.openIssuesCount)),
                  url: '/gitee/$owner/$name/issues',
                ),
                if (p.pullRequestsEnabled)
                  TableViewItem(
                    leftIconData: Octicons.git_pull_request,
                    text: Text('Pull requests'),
                    url: '/gitee/$owner/$name/pulls',
                  ),
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  url:
                      '/gitee/$owner/$name/commits?branch=${branch == null ? p.defaultBranch : branch}',
                ),
                if (branches != null)
                  TableViewItem(
                    leftIconData: Octicons.git_branch,
                    text: Text(S.of(context).branches),
                    rightWidget: Text(
                        (branch == null ? p.defaultBranch : branch) +
                            ' • ' +
                            branches.length.toString()),
                    onTap: () async {
                      if (branches.length < 2) return;

                      await theme.showPicker(
                        context,
                        PickerGroupItem(
                          value: branch,
                          items: branches
                              .map((b) => PickerItem(b.name, text: b.name))
                              .toList(),
                          onClose: (ref) {
                            if (ref != branch) {
                              theme.push(
                                  context, '/gitee/$owner/$name?branch=$ref',
                                  replace: true);
                            }
                          },
                        ),
                      );
                    },
                  ),
                TableViewItem(
                    leftIconData: Octicons.organization,
                    text: Text('Contributors'),
                    url: '/gitee/$owner/$name/contributors'),
              ],
            ),
            CommonStyle.verticalGap,
            MarkdownView(t.item2)
          ],
        );
      },
    );
  }
}
