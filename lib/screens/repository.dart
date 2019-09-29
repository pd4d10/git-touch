import 'dart:convert';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/commits.dart';
import 'package:git_touch/screens/object.dart';
import 'package:share/share.dart';
import 'package:git_touch/widgets/repository_item.dart';
import '../widgets/entry_item.dart';
import '../screens/issues.dart';
import '../screens/user.dart';
import '../screens/organization.dart';
import '../widgets/action.dart';

class RepositoryScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;

  static const _languageBarPadding = 10.0;

  RepositoryScreen(this.owner, this.name, {this.branch});
  RepositoryScreen.fromFullName(String fullName, {this.branch})
      : owner = fullName.split('/')[0],
        name = fullName.split('/')[1];

  get branchInfoKey => getBranchQueryKey(branch);

  Future queryRepo(BuildContext context) async {
    var branchKey = getBranchQueryKey(branch, withParams: true);
    var data = await Provider.of<AuthModel>(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    id
    owner {
      __typename
      login
      avatarUrl
    }
    name
    isPrivate
    isFork
    description
    diskUsage
    hasIssuesEnabled
    url
    viewerHasStarred
    viewerSubscription
    projectsResourcePath
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
    projects {
      totalCount
    }
    releases {
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
    $branchKey {
      name
      target {
        ... on Commit {
          history {
            totalCount
          }
        }
      }
    }
    refs(first: 100, refPrefix: "refs/heads/") {
      totalCount
      nodes {
        name
      }
    }
    licenseInfo {
      name
      spdxId
    }
    repositoryTopics(first: 100) {
      nodes {
        url
        topic {
          name
        }
      }
    }
  }
}
''');
    return data['repository'];
  }

  Future<String> fetchReadme(BuildContext context) async {
    var data = await Provider.of<AuthModel>(context)
        .getWithCredentials('/repos/$owner/$name/readme');

    if (data['content'] == null) {
      return null;
    }

    var bits = base64.decode((data['content'] as String).replaceAll('\n', ''));
    var str = utf8.decode(bits);
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: AppBarTitle('Repository'),
      onRefresh: () => Future.wait([
        queryRepo(context),
        fetchReadme(context),
      ]),
      trailingBuilder: (data) {
        return ActionButton(
          title: 'Repository Actions',
          actions: [
            MyAction(
              text: '@$owner',
              onPress: () {
                if (data == null) return;
                WidgetBuilder builder;

                switch (data[0]['owner']['__typename']) {
                  case 'Organization':
                    builder = (_) => OrganizationScreen(owner);
                    break;
                  case 'User':
                    builder = (_) => UserScreen(owner);
                    break;
                }

                Provider.of<ThemeModel>(context).pushRoute(context, builder);
              },
            ),
            if (data != null) ...[
              MyAction(
                text: data[0]['viewerHasStarred'] ? 'Unstar' : 'Star',
                onPress: () async {
                  if (data[0]['viewerHasStarred']) {
                    await Provider.of<AuthModel>(context)
                        .deleteWithCredentials('/user/starred/$owner/$name');
                    data[0]['viewerHasStarred'] = false;
                  } else {
                    Provider.of<AuthModel>(context)
                        .putWithCredentials('/user/starred/$owner/$name');
                    data[0]['viewerHasStarred'] = true;
                  }
                },
              ),
              MyAction(
                text: data[0]['viewerSubscription'] == 'SUBSCRIBED'
                    ? 'Unwatch'
                    : 'Watch',
                onPress: () async {
                  if (data[0]['viewerSubscription'] == 'SUBSCRIBED') {
                    await Provider.of<AuthModel>(context).deleteWithCredentials(
                        '/repos/$owner/$name/subscription');
                    data[0]['viewerSubscription'] = 'UNSUBSCRIBED';
                  } else {
                    Provider.of<AuthModel>(context)
                        .putWithCredentials('/repos/$owner/$name/subscription');
                    data[0]['viewerSubscription'] = 'SUBSCRIBED';
                  }
                },
              ),
            ],
            MyAction(
              text: 'Share',
              onPress: () {
                if (data != null) {
                  Share.share(data[0]['url']);
                }
              },
            ),
            MyAction(
              text: 'Open in Browser',
              onPress: () {
                if (data != null) {
                  launchUrl(data[0]['url']);
                }
              },
            ),
          ],
        );
      },
      bodyBuilder: (data) {
        var payload = data[0];
        var readme = data[1] as String;

        final langWidth = MediaQuery.of(context).size.width -
            _languageBarPadding * 2 -
            (payload['languages']['edges'] as List).length +
            1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepositoryItem(payload, inRepoScreen: true),
            borderView,
            Row(
              children: <Widget>[
                EntryItem(
                  count: payload['watchers']['totalCount'],
                  text: 'Watchers',
                  screenBuilder: (context) => UsersScreen.watchers(owner, name),
                ),
                EntryItem(
                  count: payload['stargazers']['totalCount'],
                  text: 'Stars',
                  screenBuilder: (context) => UsersScreen.stars(owner, name),
                ),
                EntryItem(
                  count: payload['forks']['totalCount'],
                  text: 'Forks',
                  // screenBuilder: (context) => UsersScreen(),
                ),
              ],
            ),
            borderView1,
            if ((payload['languages']['edges'] as List).isNotEmpty)
              Container(
                padding: const EdgeInsets.all(_languageBarPadding),
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
                if (payload[branchInfoKey] != null)
                  TableViewItem(
                    leftIconData: Octicons.code,
                    text: Text('Code'),
                    rightWidget:
                        Text(filesize((payload['diskUsage'] as int) * 1000)),
                    screenBuilder: (_) => ObjectScreen(
                      owner: owner,
                      name: name,
                      branch: payload[branchInfoKey]['name'],
                    ),
                  ),
                if (payload['hasIssuesEnabled'] as bool)
                  TableViewItem(
                    leftIconData: Octicons.issue_opened,
                    text: Text('Issues'),
                    rightWidget: Text(
                        numberFormat.format(payload['issues']['totalCount'])),
                    screenBuilder: (_) =>
                        IssuesScreen(owner: owner, name: name),
                  ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text('Pull requests'),
                  rightWidget: Text(numberFormat
                      .format(payload['pullRequests']['totalCount'])),
                  screenBuilder: (_) => IssuesScreen(
                      owner: owner, name: name, isPullRequest: true),
                ),
                TableViewItem(
                  leftIconData: Octicons.project,
                  text: Text('Projects'),
                  rightWidget: Text(
                      numberFormat.format(payload['projects']['totalCount'])),
                  url: 'https://github.com' + payload['projectsResourcePath'],
                ),
              ],
            ),
            borderView1,
            TableView(
              hasIcon: true,
              items: [
                if (payload[branchInfoKey] != null) ...[
                  TableViewItem(
                    leftIconData: Octicons.history,
                    text: Text('Commits'),
                    rightWidget: Text(numberFormat.format(payload[branchInfoKey]
                        ['target']['history']['totalCount'])),
                    screenBuilder: (_) =>
                        CommitsScreen(owner, name, branch: branch),
                  ),
                  if (payload['refs'] != null)
                    TableViewItem(
                      leftIconData: Octicons.git_branch,
                      text: Text('Branches'),
                      rightWidget: Text(payload[branchInfoKey]['name'] +
                          ' • ' +
                          numberFormat.format(payload['refs']['totalCount'])),
                      onTap: () async {
                        var refs = payload['refs']['nodes'] as List;
                        if (refs.length < 2) return;

                        await Provider.of<ThemeModel>(context).showPicker(
                          context,
                          PickerGroupItem(
                            value: payload[branchInfoKey]['name'],
                            items: refs
                                .map((b) => PickerItem(b['name'] as String,
                                    text: (b['name'] as String)))
                                .toList(),
                            onClose: (result) {
                              Provider.of<ThemeModel>(context)
                                  .pushReplacementRoute(
                                context,
                                (_) => RepositoryScreen(owner, name,
                                    branch: result),
                              );
                            },
                          ),
                        );
                      },
                    ),
                ],
                TableViewItem(
                  leftIconData: Octicons.tag,
                  text: Text('Releases'),
                  rightWidget: Text(
                      (payload['releases']['totalCount'] as int).toString()),
                  url: payload['url'] + '/releases',
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
            if (readme != null)
              Container(
                padding: EdgeInsets.all(16),
                child: MarkdownView(readme),
              ),
          ],
        );
      },
    );
  }
}
