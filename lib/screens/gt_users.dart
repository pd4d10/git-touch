import 'package:flutter/material.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GtUsersScreen extends StatelessWidget {
  final String login;
  final String api;
  final String title;

  GtUsersScreen.followers(this.login)
      : api = '/users/$login/followers',
        title = 'Followers';
  GtUsersScreen.following(this.login)
      : api = '/users/$login/following',
        title = "Following";
  GtUsersScreen.member(this.login)
      : api = '/orgs/$login/members',
        title = "Members";

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaUser, int>(
      title: AppBarTitle(title),
      onLoadMore: (page) async {
        page = page ?? 1;
        final res = await context
            .read<AuthModel>()
            .fetchGiteaWithPage('$api?page=$page');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GiteaUser.fromJson(v)],
        );
      },
      itemBuilder: (payload) {
        return UserItem(
          login: payload.login,
          avatarUrl: payload.avatarUrl,
          bio: Text('Joined on ${timeago.format(payload.created)}'),
          url: '/gitea/${payload.login}',
        );
      },
    );
  }
}
