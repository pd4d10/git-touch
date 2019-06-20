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
import '../screens/user.dart';
import '../screens/organization.dart';
import '../widgets/action.dart';
import '../utils/utils.dart';

class RepoScreen extends StatefulWidget {
  final String owner;
  final String name;

  RepoScreen(this.owner, this.name);

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  String get owner => widget.owner;
  String get name => widget.name;

  Future queryRepo(BuildContext context) async {
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    id
    owner {
      __typename
      login
      url
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

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: Text(widget.owner + '/' + widget.name),
      trailingBuilder: (data) {
        var payload = data[0];

        return ActionButton(title: 'Repository Actions', actions: [
          MyAction(
            text: '@$owner',
            onPress: () {
              WidgetBuilder builder;

              switch (payload['owner']['__typename']) {
                case 'Organization':
                  // builder = (_) => OrganizationScreen(owner);
                  // break;

                  // Seems organization permission is a little complicated
                  // So we just launch browser currently
                  launch(payload['owner']['url']);
                  return;
                case 'User':
                  builder = (_) => UserScreen(owner);
                  break;
              }

              SettingsProvider.of(context)
                  .pushRoute(context: context, builder: builder);
            },
          ),
          MyAction(
            text: payload['viewerHasStarred'] ? 'Unstar' : 'Star',
            onPress: () async {
              if (payload['viewerHasStarred']) {
                await SettingsProvider.of(context)
                    .deleteWithCredentials('/user/starred/$owner/$name');
                payload['viewerHasStarred'] = false;
              } else {
                SettingsProvider.of(context)
                    .putWithCredentials('/user/starred/$owner/$name');
                payload['viewerHasStarred'] = true;
              }
            },
          ),
          // TODO: watch
          MyAction(
            text: 'Share',
            onPress: () {
              Share.share(payload['url']);
            },
          ),
          MyAction(
            text: 'Open in Browser',
            onPress: () {
              launch(payload['url']);
            },
          ),
        ]);
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
            RepoItem(payload, isLink: false),
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
