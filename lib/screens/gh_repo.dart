import 'package:antd_mobile/antd_mobile.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/language_bar.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/mutation_button.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:github/github.dart';
import 'package:go_router/go_router.dart';
import 'package:gql_github/repo.data.gql.dart';
import 'package:gql_github/repo.req.gql.dart';
import 'package:gql_github/schema.schema.gql.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:universal_io/io.dart';

class GhRepoScreen extends StatelessWidget {
  const GhRepoScreen(this.owner, this.name, {this.branch});
  final String owner;
  final String name;
  final String? branch;

  String _buildWatchState(GSubscriptionState? state) {
    switch (state) {
      case GSubscriptionState.IGNORED:
        return 'Ignoring';
      case GSubscriptionState.SUBSCRIBED:
        return 'Watching';
      case GSubscriptionState.UNSUBSCRIBED:
        return 'Not watching';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return RefreshStatefulScaffold<
        Tuple3<GRepoData_repository?, Future<int>, MarkdownViewData>>(
      title: Text(AppLocalizations.of(context)!.repository),
      fetch: () async {
        final req = GRepoReq((b) => b
          ..vars.owner = owner
          ..vars.name = name
          ..vars.branchSpecified = branch != null
          ..vars.branch = branch ?? '');
        final res =
            await context.read<AuthModel>().ghGqlClient.request(req).first;
        final repo = res.data!.repository;

        final ghClient = context.read<AuthModel>().ghClient;
        final countFuture = ghClient
            .getJSON('/repos/$owner/$name/stats/contributors')
            .then((v) => (v as List).length);

        readmeFactory(String acceptHeader) {
          return () {
            return ghClient.request(
              'GET',
              '/repos/$owner/$name/readme',
              headers: {HttpHeaders.acceptHeader: acceptHeader},
            ).then((res) {
              return res.body;
            }).catchError((err) {
              // 404
              return '';
            });
          };
        }

        final readmeData = MarkdownViewData(
          context,
          md: readmeFactory('application/vnd.github.v3.raw'),
          html: readmeFactory('application/vnd.github.v3.html'),
        );

        return Tuple3(repo, countFuture, readmeData);
      },
      actionBuilder: (data, _) {
        final repo = data.item1!;
        return ActionButton(
          title: AppLocalizations.of(context)!.repositoryActions,
          items: ActionItem.getUrlActions(repo.url),
        );
      },
      bodyBuilder: (data, setData) {
        final repo = data.item1!;
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
                          GSubscriptionState.SUBSCRIBED,
                      text: _buildWatchState(repo.viewerSubscription),
                      onTap: () async {
                        theme.showActions(context, [
                          for (var v in GSubscriptionState.values)
                            ActionItem(
                              text: _buildWatchState(v),
                              onTap: (_) async {
                                final activityApi =
                                    context.read<AuthModel>().ghClient.activity;
                                switch (v) {
                                  case GSubscriptionState.SUBSCRIBED:
                                  case GSubscriptionState.IGNORED:
                                    await activityApi.setRepositorySubscription(
                                      RepositorySlug(
                                          repo.owner.login, repo.name),
                                      subscribed:
                                          v == GSubscriptionState.SUBSCRIBED,
                                      ignored: v == GSubscriptionState.IGNORED,
                                    );
                                    break;
                                  case GSubscriptionState.UNSUBSCRIBED:
                                    await activityApi
                                        .deleteRepositorySubscription(
                                      RepositorySlug(
                                        repo.owner.login,
                                        repo.name,
                                      ),
                                    );
                                    break;
                                  default:
                                }

                                setData(data.withItem1(repo.rebuild((b) {
                                  b.viewerSubscription = v;
                                })));
                              },
                            )
                        ]);
                      },
                    ),
                    const SizedBox(width: 8),
                    MutationButton(
                      active: repo.viewerHasStarred,
                      text: repo.viewerHasStarred ? 'Unstar' : 'Star',
                      onTap: () async {
                        final activityApi =
                            context.read<AuthModel>().ghClient.activity;
                        if (repo.viewerHasStarred) {
                          await activityApi.unstar(
                              RepositorySlug(repo.owner.login, repo.name));
                        } else {
                          await activityApi.star(
                              RepositorySlug(repo.owner.login, repo.name));
                        }
                        setData(data.withItem1(repo.rebuild((b) {
                          b.viewerHasStarred = !repo.viewerHasStarred;
                        })));
                      },
                    ),
                  ],
                ),
              ],
              trailings: <Widget>[
                if (repo.repositoryTopics.nodes!.isNotEmpty)
                  // TODO: link
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      for (final node in repo.repositoryTopics.nodes!)
                        AntTag(
                          color: PrimerColors.blue500,
                          fill: AntTagFill.outline,
                          round: true,
                          child: Text(node.topic.name),
                        )
                    ],
                  )
              ],
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  count: repo.watchers.totalCount,
                  text: AppLocalizations.of(context)!.watchers,
                  url: '/github/$owner/$name/watchers',
                ),
                EntryItem(
                  count: repo.stargazers.totalCount,
                  text: AppLocalizations.of(context)!.stars,
                  url: '/github/$owner/$name/stargazers',
                ),
                EntryItem(
                  count: repo.forks.totalCount,
                  text: AppLocalizations.of(context)!.forks,
                  url: 'https://github.com/$owner/$name/network/members',
                ),
              ],
            ),
            if (repo.languages?.edges != null) ...[
              CommonStyle.border,
              LanguageBar([
                for (var edge in repo.languages!.edges!)
                  LanguageBarItem(
                    name: edge.node.name,
                    ratio: edge.size / repo.languages!.totalSize,
                    hexColor: edge.node.color,
                  )
              ]),
            ],
            AntList(
              children: [
                if (ref != null)
                  AntListItem(
                    prefix: const Icon(Octicons.code),
                    extra: Text(
                      [
                        repo.primaryLanguage?.name,
                        license,
                        repo.diskUsage == null
                            ? null
                            : filesize(repo.diskUsage! * 1000)
                      ].where((e) => e != null).join(' • '),
                    ),
                    onClick: () {
                      context.push('/github/$owner/$name/blob/${ref.name}');
                    },
                    child: const Text('Code'),
                  ),
                if (repo.hasIssuesEnabled)
                  AntListItem(
                    prefix: const Icon(Octicons.issue_opened),
                    extra: Text(
                        '${numberFormat.format(repo.issuesOpen.totalCount)} / ${numberFormat.format(repo.issues.totalCount)}'),
                    onClick: () {
                      context.push('/github/$owner/$name/issues');
                    },
                    child: Text(AppLocalizations.of(context)!.issues),
                  ),
                AntListItem(
                  prefix: const Icon(Octicons.git_pull_request),
                  extra: Text(
                      '${numberFormat.format(repo.pullRequestsOpen.totalCount)} / ${numberFormat.format(repo.pullRequests.totalCount)}'),
                  onClick: () {
                    context.push('/github/$owner/$name/pulls');
                  },
                  child: Text(AppLocalizations.of(context)!.pullRequests),
                ),
                if (repo.discussions.totalCount > 0)
                  AntListItem(
                    prefix: const Icon(Octicons.comment_discussion),
                    extra:
                        Text(numberFormat.format(repo.discussions.totalCount)),
                    onClick: () {
                      context.pushUrl(
                          'https://github.com/$owner/$name/discussions'); // TODO: discussions screen
                    },
                    child: const Text('Discussions'),
                  ),
                if (repo.hasProjectsEnabled && repo.projects.totalCount > 0)
                  AntListItem(
                    prefix: const Icon(Octicons.project),
                    extra: Text(numberFormat.format(repo.projects.totalCount)),
                    onClick: () {
                      context.pushUrl(repo.projectsUrl);
                    },
                    child: Text(AppLocalizations.of(context)!.projects),
                  ),
              ],
            ),
            CommonStyle.verticalGap,
            AntList(
              children: [
                if (ref != null) ...[
                  AntListItem(
                    prefix: const Icon(Octicons.history),
                    extra: Text(
                        ((ref.target as GCommitParts).history.totalCount)
                            .toString()),
                    onClick: () {
                      context.push('/github/$owner/$name/commits/${ref.name}');
                    },
                    child: Text(AppLocalizations.of(context)!.commits),
                  ),
                  if (repo.refs != null)
                    AntListItem(
                      prefix: const Icon(Octicons.git_branch),
                      extra: Text(
                          '${ref.name} • ${numberFormat.format(repo.refs!.totalCount)}'),
                      onClick: () async {
                        final refs = repo.refs!.nodes!;
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
                                context.pushUrl('/github/$owner/$name?ref=$ref',
                                    replace: true);
                              }
                            },
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.branches),
                    ),
                ],
                AntListItem(
                  prefix: const Icon(Octicons.people),
                  extra: FutureBuilder<int>(
                    future: contributionFuture,
                    builder: (context, snapshot) {
                      return Text(snapshot.data?.toString() ?? '');
                    },
                  ),
                  onClick: () {
                    context.push('/github/$owner/$name/contributors');
                  },
                  child: Text(AppLocalizations.of(context)!.contributors),
                ),
                if (repo.releases.totalCount > 0)
                  AntListItem(
                    prefix: const Icon(Octicons.book),
                    onClick: () {
                      context.push('/github/$owner/$name/releases');
                    },
                    extra: Text(repo.releases.totalCount.toString()),
                    child: Text(AppLocalizations.of(context)!.releases),
                  ),
              ],
            ),
            MarkdownView(readmeData),
          ],
        );
      },
    );
  }
}
