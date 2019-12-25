import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import '../scaffolds/long_list.dart';
import '../widgets/timeline_item.dart';
import '../widgets/comment_item.dart';

final issueRouter = RouterScreen(
    '/:owner/:name/issues/:number',
    (context, params) => IssueScreen(params['owner'].first,
        params['name'].first, int.parse(params['number'].first)));

final pullRouter = RouterScreen(
    '/:owner/:name/pulls/:number',
    (context, params) => IssueScreen(params['owner'].first,
        params['name'].first, int.parse(params['number'].first),
        isPullRequest: true));

final reactionChunk = emojiMap.entries.map((entry) {
  var key = entry.key;
  return '''
$key: reactions(content: $key) {
  totalCount
  viewerHasReacted
}''';
}).join('\n');

/// Screen for issue and pull request
class IssueScreen extends StatefulWidget {
  final String owner;
  final String name;
  final int number;
  final bool isPullRequest;

  IssueScreen(this.owner, this.name, this.number, {this.isPullRequest = false});

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
  closed
  url
  ...CommentParts
  ...ReactableParts
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
  ...CommentParts
  ...ReactableParts
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
... on HeadRefForcePushedEvent {
  createdAt
  actor {
    login
  }
  pullRequest {
    headRef {
      name
    }
  }
  beforeCommit {
    oid
  }
  afterCommit {
    oid
  }
}
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
  comments(first: 10) {
    nodes {
      ...CommentParts
      ...ReactableParts
    }
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

    var data = await Provider.of<AuthModel>(context).query('''
fragment CommentParts on Comment {
  id
  createdAt
  body
  author {
    login
    avatarUrl
  }
}

fragment ReactableParts on Reactable {
  $reactionChunk
}

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

  StateLabelStatus _getLabelStatus(payload) {
    StateLabelStatus status;

    if (isPullRequest) {
      if (payload['merged']) {
        status = StateLabelStatus.pullMerged;
      } else if (payload['closed']) {
        status = StateLabelStatus.pullClosed;
      } else {
        status = StateLabelStatus.pullOpened;
      }
    } else {
      if (payload['closed']) {
        status = StateLabelStatus.issueClosed;
      } else {
        status = StateLabelStatus.issueOpened;
      }
    }

    return status;
  }

  _handleReaction(payload) {
    return (String emojiKey, bool isRemove) async {
      if (emojiKey == null) return;

      var id = payload['id'] as String;
      var operation = isRemove ? 'remove' : 'add';
      await Provider.of<AuthModel>(context).query('''
mutation {
  ${operation}Reaction(input: {subjectId: "$id", content: $emojiKey}) {
    clientMutationId
  }
}
    ''');
      setState(() {
        payload[emojiKey]['totalCount'] += isRemove ? -1 : 1;
        payload[emojiKey]['viewerHasReacted'] = !isRemove;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return LongListStatefulScaffold(
      title: Text('Issue #$number'),
      trailingBuilder: (payload) {
        return ActionButton(
          title: (isPullRequest ? 'Pull Request' : 'Issue') + ' Actions',
          items: [
            if (payload != null) ...[
              ActionItem.share(payload['url']),
              ActionItem.launch(payload['url']),
            ],
          ],
        );
      },
      headerBuilder: (payload) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: CommonStyle.padding,
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
                      StateLabel(_getLabelStatus(payload))
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16)),
                  CommentItem(
                    payload,
                    onReaction: _handleReaction(payload),
                  ),
                ],
              ),
            ),
            CommonStyle.border,
          ],
        );
      },
      itemBuilder: (itemPayload) =>
          TimelineItem(itemPayload, onReaction: _handleReaction(itemPayload)),
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
