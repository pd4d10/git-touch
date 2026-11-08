import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlStarrersScreen extends StatelessWidget {
  const GlStarrersScreen(this.id);
  final int id;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabStarrer, int>(
      title: Text(AppLocalizations.of(context)!.members),
      fetch: (page) async {
        page = page ?? 1;
        final res = await context
            .read<AuthModel>()
            .fetchGitlabWithPage('/projects/$id/starrers?page=$page');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <GitlabStarrer>[
            for (var v in res.data) GitlabStarrer.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return UserItem.gitlab(
          avatarUrl: v.user!.avatarUrl,
          login: v.user!.username,
          name: v.user!.name,
          bio: Text('Starred ${timeago.format(v.starredSince!)}'),
          id: v.user!.id,
        );
      },
    );
  }
}
