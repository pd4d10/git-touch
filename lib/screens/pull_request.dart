import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';
import '../widgets/list_scaffold.dart';
import '../widgets/timeline_item.dart';
import '../widgets/comment_item.dart';

class PullRequestScreen extends StatefulWidget {
  final int id;
  final String owner;
  final String name;

  PullRequestScreen(this.id, this.owner, this.name);

  @override
  _PullRequestScreenState createState() => _PullRequestScreenState();
}

class _PullRequestScreenState extends State<PullRequestScreen> {
  Map<String, dynamic> payload;

  Future queryPullRequest(BuildContext context) async {
    var owner = widget.owner;
    var id = widget.id;
    var name = widget.name;

    var data = await SettingsProvider.of(context).query('''
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

  Widget _buildBadge() {
    bool merged = payload['merged'];
    Color bgColor = merged ? Palette.purple : Palette.green;
    IconData iconData = merged ? Octicons.git_merge : Octicons.git_pull_request;
    String text = merged ? 'Merged' : 'Open';
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: <Widget>[
          Icon(iconData, color: Colors.white, size: 15),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  get _fullName => widget.owner + '/' + widget.name;

  Widget _buildHeader() {
    return Column(children: <Widget>[
      Container(
        // padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBadge(),
            Text(
              payload['title'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            CommentItem(payload),
          ],
        ),
      )
    ]);
  }

  List get _items => payload == null ? [] : payload['timeline']['nodes'];

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text(_fullName + ' #' + widget.id.toString()),
      header: payload == null ? null : _buildHeader(),
      itemCount: _items.length,
      itemBuilder: (context, index) => TimelineItem(_items[index], payload),
      onRefresh: () async {
        var _payload = await queryPullRequest(context);
        if (mounted) {
          setState(() {
            payload = _payload;
          });
        }
      },
      // onLoadMore: () => ,
    );
  }
}
