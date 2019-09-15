import 'dart:convert';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/settings.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/commits.dart';
import 'package:git_touch/screens/object.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../scaffolds/refresh.dart';
import '../widgets/repo_item.dart';
import '../widgets/entry_item.dart';
import '../screens/issues.dart';
import '../screens/user.dart';
import '../screens/organization.dart';
import '../widgets/action.dart';

class RepoScreen extends StatelessWidget {
  final String owner;
  final String name;

  static const _languageBarPadding = 10.0;

  RepoScreen(this.owner, this.name);
  RepoScreen.fromFullName(String fullName)
      : owner = fullName.split('/')[0],
        name = fullName.split('/')[1];

  Future queryRepo(BuildContext context) async {
    var data = await Provider.of<SettingsModel>(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    id
    owner {
      __typename
      login
      url
      avatarUrl
    }
    name
    isPrivate
    isFork
    description
    watchers {
      totalCount
    }
    stargazers {
      totalCount
    }
    forks {
      totalCount
    }
    primaryLanguage {
      color
      name
    }
    issues(states: OPEN) {
      totalCount
    }
    pullRequests(states: OPEN) {
      totalCount
    }
    languages(first: 10, orderBy: {field: SIZE, direction: DESC}) {
      totalSize
      edges {
        size
        node {
          name
          color
        }
      }
    }
    url
    defaultBranchRef {
      name
      target {
        ... on Commit {
          history {
            totalCount
          }
        }
      }
    }
    viewerHasStarred
    viewerSubscription
    object(expression: "master:README.md") {
      ... on Blob {
        text
      }
    }
    licenseInfo {
      name
      spdxId
    }
  }
}
''');
    // FIXME: 1. Default branch 2. Other readme file names
    return data['repository'];
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: AppBarTitle('Repository'),
      trailingBuilder: (payload) {
        return ActionButton(title: 'Repository Actions', actions: [
          MyAction(
            text: '@$owner',
            onPress: () {
              WidgetBuilder builder;

              switch (payload['owner']['__typename']) {
                case 'Organization':
                  // builder = (_) => OrganizationScreen(owner);
                  // break;

                  // Seems organization permission is a little complicated
                  // So we just launch browser currently
                  launch(payload['owner']['url']);
                  return;
                case 'User':
                  builder = (_) => UserScreen(owner);
                  break;
              }

              Provider.of<ThemeModel>(context)
                  .pushRoute(context: context, builder: builder);
            },
          ),
          MyAction(
            text: payload['viewerHasStarred'] ? 'Unstar' : 'Star',
            onPress: () async {
              if (payload['viewerHasStarred']) {
                await Provider.of<SettingsModel>(context)
                    .deleteWithCredentials('/user/starred/$owner/$name');
                payload['viewerHasStarred'] = false;
              } else {
                Provider.of<SettingsModel>(context)
                    .putWithCredentials('/user/starred/$owner/$name');
                payload['viewerHasStarred'] = true;
              }
            },
          ),
          // TODO: watch
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
      onRefresh: () => queryRepo(context),
      bodyBuilder: (payload) {
        final langWidth = MediaQuery.of(context).size.width -
            _languageBarPadding * 2 -
            (payload['languages']['edges'] as List).length +
            1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoItem(payload, inRepoScreen: true),
            borderView,
            Row(
              children: <Widget>[
                EntryItem(
                  count: payload['watchers']['totalCount'],
                  text: 'Watchers',
                  screenBuilder: (context) => UsersScreen(
                    login: owner,
                    name: name,
                    type: UsersScreenType.repoWatchers,
                  ),
                ),
                EntryItem(
                  count: payload['stargazers']['totalCount'],
                  text: 'Stars',
                  screenBuilder: (context) => UsersScreen(
                    login: owner,
                    name: name,
                    type: UsersScreenType.repoStars,
                  ),
                ),
                EntryItem(
                  count: payload['forks']['totalCount'],
                  text: 'Forks',
                  // screenBuilder: (context) => UsersScreen(),
                ),
              ],
            ),
            borderView1,
            Container(
              padding: const EdgeInsets.all(_languageBarPadding),
              color: PrimerColors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: SizedBox(
                  height: 10,
                  child: Row(
                      children: join(
                          SizedBox(width: 1),
                          (payload['languages']['edges'] as List)
                              .map((lang) => Container(
                                  color: convertColor(lang['node']['color']),
                                  width: langWidth *
                                      lang['size'] /
                                      payload['languages']['totalSize']))
                              .toList())),
                ),
              ),
            ),
            TableView(
              hasIcon: true,
              items: [
                TableViewItem(
                  leftIconData: Octicons.code,
                  text: Text('Code'),
                  rightWidget:
                      Text(filesize(payload['languages']['totalSize'] as int)),
                  screenBuilder: (_) => ObjectScreen(
                    owner: owner,
                    name: name,
                    branch: payload['defaultBranchRef']['name'], // FIXME: null
                  ),
                ),
                TableViewItem(
                  leftIconData: Octicons.issue_opened,
                  text: Text('Issues'),
                  rightWidget: Text(
                      numberFormat.format(payload['issues']['totalCount'])),
                  screenBuilder: (_) => IssuesScreen(owner: owner, name: name),
                ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text('Pull requests'),
                  rightWidget: Text(numberFormat
                      .format(payload['pullRequests']['totalCount'])),
                  screenBuilder: (_) => IssuesScreen(
                      owner: owner, name: name, isPullRequest: true),
                ),
              ],
            ),
            borderView1,
            TableView(
              hasIcon: true,
              items: [
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  rightWidget: Text(numberFormat.format(
                      payload['defaultBranchRef']['target']['history']
                          ['totalCount'])),
                  screenBuilder: (_) => CommitsScreen(owner, name),
                ),
                TableViewItem(
                  leftIconData: Octicons.law,
                  text: Text('License'),
                  rightWidget: Text(payload['licenseInfo'] == null
                      ? 'Unknown'
                      : (payload['licenseInfo']['spdxId'] ??
                          payload['licenseInfo']['name'])),
                ),
              ],
            ),
            borderView1,
            if (payload['object'] != null)
              Container(
                padding: EdgeInsets.all(16),
                child: MarkdownView(payload['object']['text']),
              ),
          ],
        );
      },
    );
  }
}
