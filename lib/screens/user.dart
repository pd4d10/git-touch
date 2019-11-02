import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/screens/settings.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/screens/repositories.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:git_touch/widgets/text_contains_organization.dart';
import 'package:git_touch/widgets/user_contributions.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:github_contributions/github_contributions.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:primer/primer.dart';

class UserScreen extends StatelessWidget {
  final String login;

  UserScreen(this.login);

  Future _query(BuildContext context) async {
    var _login = login ?? Provider.of<AuthModel>(context).activeAccount.login;
    var data = await Provider.of<AuthModel>(context).query('''
{
  repositoryOwner(login: "$_login") {
    __typename
    ... on User {
      $userGqlChunk
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
    ... on Organization {
      login
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
}
'''); // Use pinnableItems instead of organization here due to token permission

    return data['repositoryOwner'];
  }

  Future<List<ContributionsInfo>> _fetchContributions(
      BuildContext context) async {
    var _login = login ?? Provider.of<AuthModel>(context).activeAccount.login;
    switch (Provider.of<AuthModel>(context).activeAccount.platform) {
      case PlatformType.gitlab:
        return [];
      default:
        try {
          return await getContributions(_login);
        } catch (err) {
          return [];
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      fetchData: () {
        return Future.wait([
          _query(context),
          _fetchContributions(context),
        ]);
      },
      title: AppBarTitle('User'), // TODO:
      actionBuilder: (data, _) {
        if (data == null)
          return ActionButton(
            title: "Actions",
            items: [],
          );

        switch (data[0]['__typename']) {
          case 'User':
            if (login == null) {
              return ActionEntry(
                iconData: Icons.settings,
                onTap: () {
                  Provider.of<ThemeModel>(context).pushRoute(
                      context, (_) => SettingsScreen(),
                      fullscreenDialog: true);
                },
              );
            } else {
              return ActionButton(
                title: 'User Actions',
                items: [
                  if (data != null && data[0]['viewerCanFollow'])
                    ActionItem(
                      text:
                          data[0]['viewerIsFollowing'] ? 'Unfollow' : 'Follow',
                      onPress: () async {
                        if (data[0]['viewerIsFollowing']) {
                          await Provider.of<AuthModel>(context)
                              .deleteWithCredentials('/user/following/$login');
                          data[0]['viewerIsFollowing'] = false;
                        } else {
                          Provider.of<AuthModel>(context)
                              .putWithCredentials('/user/following/$login');
                          data[0]['viewerIsFollowing'] = true;
                        }
                      },
                    ),
                  if (data != null) ...[
                    ActionItem.share(data[0]['url']),
                    ActionItem.launch(data[0]['url']),
                  ],
                ],
              );
            }
            break;
          case 'Organization':
            return ActionButton(
              title: 'Organization Actions',
              items: [
                if (data != null) ...[
                  ActionItem.share(data[0]['url']),
                  ActionItem.launch(data[0]['url']),
                ],
              ],
            );
          default:
            return null;
        }
      },
      bodyBuilder: (data, _) {
        var user = data[0];
        var contributions = data[1];
        final isOrganization = user['__typename'] == 'Organization';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserItem(
              login: user['login'],
              name: user['name'],
              avatarUrl: user['avatarUrl'],
              bio: isOrganization ? user['description'] : user['bio'],
              inUserScreen: true,
            ),
            CommonStyle.border,
            Row(children: [
              if (isOrganization) ...[
                EntryItem(
                  count: user['pinnableItems']['totalCount'],
                  text: 'Repositories',
                  screenBuilder: (context) =>
                      RepositoriesScreen.ofOrganization(user['login']),
                ),
                EntryItem(
                  count: user['membersWithRole']['totalCount'],
                  text: 'Members',
                  screenBuilder: (context) =>
                      UsersScreen.members(user['login']),
                ),
              ] else ...[
                EntryItem(
                  count: user['repositories']['totalCount'],
                  text: 'Repositories',
                  screenBuilder: (context) => RepositoriesScreen(user['login']),
                ),
                EntryItem(
                  count: user['starredRepositories']['totalCount'],
                  text: 'Stars',
                  screenBuilder: (context) =>
                      RepositoriesScreen.stars(user['login']),
                ),
                EntryItem(
                  count: user['followers']['totalCount'],
                  text: 'Followers',
                  screenBuilder: (context) =>
                      UsersScreen.followers(user['login']),
                ),
                EntryItem(
                  count: user['following']['totalCount'],
                  text: 'Following',
                  screenBuilder: (context) =>
                      UsersScreen.following(user['login']),
                ),
              ]
            ]),
            CommonStyle.verticalGap,
            if (contributions.isNotEmpty) ...[
              UserContributions(contributions),
              CommonStyle.verticalGap,
            ],
            TableView(
              hasIcon: true,
              items: [
                if (!isOrganization && isNotNullOrEmpty(user['company']))
                  TableViewItem(
                    leftIconData: Octicons.organization,
                    text: TextContainsOrganization(user['company'],
                        style: TextStyle(
                            fontSize: 16, color: PrimerColors.gray900),
                        overflow: TextOverflow.ellipsis),
                  ),
                if (isNotNullOrEmpty(user['location']))
                  TableViewItem(
                    leftIconData: Octicons.location,
                    text: Text(user['location']),
                    onTap: () {
                      launchUrl('https://www.google.com/maps/place/' +
                          (user['location'] as String)
                              .replaceAll(RegExp(r'\s+'), ''));
                    },
                  ),
                if (isNotNullOrEmpty(user['email']))
                  TableViewItem(
                    leftIconData: Octicons.mail,
                    text: Text(user['email']),
                    onTap: () {
                      launchUrl('mailto:' + user['email']);
                    },
                  ),
                if (isNotNullOrEmpty(user['websiteUrl']))
                  TableViewItem(
                    leftIconData: Octicons.link,
                    text: Text(user['websiteUrl']),
                    onTap: () {
                      var url = user['websiteUrl'] as String;
                      if (!url.startsWith('http')) {
                        url = 'http://$url';
                      }
                      launchUrl(url);
                    },
                  ),
              ],
            ),
            ...buildPinnedItems(
                user['pinnedItems']['nodes'],
                user[isOrganization ? 'pinnableItems' : 'repositories']
                    ['nodes']),
            CommonStyle.verticalGap,
          ],
        );
      },
    );
  }
}
