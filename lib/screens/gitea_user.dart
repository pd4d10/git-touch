import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/border_view.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GiteaUserScreen extends StatelessWidget {
  final String username;

  GiteaUserScreen(this.username);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple2<GiteaUser, Iterable<GiteaRepository>>>(
      title: Text('User'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);
        final items = await Future.wait([
          auth.fetchGitea('/users/$username'),
          auth.fetchGitea('/users/$username/repos'),
        ]);
        return Tuple2(GiteaUser.fromJson(items[0]),
            (items[1] as List).map((v) => GiteaRepository.fromJson(v)));
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
            BorderView(height: 10),
            Column(
              children: repos.map((v) {
                return RepositoryItem(
                  v.owner.login,
                  v.owner.avatarUrl,
                  v.name,
                  v.description,
                  v.starsCount,
                  v.forksCount,
                  null,
                  null,
                  null,
                );
              }).toList(),
            )
          ],
        );
      },
    );
  }
}
