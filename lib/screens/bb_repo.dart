import 'dart:convert';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class BbRepoScreen extends StatelessWidget {
  final String owner;
  final String name;
  BbRepoScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<BbRepo, String>>(
      title: AppBarTitle('Repository'),
      fetchData: () async {
        final auth = context.read<AuthModel>();
        final r = await auth.fetchBbJson('/repositories/$owner/$name');
        final repo = BbRepo.fromJson(r);
        final res = await auth.fetchBb(
            '/repositories/$owner/$name/src/${repo.mainbranch.name}/README.md');
        final readme =
            res.statusCode >= 400 ? null : utf8.decode(res.bodyBytes);
        return Tuple2(repo, readme);
      },
      bodyBuilder: (t, setState) {
        final theme = Provider.of<ThemeModel>(context);
        final p = t.item1;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.avatarUrl,
              avatarLink: null,
              owner: p.ownerLogin,
              name: p.slug,
              description: p.description,
              homepageUrl: p.website,
            ),
            CommonStyle.border,
            TableView(
              hasIcon: true,
              items: [
                TableViewItem(
                  leftIconData: Octicons.code,
                  text: Text('Code'),
                  rightWidget: Text(filesize(p.size)),
                  url: '/bitbucket/$owner/$name/src/${p.mainbranch.name}',
                ),
                TableViewItem(
                  leftIconData: Octicons.issue_opened,
                  text: Text('Issues'),
                  url: '/bitbucket/$owner/$name/issues/${p.mainbranch.name}',
                ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text('Pull requests'),
                  url: '/bitbucket/$owner/$name/pulls/${p.mainbranch.name}',
                ),
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  url: '/bitbucket/$owner/$name/commits/${p.mainbranch.name}',
                ),
              ],
            ),
            CommonStyle.verticalGap,
            if (t.item2 != null)
              Container(
                padding: CommonStyle.padding,
                color: theme.palette.background,
                child: MarkdownView(t.item2),
              ),
            CommonStyle.verticalGap,
          ],
        );
      },
    );
  }
}
