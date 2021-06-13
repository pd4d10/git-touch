import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
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
import 'package:flutter_gen/gen_l10n/S.dart';

class GoRepoScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String? branch;
  GoRepoScreen(this.owner, this.name, {this.branch});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple3<GogsRepository, MarkdownViewData, List<GogsBranch>>>(
      title: AppBarTitle(AppLocalizations.of(context)!.repository),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final repo = await auth.fetchGogs('/repos/$owner/$name').then((v) {
          return GogsRepository.fromJson(v);
        });

        final md = () =>
            auth.fetchGogs('/repos/$owner/$name/contents/README.md').then((v) {
              return (v['content'] as String?)?.base64ToUtf8 ?? '';
            });
        final html = () => md().then((v) async {
              final res = await http.post(
                Uri.parse('${auth.activeAccount!.domain}/api/v1/markdown/raw'),
                headers: {'Authorization': 'token ${auth.token}'},
                body: v,
              );
              return utf8.decode(res.bodyBytes).normalizedHtml;
            });
        final readmeData = MarkdownViewData(context, md: md, html: html);
        List<GogsBranch> branches =
            await auth.fetchGogs('/repos/$owner/$name/branches').then((v) {
          if (!(v is List))
            return []; // Valid API Response only returned if repo contains >= 2 branches
          return [for (var branch in v) GogsBranch.fromJson(branch)];
        });

        return Tuple3(repo, readmeData, branches);
      },
      bodyBuilder: (t, _) {
        final p = t.item1;
        final branches = t.item3;
        final theme = context.read<ThemeModel>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.owner!.avatarUrl,
              avatarLink: '/gogs/${p.owner!.username}',
              owner: p.owner!.username,
              name: p.fullName!.split('/')[1],
              description: p.description,
              homepageUrl: p.website,
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                // TODO: when API is available
                EntryItem(
                  count: p.watchersCount,
                  text: 'Watchers',
                ),
                EntryItem(
                  count: p.starsCount,
                  text: 'Stars',
                ),
                EntryItem(
                  count: p.forksCount,
                  text: 'Forks',
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
                  url: '/gogs/$owner/$name/blob?ref=${branch ?? 'master'}',
                ),
                TableViewItem(
                  leftIconData: Octicons.issue_opened,
                  text: Text('Issues'),
                  url: '/gogs/$owner/$name/issues',
                ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text(
                      'Pull requests'), // TODO: when API endpoint is available
                ),
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  url: '/gogs/$owner/$name/commits?ref=${branch ?? 'master'}',
                ),
                TableViewItem(
                  leftIconData: Octicons.git_branch,
                  text: Text(AppLocalizations.of(context)!.branches),
                  rightWidget: Text((branch ?? 'master')! +
                      ' • ' +
                      '${branches == null ? '1' : branches.length.toString()}'),
                  onTap: () async {
                    if (branches == null) return;

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
                                context, '/gogs/$owner/$name?branch=$ref',
                                replace: true);
                          }
                        },
                      ),
                    );
                  },
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
