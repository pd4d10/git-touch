import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class BbCommitsScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String ref;
  BbCommitsScreen(this.owner, this.name, this.ref);

  Future<ListPayload<BbCommit, String>> _query(BuildContext context,
      [String nextUrl]) async {
    final auth = Provider.of<AuthModel>(context);
    final res = await auth
        .fetchBbWithPage(nextUrl ?? '/repositories/$owner/$name/commits/$ref');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: <BbCommit>[
        for (var v in res.data) BbCommit.fromJson(v),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<BbCommit, String>(
      title: AppBarTitle('Commits'),
      onRefresh: () => _query(context),
      onLoadMore: (page) => _query(context, page),
      itemBuilder: (v) {
        return CommitItem(
          url: '/bitbucket/$owner/$name/commits/$ref',
          avatarUrl: v.author.user?.avatarUrl,
          author: v.author.raw.replaceFirst(RegExp(r' <.*>'), ''),
          createdAt: v.date,
          message: v.message,
        );
      },
    );
  }
}
