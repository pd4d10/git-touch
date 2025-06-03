import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/rhodecode.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:provider/provider.dart';

class RhExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<RhRepo, int>(
      title: Text(AppLocalizations.of(context)!.explore),
      fetch: (page) async {
        final auth = context.read<AuthModel>();
        final res = await auth.fetchRhodecodeWithPage('get_repos');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: (res.data['result'] as List)
              .map((v) => RhRepo.fromJson(v))
              .toList(),
        );
      },
      itemBuilder: (v) {
        return RepoItem.rh(payload: v);
      },
    );
  }
}
