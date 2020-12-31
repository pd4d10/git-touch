import 'package:flutter/material.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class GhCommitsScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;
  GhCommitsScreen(this.owner, this.name, {this.branch});

  Widget _buildStatus(GhCommitsStatusState state) {
    const size = 18.0;
    switch (state) {
      case GhCommitsStatusState.SUCCESS:
        return Icon(Octicons.check, color: GithubPalette.open, size: size);
      case GhCommitsStatusState.FAILURE:
        return Icon(Octicons.x, color: GithubPalette.closed, size: size);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GhCommitsCommit, String>(
      title: AppBarTitle(S.of(context).commits),
      fetch: (cursor) async {
        final res = await context.read<AuthModel>().gqlClient.execute(
            GhCommitsQuery(
                variables: GhCommitsArguments(
                    owner: owner,
                    name: name,
                    hasRef: branch != null,
                    ref: branch ?? '',
                    after: cursor)));
        final ref =
            res.data.repository.defaultBranchRef ?? res.data.repository.ref;
        final history = (ref.target as GhCommitsCommit).history;
        return ListPayload(
          cursor: history.pageInfo.endCursor,
          hasMore: history.pageInfo.hasNextPage,
          items: history.nodes,
        );
      },
      itemBuilder: (payload) {
        final login = payload.author?.user?.login;
        return CommitItem(
          url: payload.url,
          avatarUrl: payload.author?.avatarUrl,
          avatarLink: login == null ? null : '/github/$login',
          message: payload.messageHeadline,
          author: login ?? payload.author.name,
          createdAt: payload.committedDate,
          widgets: payload.status == null
              ? null
              : [
                  SizedBox(width: 4),
                  _buildStatus(payload.status.state),
                ],
        );
      },
    );
  }
}
