import 'package:flutter/material.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';

class GeUsersScreen extends StatelessWidget {
  final String api;
  final String title;

  GeUsersScreen.followers(String login)
      : api = '/users/$login/followers',
        title = 'Followers';
  GeUsersScreen.following(String login)
      : api = '/users/$login/following',
        title = "Following";
  // GeUsersScreen.member(String login)
  //     : api = '/orgs/$login/members',
  //       title = "Members";
  GeUsersScreen.stargazers(String owner, String repo)
      : api = '/repos/$owner/$repo/stargazers',
        title = 'Stargazers';
  GeUsersScreen.watchers(String owner, String repo)
      : api = '/repos/$owner/$repo/subscribers',
        title = 'Watchers';

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteeListUser, int>(
      title: AppBarTitle(title),
      fetch: (page) async {
        final res =
            await context.read<AuthModel>().fetchGiteeWithPage(api, page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GiteeListUser.fromJson(v)],
        );
      },
      itemBuilder: (p) {
        return UserItem.gitee(
          login: p.login,
          name: p.name,
          avatarUrl: p.avatarUrl,
          bio: Text(p.htmlUrl),
        );
      },
    );
  }
}
