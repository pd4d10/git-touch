import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../widgets/refresh_scaffold.dart';
import '../utils/utils.dart';
import '../widgets/repo_item.dart';
import '../widgets/entry_item.dart';
import '../screens/issues.dart';
import '../screens/pull_requests.dart';

Future fetchReadme(String owner, String name) async {
  var data = await getWithCredentials('/repos/$owner/$name/readme');
  var bits = base64.decode(data['content'].replaceAll('\n', ''));
  var str = utf8.decode(bits);
  return str;
}

Future queryRepo(String owner, String name) async {
  var data = await query('''
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

class RepoScreen extends StatefulWidget {
  final String owner;
  final String name;

  RepoScreen(this.owner, this.name);

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  Map<String, dynamic> payload;
  String readme;
  bool loading;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    setState(() {
      loading = true;
    });
    List items = await Future.wait([
      queryRepo(widget.owner, widget.name),
      fetchReadme(widget.owner, widget.name),
    ]);
    setState(() {
      loading = false;
      payload = items[0];
      readme = items[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      loading: loading,
      title: Text(widget.owner + '/' + widget.name),
      onRefresh: _refresh,
      bodyBuilder: () {
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
                    route: CupertinoPageRoute(
                      builder: (context) => IssuesScreen(),
                    ),
                  ),
                  EntryItem(
                    count: payload['pullRequests']['totalCount'],
                    text: 'Pull Requests',
                    route: CupertinoPageRoute(
                      builder: (context) => PullRequestsScreen(),
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
