import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:tuple/tuple.dart';

class GlUserScreen extends StatelessWidget {
  const GlUserScreen(this.id);
  final int? id;
  bool get isViewer => id == null;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GitlabUser, Iterable<GitlabProject>>>(
      title: Text(isViewer
          ? AppLocalizations.of(context)!.me
          : AppLocalizations.of(context)!.user),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final finalId = id ?? auth.activeAccount!.gitlabId;
        final res = await Future.wait([
          auth.fetchGitlab('/users/$finalId'),
          auth.fetchGitlab('/users/$finalId/projects'),
        ]);
        return Tuple2(
          GitlabUser.fromJson(res[0]),
          [for (var v in res[1]) GitlabProject.fromJson(v)],
        );
      },
      action: isViewer
          ? const ActionEntry(
              iconData: Ionicons.cog,
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
                  RepoItem.gl(
                    payload: v,
                    note: 'Updated ${timeago.format(v.lastActivityAt!)}',
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
