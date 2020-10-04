import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';

class GtCommitsScreen extends StatelessWidget {
  final String owner;
  final String name;
  // final String branch; // TODO:
  GtCommitsScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaCommit, int>(
      title: AppBarTitle('Commits'),
      onLoadMore: (page) async {
        page = page ?? 1;
        final res = await context.read<AuthModel>().fetchGiteaWithPage(
            '/repos/$owner/$name/commits?page=$page&limit=20');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items:
              (res.data as List).map((v) => GiteaCommit.fromJson(v)).toList(),
        );
      },
      itemBuilder: (c) {
        return CommitItem(
          author: c.author?.login ?? c.commit.author.name,
          avatarUrl: null,
          avatarLink: null,
          createdAt: c.commit.author.date,
          message: c.commit.message,
          url: c.htmlUrl,
        );
      },
    );
  }
}
