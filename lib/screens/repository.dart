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
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:git_touch/widgets/mutation_button.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:tuple/tuple.dart';
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
            ActionItem(
              text: 'Projects(${repo.projects.totalCount})',
              url: repo.projectsUrl,
            ),
            ActionItem(
              text: 'Releases(${repo.releases.totalCount})',
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
                      Avatar(
                        url: repo.owner.avatarUrl,
                        size: AvatarSize.small,
                        linkUrl: '/$owner',
                      ),
                      SizedBox(width: 8),
                      Text(
                        '$owner / $name',
                        style: TextStyle(
                          fontSize: 20,
                          color: theme.paletteOf(context).primary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      MutationButton(
                        text: repo.viewerHasStarred ? 'Unstar' : 'Star',
                        onPressed: () async {
                          final res = await auth.gqlClient.execute(
                            GhStarQuery(
                              variables: GhStarArguments(
                                id: repo.id,
                                flag: !repo.viewerHasStarred,
                              ),
                            ),
                          );
                          setState(() {
                            repo.viewerHasStarred = res.data.removeStar
                                    ?.starrable?.viewerHasStarred ??
                                res.data.addStar.starrable.viewerHasStarred;
                          });
                        },
                      ),
                      // TODO:
                      // SizedBox(width: 4),
                      // MutationButton(
                      //   text: repo.viewerSubscription ==
                      //           GhRepoSubscriptionState.SUBSCRIBED
                      //       ? 'Unwatch'
                      //       : 'Watch',
                      //   onPressed: () async {
                      //     theme.showActions(
                      //       context,
                      //       GhWatchSubscriptionState.values.map((v) {
                      //         return ActionItem(
                      //           text: v.toString(),
                      //           onTap: (_) async {
                      //             final res = await auth.gqlClient.execute(
                      //               GhWatchQuery(
                      //                 variables: GhWatchArguments(
                      //                   id: repo.id,
                      //                   state:
                      //                       GhWatchSubscriptionState.SUBSCRIBED,
                      //                 ),
                      //               ),
                      //             );
                      //             setState(() {
                      //               final r = res.data.updateSubscription
                      //                   .subscribable as GhWatchRepository;
                      //               switch (r.viewerSubscription) {
                      //                 case GhWatchSubscriptionState.IGNORED:
                      //                   repo.viewerSubscription =
                      //                       GhRepoSubscriptionState.IGNORED;
                      //                   break;
                      //                 case GhWatchSubscriptionState.SUBSCRIBED:
                      //                   repo.viewerSubscription =
                      //                       GhRepoSubscriptionState.SUBSCRIBED;
                      //                   break;
                      //                 case GhWatchSubscriptionState
                      //                     .UNSUBSCRIBED:
                      //                   repo.viewerSubscription =
                      //                       GhRepoSubscriptionState
                      //                           .UNSUBSCRIBED;
                      //                   break;
                      //               }
                      //             });
                      //           },
                      //         );
                      //       }).toList(),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  if (repo.description != null && repo.description.isNotEmpty)
                    Text(
                      repo.description,
                      style: TextStyle(
                        color: theme.paletteOf(context).secondaryText,
                        fontSize: 17,
                      ),
                    ),
                  if (repo.homepageUrl != null && repo.homepageUrl.isNotEmpty)
                    Link(
                      url: repo.homepageUrl,
                      child: Text(
                        repo.homepageUrl,
                        style: TextStyle(
                          color: theme.paletteOf(context).primary,
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
                        return MyLabel(
                          name: node.topic.name,
                          // color: Colors.blue.shade50,
                          color: theme.paletteOf(context).grayBackground,
                          textColor: theme.paletteOf(context).primary,
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
                  url: 'https://github.com/$owner/$name/network/members',
                ),
              ],
            ),
            if (repo.languages.edges.isNotEmpty) ...[
              CommonStyle.border,
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: theme.paletteOf(context).background,
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
                  // color: theme.paletteOf(context).background,
                  padding: CommonStyle.padding.copyWith(top: 8, bottom: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
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
            ],
            TableView(
              hasIcon: true,
              items: [
                if (ref != null)
                  TableViewItem(
                    leftIconData: Octicons.code,
                    text: Text('Code'),
                    rightWidget: Text(
                      (license == null ? '' : '$license • ') +
                          filesize(repo.diskUsage * 1000),
                    ),
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
            if (readme != null)
              Container(
                padding: CommonStyle.padding,
                color: theme.paletteOf(context).background,
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
