import 'package:flutter/material.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class GhPullsScreen extends StatelessWidget {
  final String owner;
  final String name;
  GhPullsScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GhPullsPullRequest, String>(
      title: AppBarTitle(S.of(context).pullRequests),
      fetch: (cursor) async {
        final res =
            await context.read<AuthModel>().gqlClient.execute(GhPullsQuery(
                    variables: GhPullsArguments(
                  owner: owner,
                  name: name,
                  cursor: cursor,
                )));
        final pulls = res.data.repository.pullRequests;
        return ListPayload(
          cursor: pulls.pageInfo.endCursor,
          hasMore: pulls.pageInfo.hasNextPage,
          items: pulls.nodes,
        );
      },
      itemBuilder: (p) => IssueItem(
        isPr: true,
        author: p.author?.login,
        avatarUrl: p.author?.avatarUrl,
        commentCount: p.comments.totalCount,
        subtitle: '#' + p.number.toString(),
        title: p.title,
        updatedAt: p.updatedAt,
        labels: p.labels.nodes.isEmpty
            ? null
            : Wrap(spacing: 4, runSpacing: 4, children: [
                for (var label in p.labels.nodes)
                  MyLabel(name: label.name, cssColor: label.color)
              ]),
        url:
            '/github/${p.repository.owner.login}/${p.repository.name}/pull/${p.number}',
      ),
    );
  }
}
