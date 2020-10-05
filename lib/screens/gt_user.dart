import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/contribution.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:timeago/timeago.dart' as timeago;

class GtUserScreenPayload {
  Tuple3<GiteaUser, List<GiteaRepository>, List<List<ContributionDay>>> user;
  Tuple2<GiteaOrg, List<GiteaRepository>> org;
}

class GtUserScreen extends StatelessWidget {
  final String login;
  GtUserScreen(this.login);
  bool get isViewer => login == null;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GtUserScreenPayload>(
      title: Text(login ?? 'Me'),
      fetchData: () async {
        final auth = context.read<AuthModel>();
        final res = await Future.wait([
          auth.fetchGitea(isViewer ? '/user' : '/users/$login'),
          auth.fetchGitea(
              isViewer ? '/user/repos?limit=6' : '/users/$login/repos?limit=6'),
          auth.fetchGitea(
              '/users/${login ?? auth.activeAccount.login}/heatmap'),
          auth.fetchGitea('/orgs/$login'),
          auth.fetchGitea('/orgs/$login/repos'),
        ]);
        final user = res[0];
        final userRepos = res[1];
        final userHeatmap = res[2];
        final org = res[3];
        final orgRepos = res[4];

        final payload = GtUserScreenPayload();
        // user api also returns data for org, use org api here.
        if (org['message'] == null) {
          // org
          payload.org = Tuple2(
            GiteaOrg.fromJson(org),
            [for (var v in orgRepos) GiteaRepository.fromJson(v)],
          );
        } else {
          // user
          final heatmapItems = [
            for (final v in userHeatmap) GiteaHeatmapItem.fromJson(v)
          ];
          List<List<ContributionDay>> heatmapWeeks = [[]];
          for (var i = 0; i < heatmapItems.length; i++) {
            if (i > 0 &&
                heatmapItems[i].timestamp - heatmapItems[i - 1].timestamp >
                    86400) {
              if (heatmapWeeks.last.length == 7) {
                heatmapWeeks.add([]);
              }
              heatmapWeeks.last.add(ContributionDay(count: 0));
            } else {
              if (heatmapWeeks.last.length == 7) {
                heatmapWeeks.add([]);
              }
              heatmapWeeks.last
                  .add(ContributionDay(count: heatmapItems[i].contributions));
            }
          }

          payload.user = Tuple3(
            GiteaUser.fromJson(user),
            [for (var v in userRepos) GiteaRepository.fromJson(v)],
            heatmapWeeks,
          );
        }
        return payload;
      },
      action: isViewer
          ? ActionEntry(
              iconData: Icons.settings,
              url: '/settings',
            )
          : null,
      bodyBuilder: (data, _) {
        if (data.user != null) {
          final user = data.user.item1;
          final repos = data.user.item2;
          final heatmapWeeks = data.user.item3;

          return Column(
            children: <Widget>[
              UserHeader(
                login: user.login,
                avatarUrl: user.avatarUrl,
                name: user.fullName,
                createdAt: user.created,
                bio: '',
              ),
              CommonStyle.border,
              Row(children: [
                EntryItem(
                  count: 0, // TODO: count
                  text: 'Repositories',
                  url: '/gitea/$login?tab=repositories',
                ),
                EntryItem(
                  count: 0,
                  text: 'Stars',
                  url: '/gitea/$login?tab=stars',
                ),
              ]),
              ContributionWidget(weeks: heatmapWeeks),
              CommonStyle.border,
              Column(
                children: <Widget>[
                  for (var v in repos)
                    RepositoryItem(
                      owner: v.owner.login,
                      avatarUrl: v.owner.avatarUrl,
                      name: v.name,
                      description: v.description,
                      starCount: v.starsCount,
                      forkCount: v.forksCount,
                      note: 'Updated ${timeago.format(v.updatedAt)}',
                      url: '/gitea/${v.owner.login}/${v.name}',
                      avatarLink: '/gitea/${v.owner.login}',
                    )
                ],
              )
            ],
          );
        } else if (data.org != null) {
          final org = data.org.item1;
          final repos = data.org.item2;

          return Column(
            children: <Widget>[
              UserHeader(
                login: org.username,
                avatarUrl: org.avatarUrl,
                name: org.fullName,
                createdAt: null,
                bio: org.description,
              ),
              CommonStyle.border,
              Column(
                children: <Widget>[
                  for (var v in repos)
                    RepositoryItem(
                      owner: v.owner.login,
                      avatarUrl: v.owner.avatarUrl,
                      name: v.name,
                      description: v.description,
                      starCount: v.starsCount,
                      forkCount: v.forksCount,
                      note: 'Updated ${timeago.format(v.updatedAt)}',
                      url: '/gitea/${v.owner.login}/${v.name}',
                      avatarLink: '/gitea/${v.owner.login}',
                    )
                ],
              )
            ],
          );
        } else {
          return Text('404'); // TODO:
        }
      },
    );
  }
}
