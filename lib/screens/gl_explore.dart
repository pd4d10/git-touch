import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabProject, int>(
      title: Text(AppLocalizations.of(context)!.explore),
      fetch: (page) async {
        page = page ?? 1;
        final auth = context.read<AuthModel>();
        final res = await auth.fetchGitlabWithPage(
            '/projects?order_by=last_activity_at&page=$page');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <GitlabProject>[
            for (var v in res.data) GitlabProject.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return RepoItem.gl(
          payload: v,
          note: 'Updated ${timeago.format(v.lastActivityAt!)}',
        );
      },
    );
  }
}
