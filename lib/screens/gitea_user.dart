import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:timeago/timeago.dart' as timeago;

final giteaUserRouter = RouterScreen(
  '/gitea/:login',
  (context, params) => GiteaUserScreen(params['login'].first),
);

class GiteaUserScreen extends StatelessWidget {
  final String login;
  GiteaUserScreen(this.login);
  bool get isViewer => login == null;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GiteaUser, List<GiteaRepository>>>(
      title: Text(isViewer ? 'Me' : 'User'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);
        final res = await Future.wait([
          auth.fetchGitea(isViewer ? '/user' : '/users/$login'),
          auth.fetchGitea(isViewer ? '/user/repos' : '/users/$login/repos'),
        ]);
        return Tuple2(
          GiteaUser.fromJson(res[0]),
          [for (var v in res[1]) GiteaRepository.fromJson(v)],
        );
      },
      action: isViewer
          ? ActionEntry(
              iconData: Icons.settings,
              onTap: () {
                final theme = Provider.of<ThemeModel>(context);
                theme.push(context, '/settings');
              },
            )
          : null,
      bodyBuilder: (data, _) {
        final user = data.item1;
        final repos = data.item2;

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
