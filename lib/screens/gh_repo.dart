import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:git_touch/widgets/language_bar.dart';
import 'package:git_touch/widgets/mutation_button.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:tuple/tuple.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:universal_io/prefer_universal/io.dart';
import '../generated/l10n.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return RefreshStatefulScaffold<
        Tuple3<GhRepoRepository, Future<int>, MarkdownViewData>>(
      title: AppBarTitle(S.of(context).repository),
      fetch: () async {
        final ghClient = context.read<AuthModel>().ghClient;

        final repo = await _query(context);

        final countFuture = ghClient
            .getJSON('/repos/$owner/$name/stats/contributors')
            .then((v) => (v as List).length);

        final readmeFactory = (String acceptHeader) {
          return () {
            return ghClient.request(
              'GET',
              '/repos/$owner/$name/readme',
              headers: {HttpHeaders.acceptHeader: acceptHeader},
            ).then((res) {
              return res.body;
            }).catchError((err) {
              // 404
              return null;
            });
          };
        };
        final readmeData = MarkdownViewData(
          context,
          md: readmeFactory('application/vnd.github.v3.raw'),
          html: readmeFactory('application/vnd.github.v3.html'),
        );

        return Tuple3(repo, countFuture, readmeData);
      },
      actionBuilder: (data, setState) {
        final repo = data.item1;
        return ActionButton(
          title: S.of(context).repositoryActions,
          items: [
            ActionItem(
              text: S.of(context).projects + '(${repo.projects.totalCount})',
              url: repo.projectsUrl,
            ),
            ActionItem(
              text: S.of(context).releases + '(${repo.releases.totalCount})',
              url: 'https://github.com/$owner/$name/releases',
            ),
            ...ActionItem.getUrlActions(repo.url),
          ],
        );
      },
      bodyBuilder: (data, setState) {
        final repo = data.item1;
        final contributionFuture = data.item2;
        final readmeData = data.item3;

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
                      onTap: () async {
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
                      onTap: () async {
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
                  text: S.of(context).watchers,
                  url: '/github/$owner/$name/watchers',
                ),
                EntryItem(
                  count: repo.stargazers.totalCount,
                  text: S.of(context).stars,
                  url: '/github/$owner/$name/stargazers',
                ),
                EntryItem(
                  count: repo.forks.totalCount,
                  text: S.of(context).forks,
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
                    text: Text(S.of(context).issues),
                    rightWidget:
                        Text(numberFormat.format(repo.issues.totalCount)),
                    url: '/github/$owner/$name/issues',
                  ),
                TableViewItem(
                  leftIconData: Octicons.git_pull_request,
                  text: Text(S.of(context).pullRequests),
                  rightWidget:
                      Text(numberFormat.format(repo.pullRequests.totalCount)),
                  url: '/github/$owner/$name/pulls',
                ),
                if (ref != null) ...[
                  TableViewItem(
                    leftIconData: Octicons.history,
                    text: Text(S.of(context).commits),
                    rightWidget: Text(
                        ((ref.target as GhRepoCommit).history?.totalCount ?? 0)
                            .toString()),
                    url: '/github/$owner/$name/commits',
                  ),
                  if (repo.refs != null)
                    TableViewItem(
                      leftIconData: Octicons.git_branch,
                      text: Text(S.of(context).branches),
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
                  TableViewItem(
                    leftIconData: Octicons.organization,
                    text: Text(S.of(context).contributors),
                    rightWidget: FutureBuilder<int>(
                      future: contributionFuture,
                      builder: (context, snapshot) {
                        return Text(snapshot.data?.toString() ?? '');
                      },
                    ),
                    url: '/github/$owner/$name/contributors',
                  )
                ],
              ],
            ),
            MarkdownView(readmeData),
          ],
        );
      },
    );
  }
}
