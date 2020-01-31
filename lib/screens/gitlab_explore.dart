import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GitlabExplore extends StatelessWidget {
  Future<ListPayload<GitlabProject, int>> _query(BuildContext context,
      [int page = 1]) async {
    final auth = Provider.of<AuthModel>(context);
    final res = await auth
        .fetchGitlabWithPage('/projects?order_by=last_activity_at&page=$page');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: <GitlabProject>[
        for (var v in res.data) GitlabProject.fromJson(v),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabProject, int>(
      title: AppBarTitle('Explore'),
      onRefresh: () => _query(context),
      onLoadMore: (page) => _query(context, page),
      itemBuilder: (v) {
        return RepositoryItem.gl(
          payload: v,
          note: 'Updated ${timeago.format(v.lastActivityAt)}',
        );
      },
    );
  }
}
