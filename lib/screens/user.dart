import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
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
    repositories(first: $pageSize, ownerAffiliations: OWNER, orderBy: {field: STARGAZERS, direction: DESC}) {
      totalCount
      nodes {
        $repoChunk
      }
    }
    pinnedRepositories(first: $pageSize) {
      nodes {
        $repoChunk
      }
    }
    viewerCanFollow
    viewerIsFollowing
    url
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
        material: false,
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

  Future<void> _openActions(payload) async {
    if (payload == null) return;

    var _actionMap = {};
    if (payload['viewerCanFollow']) {
      _actionMap[0] = payload['viewerIsFollowing'] ? 'Unfollow' : 'Follow';
    }
    _actionMap[2] = 'Share';
    _actionMap[3] = 'Open in Browser';

    var value = await showCupertinoModalPopup<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('User Actions'),
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
        if (payload['viewerIsFollowing']) {
          await SettingsProvider.of(context)
              .deleteWithCredentials('/user/following/${widget.login}');
          payload['viewerIsFollowing'] = false;
        } else {
          SettingsProvider.of(context)
              .putWithCredentials('/user/following/${widget.login}');
          payload['viewerIsFollowing'] = true;
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
      onRefresh: () => queryUser(context),
      title: Text(widget.login),
      trailingBuilder: (payload) {
        if (widget.showSettings) {
          return Link(
            child: Icon(Icons.settings, size: 24),
            screenBuilder: (_) => SettingsScreen(),
            material: false,
            fullscreenDialog: true,
          );
        } else {
          return Link(
            child: Icon(Icons.more_vert, size: 24),
            material: false,
            beforeRedirect: () => _openActions(payload),
          );
        }
      },
      actionsBuilder: (payload) {
        if (widget.showSettings) {
          return [
            Link(
              iconButton: Icon(Icons.settings),
              screenBuilder: (_) => SettingsScreen(),
              fullscreenDialog: true,
            )
          ];
        } else {
          return [
            Link(
              iconButton: Icon(Icons.more_vert),
              material: false,
              beforeRedirect: () => _openActions(payload),
            )
          ];
        }
      },
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
                    screenBuilder: (context) =>
                        UsersScreen(login: widget.login),
                  ),
                  EntryItem(
                    count: payload['following']['totalCount'],
                    text: 'Following',
                    screenBuilder: (context) =>
                        UsersScreen(login: widget.login, following: true),
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
