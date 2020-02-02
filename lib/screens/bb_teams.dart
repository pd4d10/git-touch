import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class BbTeamsScreen extends StatelessWidget {
  Future<ListPayload<BbUser, String>> _query(BuildContext context,
      [String nextUrl]) async {
    final auth = Provider.of<AuthModel>(context);
    final res = await auth.fetchBbWithPage(nextUrl ?? '/teams?role=member');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: <BbUser>[
        for (var v in res.data) BbUser.fromJson(v),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<BbUser, String>(
      title: AppBarTitle('Teams'),
      onRefresh: () => _query(context),
      onLoadMore: (page) => _query(context, page),
      itemBuilder: (v) {
        return UserItem(
          login: v.username,
          url: '/bitbucket/${v.username}?team=1',
          avatarUrl: v.avatarUrl,
          bio: Text('Created ${timeago.format(v.createdOn)}'),
        );
      },
    );
  }
}
