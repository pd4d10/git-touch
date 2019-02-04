import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/refresh_scaffold.dart';
import '../widgets/avatar.dart';
import '../widgets/link.dart';
import '../widgets/list_group.dart';
import '../widgets/repo_item.dart';
import '../screens/repos.dart';
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
  Map<String, dynamic> payload = {};

  Widget _buildEntry(int count, String text) {
    return Expanded(
      flex: 1,
      child: Link(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              Text(count.toString()),
              Text(text, style: TextStyle(fontSize: 13))
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }

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
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
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
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildEntry(
                      payload['repositories']['totalCount'], 'Repositories'),
                  _buildEntry(
                      payload['starredRepositories']['totalCount'], 'Stars'),
                  _buildEntry(payload['followers']['totalCount'], 'Followers'),
                  _buildEntry(payload['following']['totalCount'], 'Following'),
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
