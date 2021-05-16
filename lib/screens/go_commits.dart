import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class GoCommitsScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String? branch;
  GoCommitsScreen(this.owner, this.name, {this.branch = 'master'});

  // TODO: API only returns most recent commit. No provision for all commits.
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GogsCommit, int>(
      title: AppBarTitle(AppLocalizations.of(context)!.commits),
      fetch: (page) async {
        final res = await context.read<AuthModel>().fetchGogsWithPage(
            '/repos/$owner/$name/commits/$branch',
            page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [GogsCommit.fromJson(res.data)],
        );
      },
      itemBuilder: (c) {
        return CommitItem(
          author: c.author?.username ?? c.commit!.author!.name,
          avatarUrl: c.author!.avatarUrl,
          avatarLink: '/gogs/${c.author!.username}',
          createdAt: c.commit!.author!.date,
          message: c.commit!.message,
          url: c.htmlUrl,
        );
      },
    );
  }
}
