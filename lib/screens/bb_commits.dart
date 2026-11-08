import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';

class BbCommitsScreen extends StatelessWidget {
  const BbCommitsScreen(this.owner, this.name, this.ref);
  final String owner;
  final String name;
  final String ref;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return ListStatefulScaffold<BbCommit, String?>(
      title: Text(AppLocalizations.of(context)!.commits),
      fetch: (nextUrl) async {
        final res = await context.read<AuthModel>().fetchBbWithPage(
            nextUrl ?? '/repositories/$owner/$name/commits/$ref');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <BbCommit>[
            for (var v in res.items) BbCommit.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return CommitItem(
          url: '${auth.activeAccount!.domain}/$owner/$name/commits/${v.hash}',
          avatarUrl: v.author!.user?.avatarUrl,
          avatarLink: null,
          author: v.author!.raw!.replaceFirst(RegExp(r' <.*>'), ''),
          createdAt: v.date,
          message: v.message,
        );
      },
    );
  }
}
