import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';

import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';

final gitlabCommitsRouter = RouterScreen('/gitlab/projects/:id/commits',
    (context, params) => GitlabCommitsScreen(params['id'].first));

class GitlabCommitsScreen extends StatelessWidget {
  final String id;
  // final String branch; // TODO:

  GitlabCommitsScreen(this.id);

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
          // url: '${auth.activeAccount.domain}/',
          url: null, // TODO:
        );
      },
    );
  }
}
