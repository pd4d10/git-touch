import 'package:flutter/material.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class GeReposScreen extends StatelessWidget {
  final String api;
  final String title;

  GeReposScreen(String owner)
      : api = '/users/$owner/repos',
        title = 'Repositories';
  GeReposScreen.star(String owner)
      : api = '/users/$owner/starred',
        title = 'Stars';

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteeRepo, int>(
      title: AppBarTitle(title),
      fetch: (page) async {
        final res =
            await context.read<AuthModel>().fetchGiteeWithPage(api, page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GiteeRepo.fromJson(v)],
        );
      },
      itemBuilder: (v) {
        return RepositoryItem(
          owner: v.owner.login,
          avatarUrl: v.owner.avatarUrl,
          name: v.path,
          description: v.description,
          starCount: v.stargazersCount,
          forkCount: v.forksCount,
          note: 'Updated ${timeago.format(v.updatedAt)}',
          url: '/gitea/${v.owner.login}/${v.path}',
          avatarLink: '/gitea/${v.owner.login}',
        );
      },
    );
  }
}
