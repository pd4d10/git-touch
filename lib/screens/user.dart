import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:primer/primer.dart';
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

  TableViewItem _buildTableViewItem({
    String placeholder,
    IconData iconData,
    String text,
    Function onTap,
  }) {
    var leftWidget = Icon(iconData, size: 20, color: PrimerColors.blue500);
    var usePlaceholder = text == null || text.isEmpty;
    var itemText = usePlaceholder
        ? Text(placeholder,
            style: TextStyle(color: PrimerColors.gray300, fontSize: 16))
        : Text(text,
            style: TextStyle(color: PrimerColors.gray900, fontSize: 16));

    return TableViewItem(
      leftWidget: leftWidget,
      text: itemText,
      rightWidget: Icon(CupertinoIcons.right_chevron,
          size: 18, color: PrimerColors.gray300),
      onTap: onTap,
    );
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Avatar(url: payload['avatarUrl'], size: 30),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text(
                            payload['name'] ?? widget.login,
                            style: TextStyle(
                                color: PrimerColors.blue500, fontSize: 16),
                          ),
                          Text(
                            '(${widget.login})',
                            style: TextStyle(
                                color: PrimerColors.gray500, fontSize: 16),
                          ),
                        ]),
                        SizedBox(height: 4),
                        Text(
                          payload['bio'] == null ||
                                  (payload['bio'] as String).isEmpty
                              ? 'No bio'
                              : payload['bio'],
                          style: TextStyle(
                              color: PrimerColors.gray500, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            BorderView(),
            Row(children: <Widget>[
              EntryItem(
                count: payload['repositories']['totalCount'],
                text: 'Repositories',
                screenBuilder: (context) => ReposScreen(login: widget.login),
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
                screenBuilder: (context) => UsersScreen(login: widget.login),
              ),
              EntryItem(
                count: payload['following']['totalCount'],
                text: 'Following',
                screenBuilder: (context) =>
                    UsersScreen(login: widget.login, following: true),
              ),
            ]),
            BorderView(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SvgPicture.string(contributions),
              ),
            ),
            BorderView(height: 10),
            TableView(items: [
              _buildTableViewItem(
                iconData: Octicons.organization,
                placeholder: 'Company',
                text: payload['company'],
              ),
              _buildTableViewItem(
                iconData: Octicons.location,
                placeholder: 'Location',
                text: payload['location'],
              ),
              _buildTableViewItem(
                iconData: Octicons.mail,
                placeholder: 'Email',
                text: payload['email'],
                onTap: (payload['email'] as String).isEmpty
                    ? null
                    : () {
                        launch('mailto:' + payload['email']);
                      },
              ),
              _buildTableViewItem(
                iconData: Octicons.link,
                placeholder: 'Website',
                text: payload['websiteUrl'],
                onTap: payload['websiteUrl'] == null
                    ? null
                    : () {
                        var url = payload['websiteUrl'] as String;
                        if (!url.startsWith('http')) {
                          url = 'http://$url';
                        }
                        launch(url);
                      },
              ),
            ]),
            // _buildRepos(payload),
          ],
        );
      },
    );
  }
}
