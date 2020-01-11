import 'package:flutter/material.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class RepositoriesScreen extends StatelessWidget {
  final String owner;
  final String title;
  final bool isStar;

  RepositoriesScreen(this.owner)
      : title = 'Repositories',
        isStar = false;
  RepositoriesScreen.stars(this.owner)
      : title = 'Stars',
        isStar = true;

  Future<ListPayload<GhReposRepository, String>> _query(BuildContext context,
      [String cursor]) async {
    final res = await Provider.of<AuthModel>(context).gqlClient.execute(
        GhReposQuery(
            variables:
                GhReposArguments(owner: owner, isStar: isStar, after: cursor)));
    final data = res.data.repositoryOwner;
    switch (data.resolveType) {
      case 'User':
        final user = data as GhReposUser;
        if (isStar) {
          return ListPayload(
            cursor: user.starredRepositories.pageInfo.endCursor,
            items: user.starredRepositories.nodes,
            hasMore: user.starredRepositories.pageInfo.hasNextPage,
          );
        } else {
          return ListPayload(
            cursor: user.repositories.pageInfo.endCursor,
            items: user.repositories.nodes,
            hasMore: user.repositories.pageInfo.hasNextPage,
          );
        }
        break;
      case 'Organization':
        final org = data as GhReposOrganization;
        return ListPayload(
          cursor: org.pinnableItems.pageInfo.endCursor,
          items: org.pinnableItems.nodes,
          hasMore: org.pinnableItems.pageInfo.hasNextPage,
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GhReposRepository, String>(
        title: AppBarTitle(title),
        onRefresh: () => _query(context),
        onLoadMore: (cursor) => _query(context, cursor),
        itemBuilder: (v) {
          return RepositoryItem.gh(
            v.owner.login,
            v.owner.avatarUrl,
            v.name,
            v.description,
            v.stargazers.totalCount,
            v.forks.totalCount,
            v.primaryLanguage?.name,
            v.primaryLanguage?.color,
            'Updated ${timeago.format(v.updatedAt)}',
            isPrivate: v.isPrivate,
            isFork: v.isFork,
          );
        });
  }
}
