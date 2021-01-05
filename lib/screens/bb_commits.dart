import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class BbCommitsScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String ref;
  BbCommitsScreen(this.owner, this.name, this.ref);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return ListStatefulScaffold<BbCommit, String>(
      title: AppBarTitle(S.of(context).commits),
      fetch: (nextUrl) async {
        final res = await context.read<AuthModel>().fetchBbWithPage(
            nextUrl ?? '/repositories/$owner/$name/commits/$ref');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <BbCommit>[
            for (var v in res.data) BbCommit.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return CommitItem(
          url: '${auth.activeAccount.domain}/$owner/$name/commits/${v.hash}',
          avatarUrl: v.author.user?.avatarUrl,
          avatarLink: null,
          author: v.author.raw.replaceFirst(RegExp(r' <.*>'), ''),
          createdAt: v.date,
          message: v.message,
        );
      },
    );
  }
}
