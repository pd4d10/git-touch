import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/screens/repositories.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:git_touch/widgets/text_contains_organization.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/action_button.dart';

final userRouter = RouterScreen(
  '/:login',
  (context, parameters) {
    final login = parameters['login'].first;
    final tab = parameters['tab']?.first;
    switch (tab) {
      case 'followers':
        return UsersScreen(login, UsersScreenType.follower);
      case 'following':
        return UsersScreen(login, UsersScreenType.following);
      case 'people':
        return UsersScreen(login, UsersScreenType.member);
      case 'stars':
        return RepositoriesScreen.stars(login);
      case 'repositories':
        return RepositoriesScreen(login);
      default:
        return UserScreen(login);
    }
  },
);

class UserScreen extends StatelessWidget {
  final String login;

  UserScreen(this.login);

  bool get isViewer => login.isEmpty;

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
            v.owner.login,
            v.owner.avatarUrl,
            v.name,
            v.description,
            v.stargazers.totalCount,
            v.forks.totalCount,
            v.primaryLanguage?.name,
            v.primaryLanguage?.color,
            null,
            isPrivate: v.isPrivate,
            isFork: v.isFork,
          );
        }).toList(),
      ),
    ];
  }

  Widget _buildHeader(BuildContext context, String avatarUrl, String name,
      String login, DateTime createdAt, String bio,
      {Widget followWidget}) {
    final theme = Provider.of<ThemeModel>(context);

    return Container(
      padding: CommonStyle.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Avatar(url: avatarUrl, size: AvatarSize.large),
              if (followWidget != null) ...[
                Expanded(child: Container()),
                followWidget,
              ]
            ],
          ),
          SizedBox(height: 8),
          if (name != null) ...[
            Text(
              name,
              style: TextStyle(
                color: theme.palette.primary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
          ],
          Text(
            login,
            style: TextStyle(
              color: theme.palette.secondaryText,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Icon(
                Octicons.clock,
                size: 16,
                color: theme.palette.tertiaryText,
              ),
              SizedBox(width: 4),
              Text(
                'Joined on ${dateFormat.format(createdAt)}',
                style: TextStyle(
                  color: theme.palette.tertiaryText,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          if (bio != null && bio.isNotEmpty) ...[
            SizedBox(height: 10),
            Text(
              bio,
              style: TextStyle(
                color: theme.palette.secondaryText,
                fontSize: 17,
              ),
            )
          ]
        ],
      ),
    );
  }

  Widget _buildUser(BuildContext context, GhUserUser user,
      void Function(void Function()) setState) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    final login = user.login;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildHeader(
          context,
          user.avatarUrl,
          user.name,
          user.login,
          user.createdAt,
          user.bio,
          followWidget: user.viewerCanFollow == true
              ? CupertinoButton(
                  onPressed: () async {
                    final res = await auth.gqlClient.execute(
                      GhFollowQuery(
                        variables: GhFollowArguments(
                          id: user.id,
                          flag: !user.viewerIsFollowing,
                        ),
                      ),
                    );
                    setState(() {
                      user.viewerIsFollowing =
                          res.data.unfollowUser?.user?.viewerIsFollowing ??
                              res.data.followUser.user.viewerIsFollowing;
                    });
                  },
                  minSize: 0,
                  color: theme.palette.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Text(
                    user.viewerIsFollowing ? 'Unfollow' : 'Follow',
                    style: TextStyle(fontSize: 17),
                  ),
                )
              : null,
        ),
        CommonStyle.border,
        Row(children: [
          EntryItem(
            count: user.repositories.totalCount,
            text: 'Repositories',
            url: '/$login?tab=repositories',
          ),
          EntryItem(
            count: user.starredRepositories.totalCount,
            text: 'Stars',
            url: '/$login?tab=stars',
          ),
          EntryItem(
            count: user.followers.totalCount,
            text: 'Followers',
            url: '/$login?tab=followers',
          ),
          EntryItem(
            count: user.following.totalCount,
            text: 'Following',
            url: '/$login?tab=following',
          ),
        ]),
        CommonStyle.border,
        Container(
          color: theme.palette.background,
          padding: CommonStyle.padding,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Wrap(
              spacing: 3,
              children: user.contributionsCollection.contributionCalendar.weeks
                  .map((week) {
                return Wrap(
                  direction: Axis.vertical,
                  spacing: 3,
                  children: week.contributionDays.map((day) {
                    var color = convertColor(day.color);
                    if (theme.brightness == Brightness.dark) {
                      color = Color.fromRGBO(0xff - color.red,
                          0xff - color.green, 0xff - color.blue, 1);
                    }
                    return SizedBox(
                      width: 10,
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: color),
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ),
        CommonStyle.border,
        TableView(
          hasIcon: true,
          items: [
            if (isNotNullOrEmpty(user.company))
              TableViewItem(
                leftIconData: Octicons.organization,
                text: TextContainsOrganization(
                  user.company,
                  style: TextStyle(fontSize: 16, color: theme.palette.text),
                  oneLine: true,
                ),
              ),
            if (isNotNullOrEmpty(user.location))
              TableViewItem(
                leftIconData: Octicons.location,
                text: Text(user.location),
                onTap: () {
                  launchUrl('https://www.google.com/maps/place/' +
                      user.location.replaceAll(RegExp(r'\s+'), ''));
                },
              ),
            if (isNotNullOrEmpty(user.email))
              TableViewItem(
                leftIconData: Octicons.mail,
                text: Text(user.email),
                onTap: () {
                  launchUrl('mailto:' + user.email);
                },
              ),
            if (isNotNullOrEmpty(user.websiteUrl))
              TableViewItem(
                leftIconData: Octicons.link,
                text: Text(user.websiteUrl),
                onTap: () {
                  var url = user.websiteUrl;
                  if (!url.startsWith('http')) {
                    url = 'http://$url';
                  }
                  launchUrl(url);
                },
              ),
          ],
        ),
        CommonStyle.verticalGap,
        if (isViewer)
          TableView(
            hasIcon: true,
            items: [
              TableViewItem(
                leftIconData: Octicons.settings,
                text: Text('Settings'),
                url: '/settings',
              ),
              TableViewItem(
                leftIconData: Icons.info,
                text: Text('About'),
                url: '/about',
              ),
            ],
          )
        else
          ..._buildPinnedItems(
              user.pinnedItems.nodes
                  .where((n) => n is GhUserRepository)
                  .cast<GhUserRepository>(),
              user.repositories.nodes),
        CommonStyle.verticalGap,
      ],
    );
  }

  Widget _buildOrganization(BuildContext context, GhUserOrganization payload) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildHeader(context, payload.avatarUrl, payload.name, payload.login,
            payload.createdAt, payload.description),
        CommonStyle.border,
        Row(children: [
          EntryItem(
            count: payload.pinnableItems.totalCount,
            text: 'Repositories',
            url: '/${payload.login}?tab=repositories',
          ),
          EntryItem(
            count: payload.membersWithRole.totalCount,
            text: 'Members',
            url: '/${payload.login}?tab=people',
          ),
        ]),
        TableView(
          hasIcon: true,
          items: [
            if (isNotNullOrEmpty(payload.location))
              TableViewItem(
                leftIconData: Octicons.location,
                text: Text(payload.location),
                onTap: () {
                  launchUrl('https://www.google.com/maps/place/' +
                      payload.location.replaceAll(RegExp(r'\s+'), ''));
                },
              ),
            if (isNotNullOrEmpty(payload.email))
              TableViewItem(
                leftIconData: Octicons.mail,
                text: Text(payload.email),
                onTap: () {
                  launchUrl('mailto:' + payload.email);
                },
              ),
            if (isNotNullOrEmpty(payload.websiteUrl))
              TableViewItem(
                leftIconData: Octicons.link,
                text: Text(payload.websiteUrl),
                onTap: () {
                  var url = payload.websiteUrl;
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
          payload.pinnedItems.nodes
              .where((n) => n is GhUserRepository)
              .cast<GhUserRepository>(),
          payload.pinnableItems.nodes
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
      fetchData: () async {
        final data = await auth.gqlClient.execute(GhUserQuery(
            variables: GhUserArguments(login: login, isViewer: isViewer)));
        return isViewer ? data.data.viewer : data.data.repositoryOwner;
      },
      title: AppBarTitle(isViewer ? 'Me' : login),
      actionBuilder: (payload, setState) {
        switch (payload.resolveType) {
          case 'User':
            final user = payload as GhUserUser;
            return ActionButton(
              title: 'User Actions',
              items: [
                ActionItem.share(user.url),
                ActionItem.launch(user.url),
              ],
            );
          case 'Organization':
            final organization = payload as GhUserOrganization;
            return ActionButton(
              title: 'Organization Actions',
              items: [
                if (payload != null) ...[
                  ActionItem.share(organization.url),
                  ActionItem.launch(organization.url),
                ],
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
