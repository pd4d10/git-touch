import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../providers/settings.dart';
import '../scaffolds/refresh.dart';
import '../widgets/repo_item.dart';
import '../widgets/entry_item.dart';
import '../screens/issues.dart';

class RepoScreen extends StatefulWidget {
  final String owner;
  final String name;

  RepoScreen(this.owner, this.name);

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  Future queryRepo(BuildContext context) async {
    var owner = widget.owner;
    var name = widget.name;
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
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
    var bits = base64.decode(data['content'].replaceAll('\n', ''));
    var str = utf8.decode(bits);
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: Text(widget.owner + '/' + widget.name),
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
