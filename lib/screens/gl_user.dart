import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../generated/l10n.dart';

class GlUserScreen extends StatelessWidget {
  final int id;
  GlUserScreen(this.id);
  bool get isViewer => id == null;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GitlabUser, Iterable<GitlabProject>>>(
      title: Text(isViewer ? S.of(context).me : S.of(context).user),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final _id = id ?? auth.activeAccount.gitlabId;
        final res = await Future.wait([
          auth.fetchGitlab('/users/$_id'),
          auth.fetchGitlab('/users/$_id/projects'),
        ]);
        return Tuple2(
          GitlabUser.fromJson(res[0]),
          [for (var v in res[1]) GitlabProject.fromJson(v)],
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
        final projects = data.item2;

        return Column(
          children: <Widget>[
            UserHeader(
              login: user.username,
              avatarUrl: user.avatarUrl,
              name: user.name,
              createdAt: user.createdAt,
              bio: user.bio,
              isViewer: isViewer,
            ),
            CommonStyle.border,
            Column(
              children: <Widget>[
                for (var v in projects)
                  RepositoryItem.gl(
                    payload: v,
                    note: 'Updated ${timeago.format(v.lastActivityAt)}',
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
