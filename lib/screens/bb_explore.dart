import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:provider/provider.dart';

class BbExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<BbRepo, String?>(
      title: Text(AppLocalizations.of(context)!.explore),
      fetch: (nextUrl) async {
        final res = await context.read<AuthModel>().fetchBbWithPage(
            nextUrl ?? '/repositories?role=member&sort=-updated_on');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <BbRepo>[
            for (var v in res.items) BbRepo.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return RepoItem.bb(payload: v);
      },
    );
  }
}
