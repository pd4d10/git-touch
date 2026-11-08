import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';

class GtCommitsScreen extends StatelessWidget {
  // final String branch; // TODO:
  const GtCommitsScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaCommit, int>(
      title: Text(AppLocalizations.of(context)!.commits),
      fetch: (page) async {
        final res = await context
            .read<AuthModel>()
            .fetchGiteaWithPage('/repos/$owner/$name/commits', page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items:
              (res.data as List).map((v) => GiteaCommit.fromJson(v)).toList(),
        );
      },
      itemBuilder: (c) {
        return CommitItem(
          author: c.author?.login ?? c.commit!.author!.name,
          avatarUrl: null,
          avatarLink: null,
          createdAt: c.commit!.author!.date,
          message: c.commit!.message,
          url: c.htmlUrl,
        );
      },
    );
  }
}
