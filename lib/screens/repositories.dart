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
            owner: v.owner.login,
            avatarUrl: v.owner.avatarUrl,
            name: v.name,
            description: v.description,
            starCount: v.stargazers.totalCount,
            forkCount: v.forks.totalCount,
            primaryLanguageName: v.primaryLanguage?.name,
            primaryLanguageColor: v.primaryLanguage?.color,
            note: 'Updated ${timeago.format(v.updatedAt)}',
            isPrivate: v.isPrivate,
            isFork: v.isFork,
          );
        });
  }
}
