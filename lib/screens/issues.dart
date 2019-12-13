import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';

final issuesRouter = RouterScreen(
    '/:owner/:name/issues',
    (context, params) =>
        IssuesScreen(params['owner'].first, params['name'].first));

class IssuesScreen extends StatelessWidget {
  final String owner;
  final String name;
  final bool isPullRequest;

  IssuesScreen(this.owner, this.name, {this.isPullRequest = false});

  Future<ListPayload> _query(BuildContext context, [String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    var resource = isPullRequest ? 'pullRequests' : 'issues';

    var data = await Provider.of<AuthModel>(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    $resource(states: OPEN, orderBy: {field: CREATED_AT, direction: DESC}, first: $pageSize$cursorChunk) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        $issueGqlChunk
      }
    }
  }
}
    ''');

    var repo = data["repository"][resource];

    return ListPayload(
      cursor: repo["pageInfo"]["endCursor"],
      hasMore: repo['pageInfo']['hasNextPage'],
      items: repo["nodes"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold(
      title: AppBarTitle((isPullRequest ? 'Pull requests' : 'Issues')),
      actionBuilder: () => ActionEntry(
          iconData: Octicons.plus,
          onTap: () {
            Provider.of<ThemeModel>(context)
                .push(context, '/$owner/$name/issues/new');
          }),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (payload) =>
          IssueItem(payload: payload, isPullRequest: isPullRequest),
    );
  }
}
