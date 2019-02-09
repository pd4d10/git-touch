import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/settings.dart';
import '../scaffolds/refresh.dart';
import '../widgets/avatar.dart';
import '../widgets/entry_item.dart';
import '../widgets/list_group.dart';
import '../widgets/repo_item.dart';
import '../widgets/link.dart';
import '../screens/repos.dart';
import '../screens/users.dart';
import '../screens/settings.dart';
import '../utils/utils.dart';

class UserScreen extends StatefulWidget {
  final String login;
  final bool showSettings;

  UserScreen(this.login, {this.showSettings = false});

  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Future queryUser(BuildContext context) async {
    var login = widget.login;
    var data = await SettingsProvider.of(context).query('''
{
  user(login: "$login") {
    name
    avatarUrl
    bio
    email
    company
    location
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

  Widget _buildRepos(payload) {
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
      itemBuilder: (item, _) => RepoItem(item),
    );
  }

  Widget _buildEmail(payload) {
    // TODO: redesign the UI to show all information
    String email = payload['email'] ?? '';
    if (email.isNotEmpty) {
      return Link(
        child: Row(children: <Widget>[
          Icon(
            Octicons.mail,
            color: Colors.black54,
            size: 16,
          ),
          Padding(padding: EdgeInsets.only(left: 4)),
          Text(email, style: TextStyle(color: Colors.black54, fontSize: 16))
        ]),
        beforeRedirect: () {
          launch('mailto:' + email);
        },
      );
    }

    String company = payload['company'] ?? '';
    if (company.isNotEmpty) {
      return Row(children: <Widget>[
        Icon(
          Octicons.organization,
          color: Colors.black54,
          size: 16,
        ),
        Padding(padding: EdgeInsets.only(left: 4)),
        Text(company, style: TextStyle(color: Colors.black54, fontSize: 16))
      ]);
    }

    String location = payload['location'] ?? '';
    if (location.isNotEmpty) {
      return Row(children: <Widget>[
        Icon(
          Octicons.location,
          color: Colors.black54,
          size: 16,
        ),
        Padding(padding: EdgeInsets.only(left: 4)),
        Text(location, style: TextStyle(color: Colors.black54, fontSize: 16))
      ]);
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      onRefresh: () => queryUser(context),
      title: Text(widget.login),
      trailing: Link(
        child: Icon(Icons.settings, size: 24),
        screenBuilder: (_) => SettingsScreen(),
        material: false,
        fullscreenDialog: true,
      ),
      actions: <Widget>[
        Link(
          iconButton: Icon(Icons.settings),
          screenBuilder: (_) => SettingsScreen(),
          fullscreenDialog: true,
        ),
      ],
      bodyBuilder: (payload) {
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
                        _buildEmail(payload),
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
                    screenBuilder: (context) =>
                        ReposScreen(login: widget.login),
                  ),
                  EntryItem(
                    count: payload['starredRepositories']['totalCount'],
                    text: 'Stars',
                    screenBuilder: (context) =>
                        ReposScreen(login: widget.login, star: true),
                  ),
                  EntryItem(
                    count: payload['followers']['totalCount'],
                    text: 'Followers',
                    screenBuilder: (context) => UsersScreen(),
                  ),
                  EntryItem(
                    count: payload['following']['totalCount'],
                    text: 'Following',
                    screenBuilder: (context) => UsersScreen(),
                  ),
                ],
              ),
            ),
            _buildRepos(payload),
          ],
        );
      },
    );
  }
}
