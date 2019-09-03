import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_contributions/github_contributions.dart';
import '../providers/settings.dart';
import '../scaffolds/refresh.dart';
import '../widgets/avatar.dart';
import '../widgets/entry_item.dart';
import '../widgets/list_group.dart';
import '../widgets/repo_item.dart';
import '../widgets/link.dart';
import '../widgets/action.dart';
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
  Future query() async {
    var login = widget.login;
    var data = await SettingsProvider.of(context).query('''
{
  user(login: "$login") {
    name
    avatarUrl
    bio
    websiteUrl
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
    pinnedItems(first: $pageSize) {
      nodes {
        ... on Repository {
          $repoChunk
        }
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
    if (payload['pinnedItems']['nodes'].length == 0) {
      title = 'Popular repositories';
      items = payload['repositories']['nodes'];
    } else {
      title = 'Pinned repositories';
      items = payload['pinnedItems']['nodes'];
    }

    return ListGroup(
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      items: items,
      itemBuilder: (item, _) {
        return RepoItem(
          item,
          showOwner: item['owner']['login'] != widget.login,
        );
      },
    );
  }

  Widget _buildInfo(payload) {
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
          Text(email, style: TextStyle(color: Colors.black54, fontSize: 15))
        ]),
        onTap: () {
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
      onRefresh: () {
        return Future.wait(
          [query(), getContributionsSvg(widget.login)],
        );
      },
      title: Text(widget.login),
      trailingBuilder: (data) {
        var payload = data[0];
        if (widget.showSettings) {
          return Link(
            child: Icon(Icons.settings, size: 24),
            screenBuilder: (_) => SettingsScreen(),
            material: false,
            fullscreenDialog: true,
          );
        } else {
          List<MyAction> actions = [];

          if (payload['viewerCanFollow']) {
            actions.add(MyAction(
              text: payload['viewerIsFollowing'] ? 'Unfollow' : 'Follow',
              onPress: () async {
                if (payload['viewerIsFollowing']) {
                  await SettingsProvider.of(context)
                      .deleteWithCredentials('/user/following/${widget.login}');
                  payload['viewerIsFollowing'] = false;
                } else {
                  SettingsProvider.of(context)
                      .putWithCredentials('/user/following/${widget.login}');
                  payload['viewerIsFollowing'] = true;
                }
              },
            ));
          }

          actions.addAll([
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

          return ActionButton(title: 'User Actions', actions: actions);
        }
      },
      bodyBuilder: (data) {
        var payload = data[0];
        var contributions = data[1];

        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Avatar(url: payload['avatarUrl'], size: 24),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          payload['name'] ?? widget.login,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        _buildInfo(payload),
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
            Container(
              child: SvgPicture.string(contributions),
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            _buildRepos(payload),
          ],
        );
      },
    );
  }
}
