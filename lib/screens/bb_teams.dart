import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class BbTeamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<BbUser, String?>(
      title: Text(AppLocalizations.of(context)!.teams),
      fetch: (nextUrl) async {
        final res = await context
            .read<AuthModel>()
            .fetchBbWithPage(nextUrl ?? '/teams?role=member');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <BbUser>[
            for (var v in res.items) BbUser.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return UserItem.bitbucket(
          login: v.username,
          name: v.nickname,
          avatarUrl: v.avatarUrl,
          bio: Text('Created ${timeago.format(v.createdOn!)}'),
        );
      },
    );
  }
}
