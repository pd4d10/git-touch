import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:git_touch/widgets/language_bar.dart';
import 'package:git_touch/widgets/mutation_button.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:tuple/tuple.dart';
import 'package:git_touch/widgets/action_button.dart';

class GhRepoScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;
  GhRepoScreen(this.owner, this.name, {this.branch});

  Future<GhRepoRepository> _query(BuildContext context) async {
    var res = await context.read<AuthModel>().gqlClient.execute(GhRepoQuery(
        variables: GhRepoArguments(
            owner: owner,
            name: name,
            branchSpecified: branch != null,
            branch: branch ?? '')));
    return res.data.repository;
  }

  String _buildWatchState(GhRepoSubscriptionState state) {
    switch (state) {
      case GhRepoSubscriptionState.IGNORED:
        return 'Ignoring';
      case GhRepoSubscriptionState.SUBSCRIBED:
        return 'Watching';
      case GhRepoSubscriptionState.UNSUBSCRIBED:
        return 'Not watching';
      default:
        return 'Unknown';
    }
  }

  Future<String> _fetchContributors(BuildContext context) async {
    final res = await context
        .read<AuthModel>()
        .ghClient
        .getJSON('/repos/$owner/$name/stats/contributors');
    return res.length.toString();
  }

  Future<String> _fetchReadme(BuildContext context) async {
    try {
      final res = await context
          .read<AuthModel>()
          .ghClient
          .repositories
          .getReadme(RepositorySlug(owner, name));
      return res.text;
    } catch (e) {
      // 404
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return RefreshStatefulScaffold<Tuple3<GhRepoRepository, String, String>>(
      title: AppBarTitle('Repository'),
      fetchData: () async {
        final rs = await Future.wait([
          _query(context),
          _fetchReadme(context),
          _fetchContributors(context),
        ]);

        return Tuple3(rs[0] as GhRepoRepository, rs[1] as String, rs[2]);
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
            ...ActionItem.getUrlActions(repo.url),
          ],
        );
      },
      bodyBuilder: (data, setState) {
        final repo = data.item1;
        final readme = data.item2;
        final contributorsCount = data.item3;
        final ref = branch == null ? repo.defaultBranchRef : repo.ref;
        final license = repo.licenseInfo?.spdxId ?? repo.licenseInfo?.name;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: repo.owner.avatarUrl,
              avatarLink: '/github/${repo.owner.login}',
              name: repo.name,
              owner: repo.owner.login,
              description: repo.description,
              homepageUrl: repo.homepageUrl,
              actions: [
                Row(
                  children: <Widget>[
                    MutationButton(
                      active: repo.viewerSubscription ==
                          GhRepoSubscriptionState.SUBSCRIBED,
                      text: _buildWatchState(repo.viewerSubscription),
                      onPressed: () async {
                        final vs = GhRepoSubscriptionState.values.where((v) =>
                            v != GhRepoSubscriptionState.ARTEMIS_UNKNOWN);
                        theme.showActions(context, [
                          for (var v in vs)
                            ActionItem(
                              text: _buildWatchState(v),
                              onTap: (_) async {
                                switch (v) {
                                  case GhRepoSubscriptionState.SUBSCRIBED:
                                  case GhRepoSubscriptionState.IGNORED:
                                    final res = await context
                                        .read<AuthModel>()
                                        .ghClient
                                        .activity
                                        .setRepositorySubscription(
                                          RepositorySlug(
                                              repo.owner.login, repo.name),
                                          subscribed: v ==
                                              GhRepoSubscriptionState
                                                  .SUBSCRIBED,
                                          ignored: v ==
                                              GhRepoSubscriptionState.IGNORED,
                                        );
                                    setState(() {
                                      if (res.subscribed) {
                                        repo.viewerSubscription =
                                            GhRepoSubscriptionState.SUBSCRIBED;
                                      } else if (res.ignored) {
                                        repo.viewerSubscription =
                                            GhRepoSubscriptionState.IGNORED;
                                      }
                                    });
                                    break;
                                  case GhRepoSubscriptionState.UNSUBSCRIBED:
                                    await context
                                        .read<AuthModel>()
                                        .ghClient
                                        .activity
                                        .deleteRepositorySubscription(
                                          RepositorySlug(
                                            repo.owner.login,
                                            repo.name,
                                          ),
                                        );
                                    setState(() {
                                      repo.viewerSubscription =
                                          GhRepoSubscriptionState.UNSUBSCRIBED;
                                    });
                                    break;
                                  default:
                                }
                              },
                            )
                        ]);
                      },
                    ),
                    SizedBox(width: 8),
                    MutationButton(
                      active: repo.viewerHasStarred,
                      text: repo.viewerHasStarred ? 'Unstar' : 'Star',
                      onPressed: () async {
                        if (repo.viewerHasStarred) {
                          await context
                              .read<AuthModel>()
                              .ghClient
                              .activity
                              .unstar(
                                  RepositorySlug(repo.owner.login, repo.name));
                        } else {
                          await context
                              .read<AuthModel>()
                              .ghClient
                              .activity
                              .star(
                                  RepositorySlug(repo.owner.login, repo.name));
                        }
                        setState(() {
                          repo.viewerHasStarred = !repo.viewerHasStarred;
                        });
                      },
                    ),
                  ],
                ),
              ],
              trailings: <Widget>[
                if (repo.repositoryTopics.nodes.isNotEmpty)
                  // TODO: link
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: repo.repositoryTopics.nodes.map((node) {
                      return MyLabel(
                        name: node.topic.name,
                        // color: Colors.blue.shade50,
                        color: theme.palette.grayBackground,
                        textColor: theme.palette.primary,
                      );
                    }).toList(),
                  )
              ],
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  count: repo.watchers.totalCount,
                  text: 'Watchers',
                  url: '/github/$owner/$name/watchers',
                ),
                EntryItem(
                  count: repo.stargazers.totalCount,
                  text: 'Stars',
                  url: '/github/$owner/$name/stargazers',
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
              LanguageBar([
                for (var edge in repo.languages.edges)
                  LanguageBarItem(
                    name: edge.node.name,
                    ratio: edge.size / repo.languages.totalSize,
                    hexColor: edge.node.color,
                  )
              ]),
            ],
            TableView(
              hasIcon: true,
              items: [
                if (ref != null)
                  TableViewItem(
                    leftIconData: Octicons.code,
                    text: Text(repo.primaryLanguage?.name ?? 'Code'),
                    rightWidget: Text(
                      (license == null ? '' : '$license • ') +
                          filesize(repo.diskUsage * 1000),
                    ),
                    url: '/github/$owner/$name/blob/${ref.name}',
                  ),
                if (repo.hasIssuesEnabled)
                  TableViewItem(
                    leftIconData: Octicons.issue_opened,
                    text: Text('Issues'),
                    rightWidget:
                        Text(numberFormat.format(repo.issues.totalCount)),
                    url: '/github/$owner/$name/issues',
                  ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text('Pull requests'),
                  rightWidget:
                      Text(numberFormat.format(repo.pullRequests.totalCount)),
                  url: '/github/$owner/$name/pulls',
                ),
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  rightWidget: Text((ref.target as GhRepoCommit)
                      .history
                      ?.totalCount
                      .toString()),
                  url: '/github/$owner/$name/commits',
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

                        await theme.showPicker(
                          context,
                          PickerGroupItem(
                            value: ref.name,
                            items: refs
                                .map((b) => PickerItem(b.name, text: b.name))
                                .toList(),
                            onClose: (ref) {
                              if (ref != branch) {
                                theme.push(
                                    context, '/github/$owner/$name?ref=$ref',
                                    replace: true);
                              }
                            },
                          ),
                        );
                      },
                    ),
                ],
                TableViewItem(
                  leftIconData: Octicons.organization,
                  text: Text('Contributors'),
                  rightWidget: Text(contributorsCount),
                  url: '/github/$owner/$name/contributors',
                )
              ],
            ),
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
