import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';

class GeCommitsScreen extends StatelessWidget {
  final String owner;
  final String name;
  // final String branch; // TODO:
  GeCommitsScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteeCommit, int>(
      title: AppBarTitle('Commits'),
      fetch: (page) async {
        final res = await context
            .read<AuthModel>()
            .fetchGiteeWithPage('/repos/$owner/$name/commits', page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GiteeCommit.fromJson(v)],
        );
      },
      itemBuilder: (c) {
        return CommitItem(
          author: c.commit.author.name,
          avatarUrl: c.author.avatarUrl,
          avatarLink: '/gitee/${c.author.login}',
          createdAt: c.commit.author.date,
          message: c.commit.message,
          url: c.htmlUrl,
        );
      },
    );
  }
}
