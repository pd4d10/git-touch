import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../scaffolds/refresh.dart';
import '../widgets/avatar.dart';
import '../widgets/entry_item.dart';
import '../widgets/list_group.dart';
import '../widgets/repo_item.dart';
import '../widgets/link.dart';
import '../widgets/action.dart';
import '../screens/repos.dart';
import '../screens/users.dart';
import '../utils/utils.dart';

class OrganizationScreen extends StatefulWidget {
  final String login;
  OrganizationScreen(this.login);
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  Future query() async {
    var login = widget.login;
    var data = await Provider.of<SettingsModel>(context).query('''
{
  organization(login: "$login") {
    name
    avatarUrl
    websiteUrl
    email
    location
    repositories(first: $pageSize, orderBy: {field: PUSHED_AT, direction: DESC}) {
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
    url
    membersWithRole {
      totalCount
    }
  }
}
''');
    return data['organization'];
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

    String website = payload['websiteUrl'] ?? '';
    if (website.isNotEmpty) {
      return Row(children: <Widget>[
        Icon(
          Octicons.link,
          color: Colors.black54,
          size: 16,
        ),
        Padding(padding: EdgeInsets.only(left: 4)),
        Text(website, style: TextStyle(color: Colors.black54, fontSize: 16))
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
      onRefresh: query,
      title: Text(widget.login),
      trailingBuilder: (payload) {
        return ActionButton(title: 'User Actions', actions: [
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
      },
      bodyBuilder: (payload) {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Avatar(url: payload['avatarUrl'], size: 28),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          payload['name'] ?? widget.login,
                          style: TextStyle(height: 1.2, fontSize: 16),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
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
                    screenBuilder: (_) =>
                        ReposScreen(login: widget.login, org: true),
                  ),
                  EntryItem(
                    count: payload['membersWithRole']['totalCount'],
                    text: 'Members',
                    screenBuilder: (_) =>
                        UsersScreen(login: widget.login, org: true),
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
