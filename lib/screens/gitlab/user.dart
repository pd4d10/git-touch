import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/border_view.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GitlabUserScreen extends StatelessWidget {
  final String username;

  GitlabUserScreen(this.username);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple3<GitlabUser, Iterable<GitlabRepository>,
            List<Map<String, double>>>>(
      title: Text('User'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);

        final v0 = await auth.fetchGitlab('/users?username=$username');
        final user = GitlabUser.fromJson(v0[0]);

        final v1 = await auth.fetchGitlab('/users/${user.id}/projects');
        final projects = (v1 as List).map((v) => GitlabRepository.fromJson(v));

        final languages = await Future.wait(projects
            .map((p) => auth.fetchGitlab('/projects/${p.id}/languages')));

        return Tuple3(user, projects, languages.cast<Map<String, double>>());
      },
      bodyBuilder: (data, _) {
        final user = data.item1;
        final projects = data.item2;
        final languages = data.item3;

        return Column(
          children: <Widget>[
            UserItem(
              login: user.username,
              avatarUrl: user.avatarUrl,
              name: user.name,
            ),
            BorderView(height: 10),
            Column(
              children: projects.map((project) {
                return RepositoryItem.gitlab(project);
              }).toList(),
            )
          ],
        );
      },
    );
  }
}
