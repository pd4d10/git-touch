import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/utils.dart';
import '../scaffolds/long_list.dart';
import '../widgets/timeline_item.dart';
import '../widgets/comment_item.dart';
import '../providers/settings.dart';
import '../widgets/action.dart';

/// Screen for issue and pull request
class IssueScreen extends StatefulWidget {
  final int number;
  final String owner;
  final String name;
  final bool isPullRequest;

  IssueScreen({
    @required this.number,
    @required this.owner,
    @required this.name,
    this.isPullRequest = false,
  });

  IssueScreen.fromFullName({
    @required this.number,
    @required String fullName,
    this.isPullRequest = false,
  })  : owner = fullName.split('/')[0],
        name = fullName.split('/')[1];

  @override
  _IssueScreenState createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  String get owner => widget.owner;
  String get name => widget.name;
  int get number => widget.number;
  bool get isPullRequest => widget.isPullRequest;

  String get resource => isPullRequest ? 'pullRequest' : 'issue';

  String get issueChunk {
    var base = '''
title
createdAt
body
author {
  login
  avatarUrl
}
closed
url
''';

    if (isPullRequest) {
      base += '''
merged
additions
deletions
commits {
  totalCount
}
''';
    }
    return base;
  }

  String get timelineChunk {
    var base = '''
__typename
... on IssueComment {
  createdAt
  body
  author {
    login
    avatarUrl
  }
}
... on Commit {
  committedDate
  oid
  author {
    user {
      login
    }
  }
}
... on ReferencedEvent {
  createdAt
  isCrossRepository
  actor {
    login
  }
  commit {
    oid
    url
  }
  commitRepository {
    owner {
      login
    }
    name
  }
}
... on RenamedTitleEvent {
  createdAt
  previousTitle
  currentTitle
  actor {
    login
  }
}
... on ClosedEvent {
  createdAt
  actor {
    login
  }
}
... on ReopenedEvent {
  createdAt
  actor {
    login
  }
}
... on CrossReferencedEvent {
  createdAt
  actor {
    login
  }
  source {
    __typename
    ... on Issue {
      number
      repository {
        owner {
          login
        }
        name
      }
    }
    ... on PullRequest {
      number
      repository {
        owner {
          login
        }
        name
      }
    }
  }
}
... on LabeledEvent {
  createdAt
  actor {
    login
  }
  label {
    name
    color
  }
}
... on UnlabeledEvent {
  createdAt
  actor {
    login
  }
  label {
    name
    color
  }
}
... on MilestonedEvent {
  createdAt
  actor {
    login
  }
  milestoneTitle
}
... on LockedEvent {
  createdAt
  actor {
    login
  }
  lockReason
}
... on UnlockedEvent {
  createdAt
  actor {
    login
  }
}
... on AssignedEvent {
  createdAt
  actor {
    login
  }
  user {
    login
  }
}
''';

    if (isPullRequest) {
      base += '''
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
    }

    return base;
  }

  Future _queryIssue({String cursor, bool trailing = false}) async {
    String timelineParams;
    if (trailing) {
      timelineParams = 'last: $pageSize';
    } else {
      timelineParams = 'first: $pageSize';
      if (cursor != null) {
        timelineParams += ', after: $cursor';
      }
    }

    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    $resource(number: $number) {
      $issueChunk
      timeline($timelineParams) {
        totalCount
        pageInfo {
          hasNextPage
          endCursor
        }
        nodes {
          $timelineChunk
        }
      }
    }
  }
}
''');
    return data['repository'][resource];
  }

  Widget _buildBadge(payload) {
    Color bgColor;
    IconData iconData;
    String text;

    if (isPullRequest) {
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
    } else {
      if (payload['closed']) {
        bgColor = Palette.red;
        iconData = Octicons.issue_closed;
        text = 'Closed';
      } else {
        bgColor = Palette.green;
        iconData = Octicons.issue_opened;
        text = 'Open';
      }
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

  @override
  Widget build(BuildContext context) {
    return LongListScaffold(
      title: Text('$owner/$name #$number'),
      trailingBuilder: (payload) {
        return ActionButton(
          title: (isPullRequest ? 'Pull Request' : 'Issue') + ' Actions',
          actions: [
            Action(
              text: 'Share',
              onPress: () {
                Share.share(payload['url']);
              },
            ),
            Action(
              text: 'Open in Browser',
              onPress: () {
                launch(payload['url']);
              },
            ),
          ],
        );
      },
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
        var res = await _queryIssue();
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
          var res = await _queryIssue(trailing: true);
          payload.trailingItems = res['timeline']['nodes'];
        }

        return payload;
      },
      onLoadMore: (String _cursor) async {
        var res = await _queryIssue(cursor: _cursor);
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
