import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:primer/primer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:github_contributions/github_contributions.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../scaffolds/refresh.dart';
import '../widgets/entry_item.dart';
import '../widgets/list_group.dart';
import '../widgets/repo_item.dart';
import '../widgets/link.dart';
import '../widgets/action.dart';
import '../screens/repos.dart';
import '../screens/users.dart';
import '../screens/settings.dart';
import '../utils/utils.dart';

class UserScreen extends StatelessWidget {
  final String login;
  final bool isMe;

  UserScreen(this.login, {this.isMe = false});

  Future query(BuildContext context) async {
    var data = await Provider.of<SettingsModel>(context).query('''
{
  user(login: "$login") {
    name
    avatarUrl
    bio
    company
    location
    email
    websiteUrl
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
    pinnedItems(first: 6) {
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

  Iterable<Widget> _buildRepos(payload) {
    String title;
    List items;

    if ((payload['pinnedItems']['nodes'] as List).isNotEmpty) {
      title = 'pinned repositories';
      items = payload['pinnedItems']['nodes'] as List;
    } else if ((payload['repositories']['nodes'] as List).isNotEmpty) {
      title = 'popular repositories';
      items = payload['repositories']['nodes'] as List;
    } else {
      items = [];
    }

    items = items
        .where((x) => x != null)
        .toList(); // TODO: Pinned items may include somethings other than repo
    if (items.isEmpty) return [];

    return [
      borderView1,
      if (title != null) TableViewHeader(title),
      ...join(
        borderView,
        items.map((item) {
          return RepoItem(item);
        }).toList(),
      )
    ];
  }

  Widget _buildContributions(List<ContributionsInfo> contributions) {
    final row = Row(
      children: <Widget>[],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
    Column column;

    contributions.asMap().forEach((i, v) {
      var rect = SizedBox(
        width: 10,
        height: 10,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: convertColor(v.color),
          ),
        ),
      );

      if (i % 7 == 0) {
        column = Column(children: <Widget>[rect]);
        row.children.add(column);
        row.children.add(SizedBox(width: 3));
      } else {
        column.children.add(SizedBox(height: 3));
        column.children.add(rect);
      }
    });

    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: row,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      onRefresh: () {
        return Future.wait(
          [query(context), getContributions(login)],
        );
      },
      title: AppBarTitle('User'),
      trailingBuilder: (data) {
        var payload = data[0];
        if (isMe) {
          return Link(
            child: Icon(Icons.settings, size: 20),
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
                  await Provider.of<SettingsModel>(context)
                      .deleteWithCredentials('/user/following/$login');
                  payload['viewerIsFollowing'] = false;
                } else {
                  Provider.of<SettingsModel>(context)
                      .putWithCredentials('/user/following/$login');
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
        var contributions = data[1] as List<ContributionsInfo>;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserItem(
              login,
              name: payload['name'],
              avatarUrl: payload['avatarUrl'],
              bio: payload['bio'],
            ),
            borderView,
            Row(children: <Widget>[
              EntryItem(
                count: payload['repositories']['totalCount'],
                text: 'Repositories',
                screenBuilder: (context) => ReposScreen(login: login),
              ),
              EntryItem(
                count: payload['starredRepositories']['totalCount'],
                text: 'Stars',
                screenBuilder: (context) =>
                    ReposScreen(login: login, star: true),
              ),
              EntryItem(
                count: payload['followers']['totalCount'],
                text: 'Followers',
                screenBuilder: (context) => UsersScreen(
                    login: login, type: UsersScreenType.userFollowers),
              ),
              EntryItem(
                count: payload['following']['totalCount'],
                text: 'Following',
                screenBuilder: (context) => UsersScreen(
                    login: login, type: UsersScreenType.userFollowing),
              ),
            ]),
            borderView1,
            _buildContributions(contributions),
            borderView1,
            TableView(
              hasIcon: true,
              items: [
                if (isNotNullOrEmpty(payload['company']))
                  TableViewItem(
                    leftIconData: Octicons.organization,
                    text: Text(payload['company']),
                  ),
                if (isNotNullOrEmpty(payload['location']))
                  TableViewItem(
                    leftIconData: Octicons.location,
                    text: Text(payload['location']),
                    onTap: () {
                      launch('https://www.google.com/maps/place/' +
                          (payload['location'] as String)
                              .replaceAll(RegExp(r'\s+'), ''));
                    },
                  ),
                if (isNotNullOrEmpty(payload['email']))
                  TableViewItem(
                    leftIconData: Octicons.mail,
                    text: Text(payload['email']),
                    onTap: () {
                      launch('mailto:' + payload['email']);
                    },
                  ),
                if (isNotNullOrEmpty(payload['websiteUrl']))
                  TableViewItem(
                    leftIconData: Octicons.link,
                    text: Text(payload['websiteUrl']),
                    onTap: () {
                      var url = payload['websiteUrl'] as String;
                      if (!url.startsWith('http')) {
                        url = 'http://$url';
                      }
                      launch(url);
                    },
                  ),
              ],
            ),
            ..._buildRepos(payload),
          ],
        );
      },
    );
  }
}
