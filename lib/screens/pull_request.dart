import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';
import '../scaffolds/long_list.dart';
import '../widgets/timeline_item.dart';
import '../widgets/comment_item.dart';

class PullRequestScreen extends StatefulWidget {
  final int number;
  final String owner;
  final String name;

  PullRequestScreen({
    @required this.number,
    @required this.owner,
    @required this.name,
  });

  PullRequestScreen.fromFullName(
      {@required this.number, @required String fullName})
      : this.owner = fullName.split('/')[0],
        this.name = fullName.split('/')[1];

  @override
  _PullRequestScreenState createState() => _PullRequestScreenState();
}

var commonChunk = '''
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
''';

class _PullRequestScreenState extends State<PullRequestScreen> {
  get owner => widget.owner;
  get id => widget.number;
  get name => widget.name;

  Future queryPullRequest() async {
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    pullRequest(number: $id) {
      $graphqlChunk1
      merged
      additions
      deletions
      commits {
        totalCount
      }
      timeline(first: $pageSize) {
        totalCount
        pageInfo {
          endCursor
        }
        nodes {
          $commonChunk
        }
      }
    }
  }
}
''');
    return data['repository']['pullRequest'];
  }

  Future queryMore(String cursor) async {
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    pullRequest(number: $id) {
      timeline(first: $pageSize, after: $cursor) {
        totalCount
        pageInfo {
          endCursor
        }
        nodes {
          $commonChunk
        }
      }
    }
  }
}
''');
    return data['repository']['pullRequest'];
  }

  Future<List> queryTrailing() async {
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    pullRequest(number: $id) {
      timeline(last: $pageSize) {
        nodes {
          $commonChunk
        }
      }
    }
  }
}
''');
    return data['repository']['pullRequest']['timeline']['nodes'];
  }

  Widget _buildBadge(payload) {
    Color bgColor;
    IconData iconData;
    String text;

    if (payload['merged']) {
      bgColor = Palette.purple;
      iconData = Octicons.git_merge;
      text = 'Merged';
    } else if (payload['closed']) {
      bgColor = Palette.red;
      iconData = Octicons.git_pull_request;
      text = 'Closed';
    } else {
      bgColor = Palette.green;
      iconData = Octicons.git_pull_request;
      text = 'Open';
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: <Widget>[
          Icon(iconData, color: Colors.white, size: 15),
          Padding(padding: EdgeInsets.only(left: 2)),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  get _fullName => widget.owner + '/' + widget.name;

  @override
  Widget build(BuildContext context) {
    return LongListScaffold(
      title: Text(_fullName + ' #' + widget.number.toString()),
      headerBuilder: (payload) {
        return Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        payload['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 8)),
                    _buildBadge(payload),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                CommentItem(payload),
              ],
            ),
          )
        ]);
      },
      itemBuilder: (itemPayload) => TimelineItem(itemPayload),
      onRefresh: () async {
        var res = await queryPullRequest();
        int totalCount = res['timeline']['totalCount'];
        String cursor = res['timeline']['pageInfo']['endCursor'];
        List leadingItems = res['timeline']['nodes'];

        var payload = LongListPayload(
          header: res,
          totalCount: totalCount,
          cursor: cursor,
          leadingItems: leadingItems,
          trailingItems: [],
        );

        if (totalCount > 2 * pageSize) {
          payload.trailingItems = await queryTrailing();
        }

        return payload;
      },
      onLoadMore: (String _cursor) async {
        var res = await queryMore(_cursor);
        int totalCount = res['timeline']['totalCount'];
        String cursor = res['timeline']['pageInfo']['endCursor'];
        List leadingItems = res['timeline']['nodes'];

        var payload = LongListPayload(
          totalCount: totalCount,
          cursor: cursor,
          leadingItems: leadingItems,
        );

        return payload;
      },
    );
  }
}
