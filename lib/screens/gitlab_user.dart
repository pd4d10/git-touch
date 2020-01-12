import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:git_touch/utils/utils.dart';

final gitlabUserRouter = RouterScreen(
    '/gitlab/user/:id',
    (context, parameters) =>
        GitlabUserScreen(int.parse(parameters['id'].first)));

class GitlabUserScreen extends StatelessWidget {
  final int id;

  GitlabUserScreen(this.id);

  static _getGitlabIcon(String visibility) {
    switch (visibility) {
      case 'internal':
        return FontAwesome.shield;
      case 'public':
        return FontAwesome.globe;
      case 'private':
        return FontAwesome.lock;
      default:
        return Octicons.repo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple2<GitlabUser, Iterable<GitlabUserProject>>>(
      title: Text('User'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);

        final v0 = await auth.fetchGitlab('/users/$id');
        final user = GitlabUser.fromJson(v0);
        final v1 = await auth.fetchGitlab('/users/$id/projects');
        final projects =
            (v1 as List).map((v) => GitlabUserProject.fromJson(v)).toList();

        return Tuple2(user, projects);
      },
      bodyBuilder: (data, _) {
        final user = data.item1;
        final projects = data.item2;

        return Column(
          children: <Widget>[
            UserItem(
              login: user.username,
              avatarUrl: user.avatarUrl,
              name: user.name,
            ),
            CommonStyle.border,
            Column(
              children: projects.map((v) {
                return RepositoryItem(
                  v.owner.name,
                  v.owner.avatarUrl,
                  v.name,
                  v.description,
                  v.starCount,
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
