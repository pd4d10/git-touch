import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:timeago/timeago.dart' as timeago;

class GtOrgScreen extends StatelessWidget {
  final String login;
  GtOrgScreen(this.login);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GiteaOrg, List<GiteaRepository>>>(
      title: Text(login),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);
        final res = await Future.wait([
          auth.fetchGitea('/orgs/$login'),
          auth.fetchGitea('/orgs/$login/repos'),
        ]);
        return Tuple2(
          GiteaOrg.fromJson(res[0]),
          [for (var v in res[1]) GiteaRepository.fromJson(v)],
        );
      },
      bodyBuilder: (data, _) {
        final org = data.item1;
        final repos = data.item2;

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
      },
    );
  }
}
