import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/settings.dart';
import '../scaffolds/refresh.dart';
import '../widgets/repo_item.dart';
import '../widgets/entry_item.dart';
import '../screens/issues.dart';
import '../widgets/link.dart';

class RepoScreen extends StatefulWidget {
  final String owner;
  final String name;

  RepoScreen(this.owner, this.name);

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  get owner => widget.owner;
  get name => widget.name;

  Future queryRepo(BuildContext context) async {
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    id
    owner {
      login
    }
    name
    isPrivate
    isFork
    description
    stargazers {
      totalCount
    }
    forks {
      totalCount
    }
    primaryLanguage {
      color
      name
    }    
    issues(states: OPEN) {
      totalCount
    }
    pullRequests(states: OPEN) {
      totalCount
    }
    url
    defaultBranchRef {
      name
    }
    viewerHasStarred
    viewerSubscription
  }
}

''');
    return data['repository'];
  }

  Future fetchReadme(BuildContext context) async {
    var owner = widget.owner;
    var name = widget.name;
    var data = await SettingsProvider.of(context)
        .getWithCredentials('/repos/$owner/$name/readme');

    if (data['content'] == null) {
      return '';
    }

    var bits = base64.decode(data['content'].replaceAll('\n', ''));
    var str = utf8.decode(bits);
    return str;
  }

  Future<void> _openActions(data) async {
    if (data == null) return;
    var payload = data[0];

    var _actionMap = {
      0: payload['viewerHasStarred'] ? 'Unstar' : 'Star',
      // 1: 'Watch', TODO:
      2: 'Share',
      3: 'Open in Browser',
    };

    var value = await showCupertinoModalPopup<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Repository Actions'),
          actions: _actionMap.entries.map((entry) {
            return CupertinoActionSheetAction(
              child: Text(entry.value),
              onPressed: () {
                Navigator.pop(context, entry.key);
              },
            );
          }).toList(),
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );

    switch (value) {
      case 0:
        if (payload['viewerHasStarred']) {
          await SettingsProvider.of(context)
              .deleteWithCredentials('/user/starred/$owner/$name');
          payload['viewerHasStarred'] = false;
        } else {
          SettingsProvider.of(context)
              .putWithCredentials('/user/starred/$owner/$name');
          payload['viewerHasStarred'] = true;
        }
        break;
      // case 1:
      //   break;
      case 2:
        Share.share(payload['url']);
        break;
      case 3:
        launch(payload['url']);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: Text(widget.owner + '/' + widget.name),
      trailingBuilder: (payload) {
        return Link(
          child: Icon(Icons.more_vert, size: 24),
          material: false,
          beforeRedirect: () => _openActions(payload),
        );
      },
      actionsBuilder: (payload) {
        return [
          Link(
            iconButton: Icon(Icons.more_vert),
            beforeRedirect: () => _openActions(payload),
          ),
        ];
      },
      onRefresh: () => Future.wait([
            queryRepo(context),
            fetchReadme(context),
          ]),
      bodyBuilder: (data) {
        var payload = data[0];
        var readme = data[1];

        return Column(
          children: <Widget>[
            RepoItem(payload),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12),
                  top: BorderSide(color: Colors.black12),
                ),
              ),
              child: Row(
                children: <Widget>[
                  EntryItem(
                    count: payload['issues']['totalCount'],
                    text: 'Issues',
                    screenBuilder: (context) => IssuesScreen(
                          owner: widget.owner,
                          name: widget.name,
                        ),
                  ),
                  EntryItem(
                    count: payload['pullRequests']['totalCount'],
                    text: 'Pull Requests',
                    screenBuilder: (context) => IssuesScreen(
                          owner: widget.owner,
                          name: widget.name,
                          isPullRequest: true,
                        ),
                  ),
                  EntryItem(
                    text: 'Files',
                    url: payload['url'] + '?files=1',
                  ),
                  EntryItem(
                    text: 'Commits',
                    url: payload['url'] +
                        '/commits/' +
                        payload['defaultBranchRef']['name'],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: MarkdownBody(data: readme),
            ),
          ],
        );
      },
    );
  }
}
