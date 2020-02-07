import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';

class GlGroupsScreenn extends StatelessWidget {
  Future<ListPayload<GitlabGroup, int>> _query(BuildContext context,
      [int page = 1]) async {
    final auth = Provider.of<AuthModel>(context);
    final res = await auth.fetchGitlabWithPage('/groups?page=$page');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: <GitlabGroup>[
        for (var v in res.data) GitlabGroup.fromJson(v),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabGroup, int>(
      title: AppBarTitle('Groups'),
      onRefresh: () => _query(context),
      onLoadMore: (page) => _query(context, page),
      itemBuilder: (v) {
        return UserItem(
          avatarUrl: v.avatarUrl,
          login: v.path,
          bio: Text(v.description ?? ''),
          url: '/gitlab/group/${v.id}',
        );
      },
    );
  }
}
