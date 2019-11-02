import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/border_view.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';

class GitlabUserScreen extends StatelessWidget {
  final String username;

  GitlabUserScreen(this.username);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: Text('User'),
      fetchData: () async {
        final items = await Provider.of<AuthModel>(context)
            .fetchGitlab('/users?username=$username');
        final user = items[0];
        final projects = await Provider.of<AuthModel>(context)
            .fetchGitlab('/users/${user['id']}/projects') as List;
        final langs = await Future.wait(projects.map((p) =>
            Provider.of<AuthModel>(context)
                .fetchGitlab('/projects/${p['id']}/languages')));
        for (var i = 0; i < projects.length; i++) {
          projects[i]['language'] = langs[i];
        }
        return [user, projects];
      },
      bodyBuilder: (payload) {
        final data = payload.data[0];
        final projects = payload.data[1] as List;

        return Column(
          children: <Widget>[
            UserItem(
              login: data['username'],
              avatarUrl: data['avatar_url'],
              name: data['name'],
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
