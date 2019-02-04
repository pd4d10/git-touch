import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/refresh_scaffold.dart';
import '../widgets/avatar.dart';
import '../widgets/entry_item.dart';
import '../widgets/list_group.dart';
import '../widgets/repo_item.dart';
import '../screens/repos.dart';
import '../screens/users.dart';
import '../utils/utils.dart';

var repoChunk = '''
owner {
  login
}
name
description
isPrivate
isFork
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
''';

Future queryUser(String login) async {
  var data = await query('''
{
  user(login: "$login") {
    name
    avatarUrl
    bio
    email
    starredRepositories {
      totalCount
    }
    followers {
      totalCount
    }
    following {
      totalCount
    }
    repositories(first: 6, ownerAffiliations: OWNER, orderBy: {field: STARGAZERS, direction: DESC}) {
      totalCount
      nodes {
        $repoChunk
      }
    }
    pinnedRepositories(first: 6) {
      nodes {
        $repoChunk
      }
    }
  }
}
''');
  return data['user'];
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class UserScreen extends StatefulWidget {
  final String login;

  UserScreen(this.login);

  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Map<String, dynamic> payload;

  Widget _buildRepos() {
    String title;
    List items;
    if (payload['pinnedRepositories']['nodes'].length == 0) {
      title = 'Popular repositories';
      items = payload['repositories']['nodes'];
    } else {
      title = 'Pinned repositories';
      items = payload['pinnedRepositories']['nodes'];
    }

    return ListGroup(
      title: Text(title),
      items: items,
      itemBuilder: (item) => RepoItem(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      onRefresh: () async {
        var _payload = await queryUser(widget.login);
        setState(() {
          payload = _payload;
        });
      },
      title: Text(widget.login),
      bodyBuilder: () {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Avatar(
                    login: widget.login,
                    url: payload['avatarUrl'],
                    size: 28,
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(payload['name'] ?? widget.login,
                            style: TextStyle(height: 1.2)),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Row(children: <Widget>[
                          Icon(
                            Octicons.mail,
                            color: Colors.black54,
                            size: 16,
                          ),
                          Padding(padding: EdgeInsets.only(left: 4)),
                          Text(
                            payload['email'],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          )
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ),
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
                    count: payload['repositories']['totalCount'],
                    text: 'Repositories',
                    route:
                        CupertinoPageRoute(builder: (context) => ReposScreen()),
                  ),
                  EntryItem(
                    count: payload['starredRepositories']['totalCount'],
                    text: 'Stars',
                    route:
                        CupertinoPageRoute(builder: (context) => ReposScreen()),
                  ),
                  EntryItem(
                    count: payload['followers']['totalCount'],
                    text: 'Followers',
                    route:
                        CupertinoPageRoute(builder: (context) => UsersScreen()),
                  ),
                  EntryItem(
                    count: payload['following']['totalCount'],
                    text: 'Following',
                    route:
                        CupertinoPageRoute(builder: (context) => UsersScreen()),
                  ),
                ],
              ),
            ),
            _buildRepos(),
          ],
        );
      },
    );
  }
}
