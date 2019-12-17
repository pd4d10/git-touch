import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/github_me.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:git_touch/widgets/text_contains_organization.dart';
import 'package:git_touch/widgets/user_contributions.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:github_contributions/github_contributions.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class MeScreen extends StatelessWidget {
  MeScreen();

  Future<GithubMeUser> _query(BuildContext context) async {
    final data = await Provider.of<AuthModel>(context)
        .gqlClient
        .execute(GithubMeQuery());
    return data.data.viewer;
  }

  Future<List<ContributionsInfo>> _fetchContributions(
      BuildContext context) async {
    final login = Provider.of<AuthModel>(context).activeAccount.login;
    return getContributions(login);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple2<GithubMeUser, List<ContributionsInfo>>>(
      fetchData: () async {
        final vs = await Future.wait([
          _query(context),
          _fetchContributions(context),
        ]);
        return Tuple2(vs[0] as GithubMeUser, vs[1] as List<ContributionsInfo>);
      },
      title: AppBarTitle('Me'),
      bodyBuilder: (data, _) {
        final user = data.item1;
        final contributions = data.item2;

        final theme = Provider.of<ThemeModel>(context);
        final login = user.login;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserItem(
              login: user.login,
              name: user.name,
              avatarUrl: user.avatarUrl,
              bio: user.bio,
              inUserScreen: true,
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
            CommonStyle.verticalGap,
            UserContributions(contributions),
            CommonStyle.verticalGap,
            TableView(
              hasIcon: true,
              items: [
                if (isNotNullOrEmpty(user.company))
                  TableViewItem(
                    leftIconData: Octicons.organization,
                    text: TextContainsOrganization(
                      user.company,
                      style: TextStyle(fontSize: 16, color: theme.palette.text),
                      overflow: TextOverflow.ellipsis,
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
            TableView(
              hasIcon: true,
              items: [
                TableViewItem(
                  leftIconData: Octicons.settings,
                  text: Text('Settings'),
                  url: '/settings',
                ),
              ],
            ),
            CommonStyle.verticalGap,
          ],
        );
      },
    );
  }
}
