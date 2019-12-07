import 'dart:convert';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/github_repository.dart';
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
import 'package:tuple/tuple.dart';
import '../widgets/entry_item.dart';
import '../screens/issues.dart';
import 'package:git_touch/widgets/action_button.dart';

class RepositoryScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;

  RepositoryScreen(this.owner, this.name, {this.branch});

  Future<GithubRepositoryRepository> _query(BuildContext context) async {
    var res = await Provider.of<AuthModel>(context).gqlClient.execute(
        GithubRepositoryQuery(
            variables: GithubRepositoryArguments(
                owner: owner,
                name: name,
                branchSpecified: branch != null,
                branch: branch ?? '')));
    return res.data.repository;
  }

  Future<String> _fetchReadme(BuildContext context) async {
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
    return RefreshStatefulScaffold<Tuple2<GithubRepositoryRepository, String>>(
      title: AppBarTitle('Repository'),
      fetchData: () async {
        final rs = await Future.wait([
          _query(context),
          _fetchReadme(context),
        ]);
        return Tuple2(rs[0] as GithubRepositoryRepository, rs[1] as String);
      },
      actionBuilder: (data, setState) {
        if (data == null)
          return ActionButton(title: 'Repository Actions', items: []);

        final repo = data.item1;
        return ActionButton(
          title: 'Repository Actions',
          items: [
            ActionItem(
              text: repo.viewerHasStarred ? 'Unstar' : 'Star',
              onPress: (_) async {
                if (repo.viewerHasStarred) {
                  await Provider.of<AuthModel>(context)
                      .deleteWithCredentials('/user/starred/$owner/$name');
                  repo.viewerHasStarred = false;
                } else {
                  await Provider.of<AuthModel>(context)
                      .putWithCredentials('/user/starred/$owner/$name');
                  repo.viewerHasStarred = true;
                }
                setState(() {});
              },
            ),
            // TODO:
            // ActionItem(
            //   text:  data[0]['viewerSubscription'] == 'SUBSCRIBED'
            //       ? 'Unwatch'
            //       : 'Watch',
            //   onPress: (_) async {
            //     if (data[0]['viewerSubscription'] == 'SUBSCRIBED') {
            //       await Provider.of<AuthModel>(context).deleteWithCredentials(
            //           '/repos/$owner/$name/subscription');
            //       data[0]['viewerSubscription'] = 'UNSUBSCRIBED';
            //     } else {
            //       await Provider.of<AuthModel>(context)
            //           .putWithCredentials('/repos/$owner/$name/subscription');
            //       data[0]['viewerSubscription'] = 'SUBSCRIBED';
            //     }
            //     setState(() {});
            //   },
            // ),
            ActionItem.share(repo.url),
            ActionItem.launch(repo.url),
          ],
        );
      },
      bodyBuilder: (data, _) {
        final repo = data.item1;
        final readme = data.item2;
        final ref = branch == null ? repo.defaultBranchRef : repo.ref;

        final langWidth = MediaQuery.of(context).size.width -
            CommonStyle.padding.left -
            CommonStyle.padding.right -
            repo.languages.edges.length +
            1;

        final theme = Provider.of<ThemeModel>(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepositoryItem.raw(
                repo.owner.login,
                repo.owner.avatarUrl,
                repo.name,
                repo.description,
                Octicons.repo, // TODO:
                repo.stargazers.totalCount,
                repo.forks.totalCount,
                repo.primaryLanguage?.name,
                repo.primaryLanguage?.color,
                null,
                repo.repositoryTopics.nodes,
                inRepoScreen: true),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  count: repo.watchers.totalCount,
                  text: 'Watchers',
                  screenBuilder: (context) => UsersScreen.watchers(owner, name),
                ),
                EntryItem(
                  count: repo.stargazers.totalCount,
                  text: 'Stars',
                  screenBuilder: (context) => UsersScreen.stars(owner, name),
                ),
                EntryItem(
                  count: repo.forks.totalCount,
                  text: 'Forks',
                  // screenBuilder: (context) =>
                  //     RepositoriesScreen.forks(owner, name), TODO:
                ),
              ],
            ),
            CommonStyle.verticalGap,
            if (repo.languages.edges.isNotEmpty)
              Container(
                color: theme.palette.background,
                padding: CommonStyle.padding.copyWith(top: 8, bottom: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: SizedBox(
                    height: 10,
                    child: Row(
                      children: join(
                        SizedBox(width: 1),
                        repo.languages.edges
                            .map((lang) => Container(
                                color: convertColor(lang.node.color),
                                width: langWidth *
                                    lang.size /
                                    repo.languages.totalSize))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            TableView(
              hasIcon: true,
              items: [
                if (ref != null)
                  TableViewItem(
                    leftIconData: Octicons.code,
                    text: Text('Code'),
                    rightWidget: Text(filesize(repo.diskUsage * 1000)),
                    screenBuilder: (_) => ObjectScreen(
                      owner,
                      name,
                      ref.name,
                    ),
                  ),
                if (repo.hasIssuesEnabled)
                  TableViewItem(
                    leftIconData: Octicons.issue_opened,
                    text: Text('Issues'),
                    rightWidget:
                        Text(numberFormat.format(repo.issues.totalCount)),
                    screenBuilder: (_) => IssuesScreen(owner, name),
                  ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text('Pull requests'),
                  rightWidget:
                      Text(numberFormat.format(repo.pullRequests.totalCount)),
                  screenBuilder: (_) =>
                      IssuesScreen(owner, name, isPullRequest: true),
                ),
                TableViewItem(
                  leftIconData: Octicons.project,
                  text: Text('Projects'),
                  rightWidget:
                      Text(numberFormat.format(repo.projects.totalCount)),
                  url: 'https://github.com' + repo.projectsResourcePath,
                ),
              ],
            ),
            CommonStyle.verticalGap,
            TableView(
              hasIcon: true,
              items: [
                if (ref != null) ...[
                  TableViewItem(
                    leftIconData: Octicons.history,
                    text: Text('Commits'),
                    rightWidget: Text(
                      numberFormat.format(
                        (ref.target as GithubRepositoryCommit)
                            .history
                            ?.totalCount,
                      ),
                    ),
                    screenBuilder: (_) =>
                        CommitsScreen(owner, name, branch: branch),
                  ),
                  if (repo.refs != null)
                    TableViewItem(
                      leftIconData: Octicons.git_branch,
                      text: Text('Branches'),
                      rightWidget: Text(ref.name +
                          ' • ' +
                          numberFormat.format(repo.refs.totalCount)),
                      onTap: () async {
                        final refs = repo.refs.nodes;
                        if (refs.length < 2) return;

                        await Provider.of<ThemeModel>(context).showPicker(
                          context,
                          PickerGroupItem(
                            value: ref.name,
                            items: refs
                                .map((b) => PickerItem(b.name, text: b.name))
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
                  rightWidget: Text(repo.releases.totalCount.toString()),
                  url: repo.url + '/releases',
                ),
                TableViewItem(
                  leftIconData: Octicons.law,
                  text: Text('License'),
                  rightWidget: Text(repo.licenseInfo == null
                      ? 'Unknown'
                      : (repo.licenseInfo.spdxId ?? repo.licenseInfo.name)),
                ),
              ],
            ),
            CommonStyle.verticalGap,
            if (readme != null)
              Container(
                padding: CommonStyle.padding,
                color: theme.palette.background,
                child: MarkdownView(
                  readme,
                  basePaths: [owner, name, branch ?? 'master'], // TODO:
                ),
              ),
            CommonStyle.verticalGap,
          ],
        );
      },
    );
  }
}
