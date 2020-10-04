import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlStarrersScreen extends StatelessWidget {
  final int id;
  GlStarrersScreen(this.id);

  Future<ListPayload<GitlabStarrer, int>> _query(BuildContext context,
      [int page = 1]) async {
    final res = await context
        .read<AuthModel>()
        .fetchGitlabWithPage('/projects/$id/starrers?page=$page');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: <GitlabStarrer>[
        for (var v in res.data) GitlabStarrer.fromJson(v),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabStarrer, int>(
      title: AppBarTitle('Members'),
      onRefresh: () => _query(context),
      onLoadMore: (page) => _query(context, page),
      itemBuilder: (v) {
        return UserItem(
          avatarUrl: v.user.avatarUrl,
          login: v.user.username,
          bio: Text('Starred ' + timeago.format(v.starredSince)),
          url: '/gitlab/user/${v.user.id}',
        );
      },
    );
  }
}
