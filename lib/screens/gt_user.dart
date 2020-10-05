import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/contribution.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:timeago/timeago.dart' as timeago;

class GtUserScreen extends StatelessWidget {
  final String login;
  GtUserScreen(this.login);
  bool get isViewer => login == null;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple3<GiteaUser, List<GiteaRepository>, List<List<ContributionDay>>>>(
      title: Text(isViewer ? 'Me' : 'User'),
      fetchData: () async {
        final auth = context.read<AuthModel>();
        final res = await Future.wait([
          auth.fetchGitea(isViewer ? '/user' : '/users/$login'),
          auth.fetchGitea(isViewer ? '/user/repos' : '/users/$login/repos'),
          auth.fetchGitea(
              '/users/${login ?? auth.activeAccount.login}/heatmap'),
        ]);
        final heatmapItems = [
          for (final v in res[2]) GiteaHeatmapItem.fromJson(v)
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

        return Tuple3(
          GiteaUser.fromJson(res[0]),
          [for (var v in res[1]) GiteaRepository.fromJson(v)],
          heatmapWeeks,
        );
      },
      action: isViewer
          ? ActionEntry(
              iconData: Icons.settings,
              url: '/settings',
            )
          : null,
      bodyBuilder: (data, _) {
        final user = data.item1;
        final repos = data.item2;
        final heatmapWeeks = data.item3;

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
      },
    );
  }
}
