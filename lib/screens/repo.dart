import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/settings.dart';
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
  final String branch;

  static const _languageBarPadding = 10.0;

  RepoScreen(this.owner, this.name, {this.branch});
  RepoScreen.fromFullName(String fullName, {this.branch})
      : owner = fullName.split('/')[0],
        name = fullName.split('/')[1];

  get _branchQueryChunk =>
      branch == null ? 'defaultBranchRef' : 'ref(qualifiedName: "$branch")';
  get _branchName => branch ?? 'master';
  get branchInfoKey => branch == null ? 'defaultBranchRef' : 'ref';

  Future queryRepo(BuildContext context) async {
    var data = await Provider.of<SettingsModel>(context).query('''
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
    $_branchQueryChunk {
      name
      target {
        ... on Commit {
          history {
            totalCount
          }
        }
      }
    }
    refs(first: 10, refPrefix: "refs/heads/") {
      totalCount
      nodes {
        name
      }
    }
    object(expression: "$_branchName:README.md") {
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
                  builder = (_) => OrganizationScreen(owner);
                  break;
                case 'User':
                  builder = (_) => UserScreen(owner);
                  break;
              }

              Provider.of<ThemeModel>(context).pushRoute(context, builder);
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
                        branch: payload[branchInfoKey]['name']),
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
              ],
            ),
            borderView1,
            TableView(
              hasIcon: true,
              items: [
                if (payload[branchInfoKey] != null)
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
                    rightWidget: Text(_branchName +
                        ' • ' +
                        numberFormat.format(payload['refs']['totalCount'])),
                    onTap: () async {
                      var result = await Provider.of<ThemeModel>(context)
                          .showDialogOptions(
                              context,
                              (payload['refs']['nodes'] as List)
                                  .map((b) => DialogOption(
                                      value: b['name'] as String,
                                      widget: Text(b['name'] as String)))
                                  .toList());

                      if (result != null) {
                        Provider.of<ThemeModel>(context).pushReplacementRoute(
                            context,
                            (_) => RepoScreen(owner, name, branch: result));
                      }
                    },
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
