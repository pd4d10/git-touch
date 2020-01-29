import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

final gitlabUserRouter = RouterScreen(
    '/gitlab/user/:id',
    (context, parameters) =>
        GitlabUserScreen(int.parse(parameters['id'].first)));

class GitlabUserScreen extends StatelessWidget {
  final int id;
  GitlabUserScreen(this.id);
  bool get isViewer => id == null;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple2<GitlabUser, Iterable<GitlabUserProject>>>(
      title: Text(isViewer ? 'Me' : 'User'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);
        final _id = id ?? auth.activeAccount.gitlabId;
        final v0 = await auth.fetchGitlab('/users/$_id');
        final user = GitlabUser.fromJson(v0);
        final v1 = await auth.fetchGitlab('/users/$_id/projects');
        final projects =
            (v1 as List).map((v) => GitlabUserProject.fromJson(v)).toList();

        return Tuple2(user, projects);
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
        final projects = data.item2;

        return Column(
          children: <Widget>[
            UserHeader(
              login: user.username,
              avatarUrl: user.avatarUrl,
              name: user.name,
              createdAt: user.createdAt,
              bio: user.bio,
            ),
            CommonStyle.border,
            Column(
              children: <Widget>[
                for (var v in projects)
                  RepositoryItem.gl(
                    id: v.id,
                    owner: v.owner.username,
                    avatarUrl: v.owner.avatarUrl,
                    name: v.name,
                    description: v.description,
                    starCount: v.starCount,
                    forkCount: v.forksCount,
                    note: 'Created ${timeago.format(v.createdAt)}',
                    visibility: v.visibility,
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
