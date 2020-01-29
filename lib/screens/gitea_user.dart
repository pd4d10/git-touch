import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GiteaUserScreen extends StatelessWidget {
  final String login;
  GiteaUserScreen(this.login);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple2<GiteaUser, Iterable<GiteaRepository>>>(
      title: Text(login == null ? 'Me' : 'User'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);
        final u = login ?? auth.activeAccount.login;
        final items = await Future.wait([
          auth.fetchGitea('/users/$u'),
          auth.fetchGitea('/users/$u/repos'),
        ]);
        return Tuple2(
          GiteaUser.fromJson(items[0]),
          (items[1] as List).map((v) => GiteaRepository.fromJson(v)),
        );
      },
      bodyBuilder: (data, _) {
        final user = data.item1;
        final repos = data.item2;

        return Column(
          children: <Widget>[
            UserItem(
              login: user.login,
              avatarUrl: user.avatarUrl,
              name: user.fullName,
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
                    url: '', // TODO:
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
