import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';

class GlGroupsScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabGroup, int>(
      title: AppBarTitle('Groups'),
      fetch: (page) async {
        page = page ?? 1;
        final auth = context.read<AuthModel>();
        final res = await auth.fetchGitlabWithPage('/groups?page=$page');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <GitlabGroup>[
            for (var v in res.data) GitlabGroup.fromJson(v),
          ],
        );
      },
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
