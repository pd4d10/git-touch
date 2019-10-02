import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/screens/repositories.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/action_button.dart';
import '../utils/utils.dart';

class OrganizationScreen extends StatelessWidget {
  final String login;

  OrganizationScreen(this.login);

  Iterable<Widget> _buildRepos(payload) {
    String title;
    List items = [];

    var pinnedItems = payload['pinnedItems']['nodes'] as List;
    var repositories = payload['pinnableItems']['nodes'] as List;

    if (pinnedItems.isNotEmpty) {
      title = 'pinned repositories';
      items = pinnedItems;
    } else if (repositories.isNotEmpty) {
      title = 'popular repositories';
      items = repositories;
    }

    items = items
        .where((x) => x != null)
        .toList(); // TODO: Pinned items may include somethings other than repo
    if (items.isEmpty) return [];

    return [
      CommonStyle.verticalGap,
      if (title != null) TableViewHeader(title),
      ...join(
        CommonStyle.border,
        items.map((item) {
          return RepositoryItem(item);
        }).toList(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      fetchData: () async {
        // Use pinnableItems instead of organization here due to token permission
        var data = await Provider.of<AuthModel>(context).query('''
{
  organization(login: "$login") {
    name
    avatarUrl
    description
    location
    email
    websiteUrl
    url
    pinnedItems(first: 6) {
      nodes {
        ... on Repository {
          $repoChunk
        }
      }
    }
    pinnableItems(first: 6, types: [REPOSITORY]) {
      totalCount
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
      actionBuilder: (payload) {
        return ActionButton(
          title: 'Organization Actions',
          items: [
            if (payload.data != null) ...[
              ActionItem.share(payload.data['url']),
              ActionItem.launch(payload.data['url']),
            ],
          ],
        );
      },
      bodyBuilder: (payload) {
        var data = payload.data;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserItem(
              login: login,
              name: data['name'],
              avatarUrl: data['avatarUrl'],
              bio: data['description'],
            ),
            CommonStyle.border,
            Row(children: <Widget>[
              EntryItem(
                count: data['pinnableItems']['totalCount'],
                text: 'Repositories',
                screenBuilder: (context) =>
                    RepositoriesScreen.ofOrganization(login),
              ),
              EntryItem(
                count: data['membersWithRole']['totalCount'],
                text: 'Members',
                screenBuilder: (context) => UsersScreen.members(login),
              ),
            ]),
            CommonStyle.verticalGap,
            TableView(
              hasIcon: true,
              items: [
                if (isNotNullOrEmpty(data['location']))
                  TableViewItem(
                    leftIconData: Octicons.location,
                    text: Text(data['location']),
                    onTap: () {
                      launchUrl('https://www.google.com/maps/place/' +
                          (data['location'] as String)
                              .replaceAll(RegExp(r'\s+'), ''));
                    },
                  ),
                if (isNotNullOrEmpty(data['email']))
                  TableViewItem(
                    leftIconData: Octicons.mail,
                    text: Text(data['email']),
                    onTap: () {
                      launchUrl('mailto:' + data['email']);
                    },
                  ),
                if (isNotNullOrEmpty(data['websiteUrl']))
                  TableViewItem(
                    leftIconData: Octicons.link,
                    text: Text(data['websiteUrl']),
                    onTap: () {
                      var url = data['websiteUrl'] as String;
                      if (!url.startsWith('http')) {
                        url = 'http://$url';
                      }
                      launchUrl(url);
                    },
                  ),
              ],
            ),
            ..._buildRepos(data),
          ],
        );
      },
    );
  }
}
