import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:provider/provider.dart';
import 'package:github/github.dart';
import 'package:timeago/timeago.dart' as timeago;

/// There are some restrictions of organization repos with OAuth
///
/// https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/restricting-access-to-your-organizations-data
///
/// So we use RESTful API here for repos of org
class GhOrgReposScreen extends StatelessWidget {
  final String owner;
  GhOrgReposScreen(this.owner);

  Future<ListPayload<Repository, int>> _query(BuildContext context,
      [int page = 1]) async {
    final auth = Provider.of<AuthModel>(context);
    final rs = await auth.ghClient.getJSON<List, List<Repository>>(
      '/orgs/$owner/repos?sort=updated&page=$page',
      convert: (vs) => [for (var v in vs) Repository.fromJson(v)],
    );
    return ListPayload(
      cursor: page + 1,
      items: rs,
      hasMore: rs.isNotEmpty, // TODO:
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<Repository, int>(
      title: AppBarTitle('Repositories'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (v) {
        return RepositoryItem.gh(
          owner: v.owner.login,
          avatarUrl: v.owner.avatarUrl,
          name: v.name,
          description: v.description,
          starCount: v.stargazersCount,
          forkCount: v.forksCount,
          primaryLanguageName: v.language,
          primaryLanguageColor: null,
          note: 'Updated ${timeago.format(v.updatedAt)}',
          isPrivate: v.isPrivate,
          isFork: v.isFork,
        );
      },
    );
  }
}
