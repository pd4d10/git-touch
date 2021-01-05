import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../generated/l10n.dart';

class BbTeamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<BbUser, String>(
      title: AppBarTitle(S.of(context).teams),
      fetch: (nextUrl) async {
        final res = await context
            .read<AuthModel>()
            .fetchBbWithPage(nextUrl ?? '/teams?role=member');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <BbUser>[
            for (var v in res.data) BbUser.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return UserItem.bitbucket(
          login: v.username,
          name: v.nickname,
          avatarUrl: v.avatarUrl,
          bio: Text('Created ${timeago.format(v.createdOn)}'),
        );
      },
    );
  }
}
