import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/gh.dart';
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

class GhUserScreen extends StatelessWidget {
  final String login;
  GhUserScreen(this.login);
  bool get isViewer => login == null;

  Iterable<Widget> _buildPinnedItems(Iterable<GhUserRepository> pinnedItems,
      Iterable<GhUserRepository> repositories) {
    String title;
    Iterable<GhUserRepository> items = [];

    if (pinnedItems.isNotEmpty) {
      title = 'pinned repositories';
      items = pinnedItems;
    } else if (repositories.isNotEmpty) {
      title = 'popular repositories';
      items = repositories;
    }
    if (items.isEmpty) return [];

    return [
      if (title != null) TableViewHeader(title),
      ...join(
        CommonStyle.border,
        items.map((v) {
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
    ];
  }

  Widget _buildUser(BuildContext context, GhUserUser p,
      void Function(void Function()) setState) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
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
                  setState(() {
                    p.viewerIsFollowing = !p.viewerIsFollowing;
                  });
                },
              )
          ],
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
        // if (isViewer)
        //   TableView(
        //     hasIcon: true,
        //     items: [
        //       TableViewItem(
        //         leftIconData: Icons.settings,
        //         text: Text('Settings'),
        //         url: '/settings',
        //       ),
        //       TableViewItem(
        //         leftIconData: Icons.info_outline,
        //         text: Text('About'),
        //         url: '/about',
        //       ),
        //     ],
        //   )
        // else
        ..._buildPinnedItems(
            p.pinnedItems.nodes
                .where((n) => n is GhUserRepository)
                .cast<GhUserRepository>(),
            p.repositories.nodes),
        CommonStyle.verticalGap,
      ],
    );
  }

  Widget _buildOrganization(BuildContext context, GhUserOrganization p) {
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
              url: '/github/$login?tab=events',
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
        ..._buildPinnedItems(
          p.pinnedItems.nodes
              .where((n) => n is GhUserRepository)
              .cast<GhUserRepository>(),
          p.pinnableItems.nodes
              .where((n) => n is GhUserRepository)
              .cast<GhUserRepository>(),
        ),
        CommonStyle.verticalGap,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return RefreshStatefulScaffold<GhUserRepositoryOwner>(
      fetch: () async {
        final data = await auth.gqlClient.execute(GhUserQuery(
            variables:
                GhUserArguments(login: login ?? '', isViewer: isViewer)));
        return isViewer ? data.data.viewer : data.data.repositoryOwner;
      },
      title: AppBarTitle(isViewer ? S.of(context).me : login),
      action: isViewer
          ? ActionEntry(
              iconData: Icons.settings,
              url: '/settings',
            )
          : null,
      actionBuilder: isViewer
          ? null
          : (payload, setState) {
              switch (payload.resolveType) {
                case 'User':
                  final user = payload as GhUserUser;
                  return ActionButton(
                    title: 'User Actions',
                    items: [...ActionItem.getUrlActions(user.url)],
                  );
                case 'Organization':
                  final organization = payload as GhUserOrganization;
                  return ActionButton(
                    title: 'Organization Actions',
                    items: [
                      ...ActionItem.getUrlActions(organization.url),
                    ],
                  );
                default:
                  return null;
              }
            },
      bodyBuilder: (payload, setState) {
        if (isViewer) {
          return _buildUser(context, payload as GhUserUser, setState);
        }
        switch (payload.resolveType) {
          case 'User':
            return _buildUser(context, payload as GhUserUser, setState);
          case 'Organization':
            return _buildOrganization(context, payload as GhUserOrganization);
          default:
            return null;
        }
      },
    );
  }
}
