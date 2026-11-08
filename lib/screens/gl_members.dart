import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';

class GlMembersScreen extends StatelessWidget {
  const GlMembersScreen(this.id, this.type);
  final int id;
  final String type;

  // https://docs.gitlab.com/ee/api/access_requests.html#valid-access-levels
  static const accessLevelMap = {
    10: 'Guest',
    20: 'Reporter',
    30: 'Developer',
    40: 'Maintainer',
    50: 'Owner',
  };

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabUser, int>(
      title: Text(AppLocalizations.of(context)!.members),
      fetch: (page) async {
        page = page ?? 1;
        final auth = context.read<AuthModel>();
        final res =
            await auth.fetchGitlabWithPage('/$type/$id/members?page=$page');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <GitlabUser>[
            for (var v in res.data) GitlabUser.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return UserItem.gitlab(
          avatarUrl: v.avatarUrl,
          login: v.username,
          name: v.name,
          bio: Text(accessLevelMap[v.accessLevel!] ?? ''),
          id: v.id,
        );
      },
    );
  }
}
