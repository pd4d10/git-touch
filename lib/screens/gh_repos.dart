import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/graphql/github.data.gql.dart';
import 'package:git_touch/graphql/github.req.gql.dart';
import 'package:git_touch/graphql/github.var.gql.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class GhRepos extends StatelessWidget {
  final String login;
  GhRepos(this.login);

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GReposRepoItem, String?>(
      title: AppBarTitle('Repositories'),
      fetch: (cursor) async {
        final auth = context.read<AuthModel>();
        final req = GReposReq((b) {
          b.vars.login = login;
          b.vars.after = cursor;
        });
        final OperationResponse<GReposData, GReposVars?> res =
            await auth.gqlClient.request(req).first;
        final p = res.data!.user!.repositories;
        return ListPayload(
          cursor: p.pageInfo.endCursor,
          hasMore: p.pageInfo.hasNextPage,
          items: p.nodes!,
        );
      },
      itemBuilder: (p) {
        return RepositoryItem.gql(p,
            note: 'Updated ${timeago.format(p.updatedAt)}');
      },
    );
  }
}

class GhStars extends StatelessWidget {
  final String login;
  GhStars(this.login);

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GReposRepoItem, String?>(
      title: AppBarTitle('Stars'),
      fetch: (cursor) async {
        final auth = context.read<AuthModel>();
        final req = GStarsReq((b) {
          b.vars.login = login;
          b.vars.after = cursor;
        });
        final OperationResponse<GStarsData, GStarsVars?> res =
            await auth.gqlClient.request(req).first;
        final p = res.data!.user!.starredRepositories;
        return ListPayload(
          cursor: p.pageInfo.endCursor,
          hasMore: p.pageInfo.hasNextPage,
          items: p.nodes!,
        );
      },
      itemBuilder: (p) {
        return RepositoryItem.gql(p,
            note: 'Updated ${timeago.format(p.updatedAt)}');
      },
    );
  }
}
