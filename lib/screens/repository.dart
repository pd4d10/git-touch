import 'dart:convert';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:tuple/tuple.dart';
import '../widgets/entry_item.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:charts_flutter/flutter.dart' as charts;

final repositoryRouter = RouterScreen('/:owner/:name', (context, params) {
  if (params['ref'] == null) {
    return RepositoryScreen(params['owner'].first, params['name'].first);
  } else {
    return RepositoryScreen(params['owner'].first, params['name'].first,
        branch: params['ref'].first);
  }
});

class RepositoryScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;

  RepositoryScreen(this.owner, this.name, {this.branch});

  Future<GhRepoRepository> _query(BuildContext context) async {
    var res = await Provider.of<AuthModel>(context).gqlClient.execute(
        GhRepoQuery(
            variables: GhRepoArguments(
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
    return RefreshStatefulScaffold<Tuple2<GhRepoRepository, String>>(
      title: AppBarTitle('Repository'),
      fetchData: () async {
        final rs = await Future.wait([
          _query(context),
          _fetchReadme(context),
        ]);
        return Tuple2(rs[0] as GhRepoRepository, rs[1] as String);
      },
      actionBuilder: (data, setState) {
        final repo = data.item1;
        return ActionButton(
          title: 'Repository Actions',
          items: [
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
            ActionItem(
              text: 'Projects (${repo.projects.totalCount})',
              url: repo.projectsUrl,
            ),
            ActionItem(
              text: 'Releases (${repo.releases.totalCount})',
              url: 'https://github.com/$owner/$name/releases',
            ),
            ActionItem.share(repo.url),
            ActionItem.launch(repo.url),
          ],
        );
      },
      bodyBuilder: (data, setState) {
        final repo = data.item1;
        final readme = data.item2;
        final ref = branch == null ? repo.defaultBranchRef : repo.ref;

        final langWidth = MediaQuery.of(context).size.width -
            CommonStyle.padding.left -
            CommonStyle.padding.right -
            repo.languages.edges.length +
            1;

        final theme = Provider.of<ThemeModel>(context);
        final auth = Provider.of<AuthModel>(context);
        final license = repo.licenseInfo?.spdxId ?? repo.licenseInfo?.name;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: CommonStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: join(SizedBox(height: 12), [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GithubAvatar(
                          url: repo.owner.avatarUrl,
                          size: AvatarSize.small,
                          login: owner),
                      SizedBox(width: 8),
                      Text(
                        '$owner / $name',
                        style: TextStyle(
                          fontSize: 20,
                          color: theme.palette.primary,
                        ),
                      ),
                      Expanded(child: Container()),
                      CupertinoButton(
                        onPressed: () async {
                          if (repo.viewerHasStarred) {
                            final res = await auth.gqlClient.execute(
                              GhRemoveStarQuery(
                                variables: GhRemoveStarArguments(id: repo.id),
                              ),
                            );
                            repo.viewerHasStarred =
                                res.data.removeStar.starrable.viewerHasStarred;
                          } else {
                            final res = await auth.gqlClient.execute(
                              GhAddStarQuery(
                                variables: GhAddStarArguments(id: repo.id),
                              ),
                            );
                            repo.viewerHasStarred =
                                res.data.addStar.starrable.viewerHasStarred;
                          }
                          setState(() {});
                        },
                        minSize: 0,
                        color: theme.palette.primary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        child: Text(
                          repo.viewerHasStarred ? 'Unstar' : 'Star',
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  if (repo.description != null && repo.description.isNotEmpty)
                    Text(
                      repo.description,
                      style: TextStyle(
                        color: theme.palette.secondaryText,
                        fontSize: 17,
                      ),
                    ),
                  if (repo.homepageUrl != null && repo.homepageUrl.isNotEmpty)
                    Link(
                      url: repo.homepageUrl,
                      child: Text(
                        repo.homepageUrl,
                        style: TextStyle(
                          color: theme.palette.primary,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  if (repo.repositoryTopics.nodes.isNotEmpty)
                    // TODO: link
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: repo.repositoryTopics.nodes.map((node) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: PrimerColors.blue000,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Text(
                            node.topic.name,
                            style: TextStyle(
                              fontSize: 15,
                              color: theme.palette.primary,
                            ),
                          ),
                        );
                      }).toList(),
                    )
                ]),
              ),
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  count: repo.watchers.totalCount,
                  text: 'Watchers',
                  url: '/$owner/$name/watchers',
                ),
                EntryItem(
                  count: repo.stargazers.totalCount,
                  text: 'Stars',
                  url: '/$owner/$name/stargazers',
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
              GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: theme.palette.background,
                        padding: EdgeInsets.all(40),
                        height: 400,
                        child: charts.PieChart(
                          [
                            charts.Series<GhRepoLanguageEdge, String>(
                              id: 'languages',
                              domainFn: (v, _) => v.node.name,
                              measureFn: (v, _) => v.size,
                              colorFn: (v, _) =>
                                  charts.Color.fromHex(code: v.node.color),
                              data: repo.languages.edges,
                              labelAccessorFn: (v, _) => v.node.name,
                            )
                          ],
                          defaultRenderer: charts.ArcRendererConfig(
                            arcRendererDecorators: [
                              charts.ArcLabelDecorator(
                                insideLabelStyleSpec: charts.TextStyleSpec(
                                  fontSize: 20,
                                  color: charts.Color.white,
                                ),
                                outsideLabelStyleSpec: charts.TextStyleSpec(
                                  fontSize: 20,
                                  color: charts.Color.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  // color: theme.palette.background,
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
              ),
            TableView(
              hasIcon: true,
              items: [
                if (ref != null)
                  TableViewItem(
                    leftIconData: Octicons.code,
                    text: Text('Code'),
                    rightWidget: Text((license == null ? '' : license + ' / ') +
                        filesize(repo.diskUsage * 1000)),
                    url: '/$owner/$name/blob/${ref.name}',
                  ),
                if (repo.hasIssuesEnabled)
                  TableViewItem(
                    leftIconData: Octicons.issue_opened,
                    text: Text('Issues'),
                    rightWidget:
                        Text(numberFormat.format(repo.issues.totalCount)),
                    url: '/$owner/$name/issues',
                  ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text('Pull requests'),
                  rightWidget:
                      Text(numberFormat.format(repo.pullRequests.totalCount)),
                  url: '/$owner/$name/pulls',
                ),
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  rightWidget: Text((ref.target as GhRepoCommit)
                      .history
                      ?.totalCount
                      .toString()),
                  url: '/$owner/$name/commits',
                ),
                if (ref != null) ...[
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
                            onClose: (ref) {
                              if (ref != branch) {
                                Provider.of<ThemeModel>(context).push(
                                    context, '/$owner/$name?ref=$ref',
                                    replace: true);
                              }
                            },
                          ),
                        );
                      },
                    ),
                ],
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
