import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';

class GitlabCommitsScreen extends StatelessWidget {
  final String id;
  final String prefix;
  // final String branch; // TODO:
  GitlabCommitsScreen(this.id, {this.prefix});

  Future<ListPayload<GitlabCommit, int>> _query(BuildContext context,
      [int page = 1]) async {
    final auth = Provider.of<AuthModel>(context);
    final res = await auth
        .fetchGitlabWithPage('/projects/$id/repository/commits?page=$page');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: (res.data as List).map((v) => GitlabCommit.fromJson(v)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabCommit, int>(
      title: AppBarTitle('Commits'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (c) {
        return CommitItem(
          author: c.authorName,
          avatarUrl: null,
          createdAt: c.createdAt,
          message: c.message,
          url: '$prefix/commit/${c.id}', // TODO:
        );
      },
    );
  }
}
