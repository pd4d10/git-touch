import 'package:flutter/material.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:provider/provider.dart';

final pullsRouter = RouterScreen(
    '/:owner/:name/pulls',
    (context, params) =>
        PullsScreen(params['owner'].first, params['name'].first));

class PullsScreen extends StatelessWidget {
  final String owner;
  final String name;

  PullsScreen(this.owner, this.name);

  Future<ListPayload<GhPullsPullRequest, String>> _query(BuildContext context,
      [String cursor]) async {
    final res =
        await Provider.of<AuthModel>(context).gqlClient.execute(GhPullsQuery(
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
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GhPullsPullRequest, String>(
      title: AppBarTitle('Pull requests'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (p) => IssueItem(
        isPr: true,
        author: p.author?.login,
        avatarUrl: p.author?.avatarUrl,
        commentCount: p.comments.totalCount,
        number: p.number,
        title: p.title,
        updatedAt: p.updatedAt,
        labels: p.labels.nodes.isEmpty
            ? null
            : Wrap(spacing: 4, runSpacing: 4, children: [
                for (var label in p.labels.nodes)
                  MyLabel(name: label.name, cssColor: label.color)
              ]),
        url:
            '/${p.repository.owner.login}/${p.repository.name}/pulls/${p.number}',
      ),
    );
  }
}
