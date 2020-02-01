import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';

class GitlabMembers extends StatelessWidget {
  final int id;
  final String type;
  GitlabMembers(this.id, this.type);

  Future<ListPayload<GitlabUser, int>> _query(BuildContext context,
      [int page = 1]) async {
    final auth = Provider.of<AuthModel>(context);
    final res = await auth.fetchGitlabWithPage('/$type/$id/members?page=$page');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: <GitlabUser>[
        for (var v in res.data) GitlabUser.fromJson(v),
      ],
    );
  }

  // https://docs.gitlab.com/ee/api/access_requests.html#valid-access-levels
  static const accessLevelMap = {
    10: 'Guest',
    20: 'Reporter',
    30: 'Developer',
    40: 'Maintainer',
    50: 'Owner',
  };

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabUser, int>(
      title: AppBarTitle('Members'),
      onRefresh: () => _query(context),
      onLoadMore: (page) => _query(context, page),
      itemBuilder: (v) {
        return UserItem(
          avatarUrl: v.avatarUrl,
          login: v.username,
          bio: Text(accessLevelMap[v.accessLevel] ?? ''),
          url: '/gitlab/user/${v.id}',
        );
      },
    );
  }
}
