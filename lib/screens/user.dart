import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/refresh_scaffold.dart';
import '../widgets/avatar.dart';
import '../widgets/link.dart';
import '../utils/utils.dart';

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
        owner {
          login
        }
        name
        stargazers {
          totalCount
        }
      }
    }
    pinnedRepositories(first: 6) {
      nodes {
        owner {
          login
        }
        name
      }
    }
  }
}
''');
  return data['user'];
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

class UserScreen extends StatefulWidget {
  final String login;

  UserScreen(this.login);

  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var payload;

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      onRefresh: () async {
        var _payload = await queryUser(widget.login);
        setState(() {
          payload = _payload;
        });
      },
      title: widget.login,
      body: Column(
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
                      Text(payload['name'], style: TextStyle(height: 1.2)),
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
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ])
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Link(
                  child: Column(
                    children: <Widget>[
                      Text(payload['repositories']['totalCount'].toString()),
                      Text('Repos')
                    ],
                  ),
                  onTap: () {},
                ),
                Link(
                  child: Column(
                    children: <Widget>[
                      Text(payload['starredRepositories']['totalCount']
                          .toString()),
                      Text('Stars')
                    ],
                  ),
                  onTap: () {},
                ),
                Link(
                  child: Column(
                    children: <Widget>[
                      Text(payload['followers']['totalCount'].toString()),
                      Text('Followers'),
                    ],
                  ),
                  onTap: () {
                    // print(1);
                  },
                ),
                Link(
                  child: Column(
                    children: <Widget>[
                      Text(payload['following']['totalCount'].toString()),
                      Text('Following')
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
