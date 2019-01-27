import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:git_flux/utils/utils.dart';
import 'package:git_flux/widgets/widgets.dart';

const PAGE_SIZE = 100;

Future queryPullRequest(int id, String owner, String name) async {
  var data = await query('''
{
  repository(owner: "$owner", name: "$name") {
    pullRequest(number: $id) {
      title
      createdAt
      body
      merged
      permalink
      additions
      deletions
      author {
        login
        avatarUrl
      }
      commits {
        totalCount
      }
      timeline(first: $PAGE_SIZE) {
        pageInfo {
          hasNextPage
          endCursor
        }
        nodes {
          __typename
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
          ... on IssueComment {
            createdAt
            body
            author {
              login
              avatarUrl
            }
          }
          ... on LabeledEvent {
            createdAt
            label {
              name
              url
            }
            actor {
              login
            }
          }
          ... on ReferencedEvent {
            createdAt
            actor {
              login
            }
            commit {
              oid
              url
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
          ... on Commit {
            committedDate
            oid
            author {
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
''');
  return data['repository']['pullRequest'];
}

class PullRequestScreen extends StatefulWidget {
  final int id;
  final String owner;
  final String name;
  PullRequestScreen(this.id, this.owner, this.name);

  @override
  _PullRequestScreenState createState() => _PullRequestScreenState();
}

class _PullRequestScreenState extends State<PullRequestScreen> {
  int active = 0;
  Map<String, dynamic> payload;

  @override
  void initState() {
    super.initState();
    queryPullRequest(widget.id, widget.owner, widget.name).then((_payload) {
      setState(() {
        payload = _payload;
      });
    });
  }

  get _fullName => widget.owner + '/' + widget.name;

  Widget _buildBadge() {
    bool merged = payload['merged'];
    int bgColor = merged ? 0xff6f42c1 : 0xff2cbe4e;
    IconData iconData = merged ? Octicons.git_merge : Octicons.git_pull_request;
    String text = merged ? 'Merged' : 'Open';
    return Container(
      decoration: BoxDecoration(
        color: Color(bgColor),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: <Widget>[
          Icon(iconData, color: Colors.white, size: 15),
          Text(text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }

  TextSpan _buildReviewText(BuildContext context, item) {
    switch (item['state']) {
      case 'APPROVED':
        return TextSpan(text: ' approved these changes');
      default:
        return TextSpan(text: 'not implement');
    }
  }

  TextSpan _buildCommitText(BuildContext context, item) {}

  Widget _buildComment(BuildContext context, item) {
    // return Text('comment');
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Avatar(item['author']['login'], item['author']['avatarUrl']),
        Padding(padding: EdgeInsets.only(left: 10)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UserName(item['author']['login']),
              Text('opened ' + TimeAgo.formatFromString(item['createdAt'])),
            ],
          ),
        ),
      ]),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: MarkdownBody(data: item['body']),
      ),
    ]);
  }

  Widget _buildItemItem({
    String actor,
    IconData iconData = Octicons.octoface,
    int iconColor = 0xff959da5,
    TextSpan textSpan,
    item,
  }) {
    return Row(
      children: <Widget>[
        Icon(iconData, color: Color(iconColor), size: 16),
        Padding(padding: EdgeInsets.only(left: 4)),
        Expanded(
          child: RichText(
            text: TextSpan(style: TextStyle(color: Colors.black), children: [
              createUserSpan(actor),
              textSpan,
              // TextSpan(text: ' ' + TimeAgo.formatFromString(item['createdAt']))
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, item) {
    switch (item['__typename']) {
      case 'IssueComment':
        return _buildComment(context, item);
      case 'ReviewRequestedEvent':
        return _buildItemItem(
          iconData: Octicons.eye,
          actor: payload['author']['login'],
          textSpan: TextSpan(children: [
            TextSpan(text: ' requested a review from '),
            createUserSpan(item['requestedReviewer']['login']),
          ]),
          item: item,
        );
      case 'PullRequestReview':
        return _buildItemItem(
          actor: item['author']['login'],
          iconColor: 0xff28a745,
          iconData: Octicons.check,
          textSpan: _buildReviewText(context, item),
          item: item,
        );
      case 'LabeledEvent':
        return _buildItemItem(
          actor: item['actor']['login'],
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added the '),
            TextSpan(text: item['label']['name']),
            TextSpan(text: 'label'),
          ]),
          item: item,
        );
      case 'ReferencedEvent':
        return _buildItemItem(
          actor: item['actor']['login'],
          iconData: Octicons.bookmark,
          textSpan: TextSpan(children: [
            TextSpan(text: ' referenced this pull request from commit '),
            TextSpan(text: item['commit']['oid'].substring(0, 8)),
          ]),
          item: item,
        );
      case 'MergedEvent':
        return _buildItemItem(
          actor: item['actor']['login'],
          iconData: Octicons.git_merge,
          iconColor: 0xff6f42c1,
          textSpan: TextSpan(children: [
            TextSpan(text: ' merged commit '),
            TextSpan(text: item['commit']['oid'].substring(0, 8)),
            TextSpan(text: ' into '),
            TextSpan(text: item['mergeRefName']),
          ]),
          item: item,
        );
      case 'HeadRefDeletedEvent':
        return _buildItemItem(
          actor: item['actor']['login'],
          iconData: Octicons.git_branch,
          textSpan: TextSpan(children: [
            TextSpan(text: ' deleted the '),
            TextSpan(text: item['headRefName']),
            TextSpan(text: ' branch'),
          ]),
          item: item,
        );
      case 'Commit':
        return _buildItemItem(
          actor: item['author']['user']['login'],
          iconData: Octicons.git_commit,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added commit '),
            TextSpan(text: item['oid'].substring(0, 8))
          ]),
          item: item,
        );
      default:
        return Text('no data', style: TextStyle(color: Colors.redAccent));
    }
  }

  Widget _buildBody(BuildContext context) {
    if (payload == null) {
      return CupertinoActivityIndicator();
    }

    List items = payload['timeline']['nodes'];

    return Column(children: <Widget>[
      Container(
        // padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildBadge(),
              ],
            ),
            Text(payload['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 2,
                )),
            _buildComment(context, payload),
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: comments.length,
            //   itemBuilder: _buildCommentItem,
            // ),
            Column(
              children: items.map((item) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color:
                                  CupertinoColors.extraLightBackgroundGray))),
                  child: _buildItem(context, item),
                );
              }).toList(),
            ),
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_fullName + ' #' + widget.id.toString()),
        trailing: Icon(Icons.more_vert, size: 24),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 48,
                child: CupertinoSegmentedControl(
                  groupValue: active,
                  onValueChanged: (value) async {
                    switch (value) {
                      case 1:
                        launch(
                            'https://github.com/$_fullName/pull/${widget.id}/commits');
                        break;
                      case 2:
                        launch(
                            'https://github.com/$_fullName/pull/${widget.id}/files');
                        break;
                    }
                    setState(() {});
                  },
                  children: {
                    0: Text('Conversation'),
                    1: Text('Commits'),
                    2: Text('Changes')
                  },
                ),
              ),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }
}
