import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/rhodecode.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:provider/provider.dart';

class RhCommitsScreen extends StatelessWidget {
  const RhCommitsScreen(this.id, {this.branch});
  final int id;
  final String? branch;


  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<RhodecodeCommit, int>(
      title: Text(AppLocalizations.of(context)!.commits),
      fetch: (page) async {
        page = page ?? 0;
        const limit = 10;
        final auth = context.read<AuthModel>();
        final parameters = {
          'repoid': id,
          'start_rev': (limit * page).toString(),
          'limit': limit,
          'details': 'basic'
        };
        final res = await auth.fetchRhodecodeWithPage('get_repo_changesets',
            body: parameters);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: (res.data['result'] as List)
              .map((v) => RhodecodeCommit.fromJson(v))
              .toList(),
        );
      },
      itemBuilder: (c) {
        return CommitItem(
          author: c.author,
          avatarUrl: null,
          avatarLink: null,
          createdAt: c.date,
          message: c.message,
          url: '/rhodecode/repository/$id/commit/${c.revision}',
        );
      },
    );
  }
}
