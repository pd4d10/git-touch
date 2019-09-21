import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../scaffolds/refresh.dart';
import '../widgets/repo_item.dart';
import '../widgets/action.dart';
import '../utils/utils.dart';

class OrganizationScreen extends StatelessWidget {
  final String login;

  OrganizationScreen(this.login);

  Iterable<Widget> _buildRepos(payload) {
    String title;
    List items;

    if ((payload['pinnedItems']['nodes'] as List).isNotEmpty) {
      title = 'pinned repositories';
      items = payload['pinnedItems']['nodes'] as List;
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

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      onRefresh: () async {
        var data = await Provider.of<SettingsModel>(context).query('''
{
  organization(login: "$login") {
    name
    avatarUrl
    description
    location
    email
    websiteUrl
    url
    pinnedItems(first: $pageSize) {
      nodes {
        ... on Repository {
          $repoChunk
        }
      }
    }
    membersWithRole {
      totalCount
    }
  }
}
''');
        return data['organization'];
      },
      title: AppBarTitle('Organization'),
      trailingBuilder: (payload) {
        return ActionButton(title: 'Organization Actions', actions: [
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserItem(
              login,
              name: payload['name'],
              avatarUrl: payload['avatarUrl'],
              bio: payload['description'],
            ),
            borderView,
            Row(children: <Widget>[
              EntryItem(
                count: payload['membersWithRole']['totalCount'],
                text: 'Members',
                screenBuilder: (context) =>
                    UsersScreen(type: UsersScreenType.orgs, login: login),
              ),
            ]),
            borderView1,
            TableView(
              hasIcon: true,
              items: [
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
