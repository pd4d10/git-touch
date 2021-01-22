import 'package:flutter/material.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';

class GoUsersScreen extends StatelessWidget {
  final String api;
  final String title;

  GoUsersScreen.followers(String login)
      : api = '/users/$login/followers',
        title = 'Followers';
  GoUsersScreen.following(String login)
      : api = '/users/$login/following',
        title = "Following";

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GogsUser, int>(
      title: AppBarTitle(title),
      fetch: (page) async {
        final res =
            await context.read<AuthModel>().fetchGogsWithPage(api, page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GogsUser.fromJson(v)],
        );
      },
      itemBuilder: (payload) {
        return UserItem.gogs(
          login: payload.username,
          name: payload.fullName,
          avatarUrl: payload.avatarUrl,
          bio: null,
        );
      },
    );
  }
}
