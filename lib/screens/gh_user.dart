import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/github.data.gql.dart';
import 'package:git_touch/graphql/github.req.gql.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/contribution.dart';
import 'package:git_touch/widgets/mutation_button.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:git_touch/widgets/text_with_at.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/action_button.dart';
import '../generated/l10n.dart';

class _Repos extends StatelessWidget {
  final String title;
  final Iterable<GRepoItem> repos;

  _Repos(final Iterable<GRepoItem> pinned, final Iterable<GRepoItem> repos)
      : title =
            pinned.isNotEmpty ? 'pinned repositories' : 'popular repositories',
        repos = pinned.isNotEmpty ? pinned : repos;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TableViewHeader(title),
        ...join(
          CommonStyle.border,
          repos.map((v) {
            return RepositoryItem.gh(
              owner: v.owner.login,
              avatarUrl: v.owner.avatarUrl,
              name: v.name,
              description: v.description,
              starCount: v.stargazers.totalCount,
              forkCount: v.forks.totalCount,
              primaryLanguageName: v.primaryLanguage?.name,
              primaryLanguageColor: v.primaryLanguage?.color,
              isPrivate: v.isPrivate,
              isFork: v.isFork,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _User extends StatelessWidget {
  final GUserParts p;
  final bool isViewer;
  final List<Widget> rightWidgets;
  const _User(this.p, {this.isViewer = false, this.rightWidgets = const []});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final login = p.login;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        UserHeader(
          avatarUrl: p.avatarUrl,
          name: p.name,
          login: p.login,
          createdAt: p.createdAt,
          bio: p.bio,
          isViewer: isViewer,
          rightWidgets: rightWidgets,
        ),
        CommonStyle.border,
        Row(children: [
          EntryItem(
            count: p.repositories.totalCount,
            text: S.of(context).repositories,
            url: '/github/$login?tab=repositories',
          ),
          EntryItem(
            count: p.starredRepositories.totalCount,
            text: S.of(context).stars,
            url: '/github/$login?tab=stars',
          ),
          EntryItem(
            count: p.followers.totalCount,
            text: S.of(context).followers,
            url: '/github/$login?tab=followers',
          ),
          EntryItem(
            count: p.following.totalCount,
            text: S.of(context).following,
            url: '/github/$login?tab=following',
          ),
        ]),
        CommonStyle.border,
        ContributionWidget(
          weeks: [
            for (final week
                in p.contributionsCollection.contributionCalendar.weeks)
              [
                //  https://github.com/git-touch/git-touch/issues/122
                for (final day in week.contributionDays)
                  ContributionDay(hexColor: day.color)
              ]
          ],
        ),
        CommonStyle.border,
        TableView(
          hasIcon: true,
          items: [
            TableViewItem(
              leftIconData: Icons.rss_feed,
              text: Text(S.of(context).events),
              url: '/github/$login?tab=events',
            ),
            TableViewItem(
              leftIconData: Octicons.book,
              text: Text(S.of(context).gists),
              url: '/github/$login?tab=gists',
            ),
            TableViewItem(
              leftIconData: Octicons.home,
              text: Text(S.of(context).organizations),
              url: '/github/$login?tab=organizations',
            ),
            if (isNotNullOrEmpty(p.company))
              TableViewItem(
                leftIconData: Octicons.organization,
                text: TextWithAt(
                  text: p.company,
                  linkFactory: (text) => '/github/' + text.substring(1),
                  style: TextStyle(fontSize: 17, color: theme.palette.text),
                  oneLine: true,
                ),
              ),
            if (isNotNullOrEmpty(p.location))
              TableViewItem(
                leftIconData: Octicons.location,
                text: Text(p.location),
                onTap: () {
                  launchUrl('https://www.google.com/maps/place/' +
                      p.location.replaceAll(RegExp(r'\s+'), ''));
                },
              ),
            if (isNotNullOrEmpty(p.email))
              TableViewItem(
                leftIconData: Octicons.mail,
                text: Text(p.email),
                onTap: () {
                  launchUrl('mailto:' + p.email);
                },
              ),
            if (isNotNullOrEmpty(p.websiteUrl))
              TableViewItem(
                leftIconData: Octicons.link,
                text: Text(p.websiteUrl),
                onTap: () {
                  var url = p.websiteUrl;
                  if (!url.startsWith('http')) {
                    url = 'http://$url';
                  }
                  launchUrl(url);
                },
              ),
          ],
        ),
        CommonStyle.verticalGap,
        _Repos(
          p.pinnedItems.nodes.whereType<GRepoItem>(),
          p.repositories.nodes,
        ),
        CommonStyle.verticalGap,
      ],
    );
  }
}

class _Org extends StatelessWidget {
  final GUserData_repositoryOwner__asOrganization p;
  _Org(this.p);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        UserHeader(
          avatarUrl: p.avatarUrl,
          name: p.name,
          login: p.login,
          createdAt: p.createdAt,
          bio: p.description,
        ),
        CommonStyle.border,
        Row(children: [
          EntryItem(
            count: p.pinnableItems.totalCount,
            text: S.of(context).repositories,
            url: '/github/${p.login}?tab=orgrepo',
          ),
          EntryItem(
            count: p.membersWithRole.totalCount,
            text: S.of(context).members,
            url: '/github/${p.login}?tab=people',
          ),
        ]),
        TableView(
          hasIcon: true,
          items: [
            TableViewItem(
              leftIconData: Icons.rss_feed,
              text: Text(S.of(context).events),
              url: '/github/${p.login}?tab=events',
            ),
            if (isNotNullOrEmpty(p.location))
              TableViewItem(
                leftIconData: Octicons.location,
                text: Text(p.location),
                onTap: () {
                  launchUrl('https://www.google.com/maps/place/' +
                      p.location.replaceAll(RegExp(r'\s+'), ''));
                },
              ),
            if (isNotNullOrEmpty(p.email))
              TableViewItem(
                leftIconData: Octicons.mail,
                text: Text(p.email),
                onTap: () {
                  launchUrl('mailto:' + p.email);
                },
              ),
            if (isNotNullOrEmpty(p.websiteUrl))
              TableViewItem(
                leftIconData: Octicons.link,
                text: Text(p.websiteUrl),
                onTap: () {
                  var url = p.websiteUrl;
                  if (!url.startsWith('http')) {
                    url = 'http://$url';
                  }
                  launchUrl(url);
                },
              ),
          ],
        ),
        CommonStyle.verticalGap,
        _Repos(
          p.pinnedItems.nodes.whereType<GRepoItem>(),
          p.pinnableItems.nodes.whereType<GRepoItem>(),
        ),
        CommonStyle.verticalGap,
      ],
    );
  }
}

class GhViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return RefreshStatefulScaffold<GUserParts>(
      fetch: () async {
        final req = GViewerReq();
        final res = await auth.gqlClient.request(req).first;
        return res.data.viewer;
      },
      title: AppBarTitle(S.of(context).me),
      action: ActionEntry(
        iconData: Icons.settings,
        url: '/settings',
      ),
      bodyBuilder: (p, _) {
        return _User(p, isViewer: true);
      },
    );
  }
}

class GhUser extends StatelessWidget {
  final String login;
  GhUser(this.login);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return RefreshStatefulScaffold<GUserData>(
      fetch: () async {
        final req = GUserReq((b) => b..vars.login = login);
        final res = await auth.gqlClient.request(req).first;
        return res.data;
      },
      title: AppBarTitle(login),
      actionBuilder: (payload, _) {
        return ActionButton(
          title: 'User Actions',
          items: ActionItem.getUrlActions(payload.repositoryOwner.url),
        );
      },
      bodyBuilder: (data, setData) {
        if (data.repositoryOwner.G__typename == 'User') {
          final p = data.repositoryOwner as GUserData_repositoryOwner__asUser;
          return _User(
            p,
            rightWidgets: [
              if (p.viewerCanFollow)
                MutationButton(
                  active: p.viewerIsFollowing,
                  text: p.viewerIsFollowing
                      ? S.of(context).unfollow
                      : S.of(context).follow,
                  onTap: () async {
                    if (p.viewerIsFollowing) {
                      await auth.ghClient.users.unfollowUser(p.login);
                    } else {
                      await auth.ghClient.users.followUser(p.login);
                    }
                    setData(data.rebuild((b) {
                      final u = b.repositoryOwner
                          as GUserData_repositoryOwner__asUser;
                      b.repositoryOwner = u.rebuild((b1) {
                        b1.viewerIsFollowing = !b1.viewerIsFollowing;
                      });
                    }));
                  },
                )
            ],
          );
        } else {
          return _Org(data.repositoryOwner
              as GUserData_repositoryOwner__asOrganization);
        }
      },
    );
  }
}
