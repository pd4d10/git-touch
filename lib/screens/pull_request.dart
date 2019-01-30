import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/widgets.dart';

Future queryPullRequest(int id, String owner, String name) async {
  var data = await query('''
{
  repository(owner: "$owner", name: "$name") {
    pullRequest(number: $id) {
      $graphqlChunk1
      merged
      permalink
      additions
      deletions
      commits {
        totalCount
      }
      timeline(first: $pageSize) {
        pageInfo {
          hasNextPage
          endCursor
        }
        nodes {
          $graghqlChunk
          ... on ReviewRequestedEvent {
            createdAt
            actor {
              login
            }
            requestedReviewer {
              ... on User {
                login
              }
            }
          }
          ... on PullRequestReview {
            createdAt
            state
            author {
              login
            }
          }
          ... on MergedEvent {
            createdAt
            mergeRefName
            actor {
              login
            }
            commit {
              oid
              url
            }
          }
          ... on HeadRefDeletedEvent {
            createdAt
            actor {
              login
            }
            headRefName
          }
        }
      }
    }
  }
}
''');
  return data['repository']['pullRequest'];
}

class PullRequestScreen extends StatelessWidget {
  final int id;
  final String owner;
  final String name;

  PullRequestScreen(this.id, this.owner, this.name);

  Widget _buildBadge() {
    // bool merged = payload['merged'];
    // int bgColor = merged ? Palette.purple : Palette.green;
    // IconData iconData = merged ? Octicons.git_merge : Octicons.git_pull_request;
    // String text = merged ? 'Merged' : 'Open';
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Color(bgColor),
    //     borderRadius: BorderRadius.all(Radius.circular(4)),
    //   ),
    //   padding: EdgeInsets.all(6),
    //   child: Row(
    //     children: <Widget>[
    //       Icon(iconData, color: Colors.white, size: 15),
    //       Text(text,
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontWeight: FontWeight.w600,
    //           )),
    //     ],
    //   ),
    // );
    return Text('test');
  }

  @override
  Widget build(BuildContext context) {
    return IssuePullRequestScreen(
      id: id,
      owner: owner,
      name: name,
      init: () => queryPullRequest(id, owner, name),
      extra: Row(
        children: <Widget>[_buildBadge()],
      ),
    );
  }
}
