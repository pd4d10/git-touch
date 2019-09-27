import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class IssuesScreen extends StatelessWidget {
  final String owner;
  final String name;
  final bool isPullRequest;

  IssuesScreen({
    @required this.owner,
    @required this.name,
    this.isPullRequest = false,
  });

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
      title: AppBarTitle(
          (isPullRequest ? 'Pull requests' : 'Issues') + ' of $owner/$name'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(cursor),
      itemBuilder: (payload) =>
          IssueItem(payload: payload, isPullRequest: isPullRequest),
    );
  }
}
