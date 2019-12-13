import 'package:flutter/material.dart';
import 'package:git_touch/graphql/github_commits.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';

final commitsRouter = RouterScreen(
    '/:owner/:name/commits',
    (context, params) =>
        CommitsScreen(params['owner'].first, params['name'].first));

class CommitsScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;

  CommitsScreen(this.owner, this.name, {this.branch});

  Future<ListPayload<GithubCommitsCommit, String>> _query(BuildContext context,
      [String cursor]) async {
    final res = await Provider.of<AuthModel>(context).gqlClient.execute(
        GithubCommitsQuery(
            variables: GithubCommitsArguments(
                owner: owner,
                name: name,
                hasRef: branch != null,
                ref: branch ?? '',
                after: cursor)));
    final ref = res.data.repository.defaultBranchRef ?? res.data.repository.ref;
    final history = (ref.target as GithubCommitsCommit).history;
    return ListPayload(
      cursor: history.pageInfo.endCursor,
      hasMore: history.pageInfo.hasNextPage,
      items: history.nodes,
    );
  }

  Widget _buildStatus(String state) {
    var size = 18.0;
    switch (state) {
      case 'SUCCESS':
        return Icon(Octicons.check, color: GithubPalette.open, size: size);
      case 'FAILURE':
        return Icon(Octicons.x, color: GithubPalette.closed, size: size);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GithubCommitsCommit, String>(
      title: AppBarTitle('Commits'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (payload) {
        return Link(
          url: payload.url,
          child: Container(
            padding: CommonStyle.padding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Avatar.medium(url: payload.author.avatarUrl),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(payload.messageHeadline,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14)),
                      SizedBox(height: 4),
                      Wrap(
                        children: <Widget>[
                          Text(
                              payload.author.user?.login ?? payload.author.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14)),
                          Text(
                              ' committed ' +
                                  timeago.format(payload.committedDate),
                              style: TextStyle(
                                  color: PrimerColors.gray600, fontSize: 14)),
                          // if (payload['status'] != null) ...[
                          //   SizedBox(width: 4),
                          //   _buildStatus(payload['status']['state'])
                          // ], TODO:
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
