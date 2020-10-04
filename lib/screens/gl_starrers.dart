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

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabStarrer, int>(
      title: AppBarTitle('Members'),
      onLoadMore: (page) async {
        page = page ?? 1;
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
      },
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
