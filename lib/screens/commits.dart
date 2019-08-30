import 'package:flutter/material.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:git_touch/providers/settings.dart';
import 'package:git_touch/scaffolds/list.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';

class CommitsScreen extends StatelessWidget {
  final String owner;
  final String name;

  CommitsScreen(this.owner, this.name);

  Future<ListPayload> _query(BuildContext context, [String cursor]) async {
    var params = 'first: 30';
    if (cursor != null) {
      params += ', after: "$cursor"';
    }
    var data = await SettingsProvider.of(context).query('''
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
              messageHeadline
              committedDate
              author {
                email
                avatarUrl
                user {
                  login
                }
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

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text('Commits'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (payload) {
        return Link(
          url: 'https://github.com/$owner/$name/commit/' + payload['oid'],
          child: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                Avatar(url: payload['author']['avatarUrl']),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(payload['messageHeadline'],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14)),
                      SizedBox(height: 4),
                      Row(
                        children: <Widget>[
                          Text(payload['author']['user']['login'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14)),
                          Text(
                              ' committed ' +
                                  timeago.format(
                                      DateTime.parse(payload['committedDate'])),
                              style: TextStyle(
                                  color: PrimerColors.gray600, fontSize: 14)),
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
