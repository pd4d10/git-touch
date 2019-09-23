import 'package:flutter/material.dart';
import 'package:git_touch/models/settings.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:git_touch/scaffolds/list.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';

class CommitsScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;

  CommitsScreen(this.owner, this.name, {this.branch});

  Future<ListPayload> _query(BuildContext context, [String cursor]) async {
    var params = 'first: 30';
    if (cursor != null) {
      params += ', after: "$cursor"';
    }
    // TODO: Specify branch
    var data = await Provider.of<SettingsModel>(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    ref(qualifiedName: "master") {
      target {
        ... on Commit {
          history($params) {
            pageInfo {
              hasNextPage
              endCursor
            }
            nodes {
              oid
              url
              messageHeadline
              committedDate
              author {
                name
                email
                avatarUrl
                user {
                  login
                }
              }
              status {
                state
              }
            }
          }
        }
      }
    }
  }
}
    ''');

    var history = data["repository"]['ref']['target']['history'];

    return ListPayload(
      cursor: history["pageInfo"]["endCursor"],
      hasMore: history['pageInfo']['hasNextPage'],
      items: history["nodes"],
    );
  }

  Widget _buildStatus(String state) {
    var size = 18.0;
    switch (state) {
      case 'SUCCESS':
        return Icon(Octicons.check, color: PrimerColors.green500, size: size);
      case 'FAILURE':
        return Icon(Octicons.x, color: PrimerColors.red600, size: size);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: AppBarTitle('Commits'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (payload) {
        return Link(
          url: payload['url'],
          child: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Avatar(url: payload['author']['avatarUrl'], size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(payload['messageHeadline'],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14)),
                      SizedBox(height: 4),
                      Wrap(
                        children: <Widget>[
                          Text(
                              payload['author']['user'] == null
                                  ? payload['author']['name']
                                  : payload['author']['user']['login'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14)),
                          Text(
                              ' committed ' +
                                  timeago.format(
                                      DateTime.parse(payload['committedDate'])),
                              style: TextStyle(
                                  color: PrimerColors.gray600, fontSize: 14)),
                          if (payload['status'] != null) ...[
                            SizedBox(width: 4),
                            _buildStatus(payload['status']['state'])
                          ],
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
