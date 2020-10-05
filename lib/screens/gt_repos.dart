import 'package:flutter/material.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class GtReposScreen extends StatelessWidget {
  final String owner;
  final String api;
  final String title;

  GtReposScreen(this.owner)
      : api = '/users/$owner/repos',
        title = 'Repositories';
  GtReposScreen.star(this.owner)
      : api = '/users/$owner/starred',
        title = 'Stars';
  GtReposScreen.org(this.owner)
      : api = '/orgs/$owner/repos',
        title = 'Repositories';

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaRepository, int>(
      title: AppBarTitle(title),
      onLoadMore: (page) async {
        page = page ?? 1;
        final res = await context
            .read<AuthModel>()
            .fetchGiteaWithPage('$api?page=$page');
        return ListPayload(
          cursor: page + 1,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GiteaRepository.fromJson(v)],
        );
      },
      itemBuilder: (v) {
        return RepositoryItem(
          owner: v.owner.login,
          avatarUrl: v.owner.avatarUrl,
          name: v.name,
          description: v.description,
          starCount: v.starsCount,
          forkCount: v.forksCount,
          note: 'Updated ${timeago.format(v.updatedAt)}',
          url: '/gitea/${v.owner.login}/${v.name}',
          avatarLink: '/gitea/${v.owner.login}',
        );
      },
    );
  }
}
