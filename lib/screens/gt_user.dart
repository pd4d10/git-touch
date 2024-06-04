import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/contribution.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GtUserScreenPayload {
  GiteaOrg? org;
  late List<GiteaRepository> orgRepos;
  int? orgRepoCount;
  GiteaUser? user;
  late List<GiteaRepository> userRepos;
  int? userRepoCount;
  List<List<ContributionDay>>? userHeatmap;
}

class GtUserScreen extends StatelessWidget {
  const GtUserScreen(this.login, {this.isViewer = true});
  final String login;
  final bool isViewer;

  static List<List<ContributionDay>> normalizeHeatmap(List userHeatmap) {
    final heatmapItems = [
      for (final v in userHeatmap) GiteaHeatmapItem.fromJson(v)
    ];
    final heatmapWeeks = <List<ContributionDay>>[[]];
    for (var i = 0; i < heatmapItems.length; i++) {
      if (i > 0 &&
          heatmapItems[i].timestamp! - heatmapItems[i - 1].timestamp! > 86400) {
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
    return heatmapWeeks;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GtUserScreenPayload>(
      title: Text(isViewer ? 'Me' : login),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final res = await Future.wait([
          auth.fetchGitea('/orgs/$login'),
          auth.fetchGiteaWithPage('/orgs/$login/repos', limit: 6),
          auth.fetchGitea(isViewer ? '/user' : '/users/$login'),
          auth.fetchGiteaWithPage(
              isViewer ? '/user/repos' : '/users/$login/repos',
              limit: 6),
          auth.fetchGitea('/users/$login/heatmap'),
        ]);
        final org = res[0];

        final payload = GtUserScreenPayload();
        // user api also returns data for org, use org api here.
        if (org['message'] == null) {
          // org
          payload.org = GiteaOrg.fromJson(org);
          final orgReposData = res[3] as DataWithPage;
          payload.orgRepos = [
            for (var v in orgReposData.data) GiteaRepository.fromJson(v)
          ];
          payload.orgRepoCount = orgReposData.total;
        } else {
          // user
          payload.user = GiteaUser.fromJson(res[2]);
          final userRepoData = res[3] as DataWithPage;
          payload.userRepos = [
            for (var v in userRepoData.data) GiteaRepository.fromJson(v)
          ];
          payload.userRepoCount = userRepoData.total;
          payload.userHeatmap = normalizeHeatmap(res[4]);
        }
        return payload;
      },
      action: isViewer
          ? const ActionEntry(
              iconData: Ionicons.cog,
              url: '/settings',
            )
          : null,
      bodyBuilder: (p, _) {
        if (p.user != null) {
          return Column(
            children: <Widget>[
              UserHeader(
                login: p.user!.login,
                avatarUrl: p.user!.avatarUrl,
                name: p.user!.fullName,
                createdAt: p.user!.created,
                isViewer: isViewer,
                bio: '',
              ),
              CommonStyle.border,
              Row(children: [
                EntryItem(
                  count: p.userRepoCount!,
                  text: 'Repositories',
                  url: '/gitea/$login?tab=repositories',
                ),
                EntryItem(
                  text: 'Stars',
                  url: '/gitea/$login?tab=stars',
                ),
                EntryItem(
                  text: 'Followers',
                  url: '/gitea/$login?tab=followers',
                ),
                EntryItem(
                  text: 'Following',
                  url: '/gitea/$login?tab=following',
                ),
              ]),
              ContributionWidget(weeks: p.userHeatmap),
              CommonStyle.border,
              AntList(
                children: [
                  AntListItem(
                    prefix: const Icon(Octicons.home),
                    child: const Text('Organizations'),
                    onClick: () {
                      context.push('/gitea/$login?tab=organizations');
                    },
                  ),
                ],
              ),
              CommonStyle.border,
              Column(
                children: <Widget>[
                  for (var v in p.userRepos)
                    RepoItem(
                      owner: v.owner!.login,
                      avatarUrl: v.owner!.avatarUrl,
                      name: v.name,
                      description: v.description,
                      starCount: v.starsCount,
                      forkCount: v.forksCount,
                      note: 'Updated ${timeago.format(v.updatedAt!)}',
                      url: '/gitea/${v.owner!.login}/${v.name}',
                      avatarLink: '/gitea/${v.owner!.login}',
                    )
                ],
              ),
            ],
          );
        } else if (p.org != null) {
          return Column(
            children: <Widget>[
              UserHeader(
                login: p.org!.username,
                avatarUrl: p.org!.avatarUrl,
                name: p.org!.fullName,
                createdAt: null,
                bio: p.org!.description,
              ),
              CommonStyle.border,
              Row(children: [
                EntryItem(
                  count: p.orgRepoCount,
                  text: 'Repositories',
                  url: '/gitea/$login?tab=orgrepo',
                ),
                EntryItem(
                  text: 'Members',
                  url: '/gitea/$login?tab=people',
                ),
              ]),
              CommonStyle.border,
              CommonStyle.border,
              Column(
                children: <Widget>[
                  for (var v in p.orgRepos)
                    RepoItem(
                      owner: v.owner!.login,
                      avatarUrl: v.owner!.avatarUrl,
                      name: v.name,
                      description: v.description,
                      starCount: v.starsCount,
                      forkCount: v.forksCount,
                      note: 'Updated ${timeago.format(v.updatedAt!)}',
                      url: '/gitea/${v.owner!.login}/${v.name}',
                      avatarLink: '/gitea/${v.owner!.login}',
                    )
                ],
              )
            ],
          );
        } else {
          return const Text('404'); // TODO:
        }
      },
    );
  }
}
