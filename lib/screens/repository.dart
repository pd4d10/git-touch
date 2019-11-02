import 'dart:convert';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/screens/repositories.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/commits.dart';
import 'package:git_touch/screens/object.dart';
import 'package:git_touch/widgets/repository_item.dart';
import '../widgets/entry_item.dart';
import '../screens/issues.dart';
import 'package:git_touch/widgets/action_button.dart';

class RepositoryScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;

  RepositoryScreen(this.owner, this.name, {this.branch});

  get branchInfoKey => getBranchQueryKey(branch);

  Future queryRepo(BuildContext context) async {
    var branchKey = getBranchQueryKey(branch, withParams: true);
    var data = await Provider.of<AuthModel>(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    $repoChunk
    id
    diskUsage
    hasIssuesEnabled
    url
    viewerHasStarred
    viewerSubscription
    projectsResourcePath
    watchers {
      totalCount
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
      fetchData: () => Future.wait([
        queryRepo(context),
        fetchReadme(context),
      ]),
      actionBuilder: (data, setState) {
        return ActionButton(
          title: 'Repository Actions',
          items: [
            if (data != null) ...[
              ActionItem(
                text: data[0]['viewerHasStarred'] ? 'Unstar' : 'Star',
                onPress: (_) async {
                  if (data[0]['viewerHasStarred']) {
                    await Provider.of<AuthModel>(context)
                        .deleteWithCredentials('/user/starred/$owner/$name');
                    data[0]['viewerHasStarred'] = false;
                  } else {
                    await Provider.of<AuthModel>(context)
                        .putWithCredentials('/user/starred/$owner/$name');
                    data[0]['viewerHasStarred'] = true;
                  }
                  setState(() {});
                },
              ),
              ActionItem(
                text: data[0]['viewerSubscription'] == 'SUBSCRIBED'
                    ? 'Unwatch'
                    : 'Watch',
                onPress: (_) async {
                  if (data[0]['viewerSubscription'] == 'SUBSCRIBED') {
                    await Provider.of<AuthModel>(context).deleteWithCredentials(
                        '/repos/$owner/$name/subscription');
                    data[0]['viewerSubscription'] = 'UNSUBSCRIBED';
                  } else {
                    await Provider.of<AuthModel>(context)
                        .putWithCredentials('/repos/$owner/$name/subscription');
                    data[0]['viewerSubscription'] = 'SUBSCRIBED';
                  }
                  setState(() {});
                },
              ),
            ],
            if (data != null) ...[
              ActionItem.share(data[0]['url']),
              ActionItem.launch(data[0]['url']),
            ],
          ],
        );
      },
      bodyBuilder: (data, _) {
        var repo = data[0];
        var readme = data[1] as String;

        final langWidth = MediaQuery.of(context).size.width -
            CommonStyle.padding.left -
            CommonStyle.padding.right -
            (repo['languages']['edges'] as List).length +
            1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepositoryItem(repo, inRepoScreen: true),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  count: repo['watchers']['totalCount'],
                  text: 'Watchers',
                  screenBuilder: (context) => UsersScreen.watchers(owner, name),
                ),
                EntryItem(
                  count: repo['stargazers']['totalCount'],
                  text: 'Stars',
                  screenBuilder: (context) => UsersScreen.stars(owner, name),
                ),
                EntryItem(
                  count: repo['forks']['totalCount'],
                  text: 'Forks',
                  screenBuilder: (context) =>
                      RepositoriesScreen.forks(owner, name),
                ),
              ],
            ),
            CommonStyle.verticalGap,
            if ((repo['languages']['edges'] as List).isNotEmpty)
              Container(
                color: Colors.white,
                padding: CommonStyle.padding.copyWith(top: 8, bottom: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: SizedBox(
                    height: 10,
                    child: Row(
                        children: join(
                            SizedBox(width: 1),
                            (repo['languages']['edges'] as List)
                                .map((lang) => Container(
                                    color: convertColor(lang['node']['color']),
                                    width: langWidth *
                                        lang['size'] /
                                        repo['languages']['totalSize']))
                                .toList())),
                  ),
                ),
              ),
            TableView(
              hasIcon: true,
              items: [
                if (repo[branchInfoKey] != null)
                  TableViewItem(
                    leftIconData: Octicons.code,
                    text: Text('Code'),
                    rightWidget:
                        Text(filesize((repo['diskUsage'] as int) * 1000)),
                    screenBuilder: (_) => ObjectScreen(
                      owner,
                      name,
                      repo[branchInfoKey]['name'] as String,
                    ),
                  ),
                if (repo['hasIssuesEnabled'] as bool)
                  TableViewItem(
                    leftIconData: Octicons.issue_opened,
                    text: Text('Issues'),
                    rightWidget:
                        Text(numberFormat.format(repo['issues']['totalCount'])),
                    screenBuilder: (_) => IssuesScreen(owner, name),
                  ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text('Pull requests'),
                  rightWidget: Text(
                      numberFormat.format(repo['pullRequests']['totalCount'])),
                  screenBuilder: (_) =>
                      IssuesScreen(owner, name, isPullRequest: true),
                ),
                TableViewItem(
                  leftIconData: Octicons.project,
                  text: Text('Projects'),
                  rightWidget:
                      Text(numberFormat.format(repo['projects']['totalCount'])),
                  url: 'https://github.com' + repo['projectsResourcePath'],
                ),
              ],
            ),
            CommonStyle.verticalGap,
            TableView(
              hasIcon: true,
              items: [
                if (repo[branchInfoKey] != null) ...[
                  TableViewItem(
                    leftIconData: Octicons.history,
                    text: Text('Commits'),
                    rightWidget: Text(numberFormat.format(repo[branchInfoKey]
                        ['target']['history']['totalCount'])),
                    screenBuilder: (_) =>
                        CommitsScreen(owner, name, branch: branch),
                  ),
                  if (repo['refs'] != null)
                    TableViewItem(
                      leftIconData: Octicons.git_branch,
                      text: Text('Branches'),
                      rightWidget: Text(repo[branchInfoKey]['name'] +
                          ' • ' +
                          numberFormat.format(repo['refs']['totalCount'])),
                      onTap: () async {
                        var refs = repo['refs']['nodes'] as List;
                        if (refs.length < 2) return;

                        await Provider.of<ThemeModel>(context).showPicker(
                          context,
                          PickerGroupItem(
                            value: repo[branchInfoKey]['name'],
                            items: refs
                                .map((b) => PickerItem(b['name'] as String,
                                    text: (b['name'] as String)))
                                .toList(),
                            onClose: (result) {
                              if (result != branch) {
                                Provider.of<ThemeModel>(context)
                                    .pushReplacementRoute(
                                  context,
                                  (_) => RepositoryScreen(owner, name,
                                      branch: result),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                ],
                TableViewItem(
                  leftIconData: Octicons.tag,
                  text: Text('Releases'),
                  rightWidget:
                      Text((repo['releases']['totalCount'] as int).toString()),
                  url: repo['url'] + '/releases',
                ),
                TableViewItem(
                  leftIconData: Octicons.law,
                  text: Text('License'),
                  rightWidget: Text(repo['licenseInfo'] == null
                      ? 'Unknown'
                      : (repo['licenseInfo']['spdxId'] ??
                          repo['licenseInfo']['name'])),
                ),
              ],
            ),
            CommonStyle.verticalGap,
            if (readme != null)
              Container(
                padding: CommonStyle.padding,
                color: Colors.white,
                child: MarkdownView(readme),
              ),
            CommonStyle.verticalGap,
          ],
        );
      },
    );
  }
}
