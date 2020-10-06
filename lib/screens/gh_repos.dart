import 'package:flutter/material.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class GhReposScreen extends StatelessWidget {
  final String owner;
  final String title;
  final bool isStar;

  GhReposScreen(this.owner)
      : title = 'Repositories',
        isStar = false;
  GhReposScreen.stars(this.owner)
      : title = 'Stars',
        isStar = true;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GhReposRepository, String>(
      title: AppBarTitle(title),
      fetch: (cursor) async {
        final auth = context.read<AuthModel>();
        final res = await auth.gqlClient.execute(GhReposQuery(
            variables:
                GhReposArguments(owner: owner, isStar: isStar, after: cursor)));
        final data = res.data.user;
        if (isStar) {
          return ListPayload(
            cursor: data.starredRepositories.pageInfo.endCursor,
            items: data.starredRepositories.nodes,
            hasMore: data.starredRepositories.pageInfo.hasNextPage,
          );
        } else {
          return ListPayload(
            cursor: data.repositories.pageInfo.endCursor,
            items: data.repositories.nodes,
            hasMore: data.repositories.pageInfo.hasNextPage,
          );
        }
      },
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
      },
    );
  }
}
