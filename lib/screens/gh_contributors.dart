import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/contributor_item.dart';
import 'package:provider/provider.dart';

class GhContributorsScreen extends StatelessWidget {
  const GhContributorsScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GithubContributorItem, int>(
      title: Text(AppLocalizations.of(context)!.contributors),
      fetch: (page) async {
        page = page ?? 1;
        final res = await context
            .read<AuthModel>()
            .ghClient
            .getJSON<List, List<GithubContributorItem>>(
              '/repos/$owner/$name/contributors?page=$page',
              convert: (vs) =>
                  [for (var v in vs) GithubContributorItem.fromJson(v)],
            );
        return ListPayload(
          cursor: page + 1,
          items: res,
          hasMore: res.isNotEmpty,
        );
      },
      itemBuilder: (v) {
        final login = v.login;
        return ContributorItem(
          avatarUrl: v.avatarUrl,
          commits: v.contributions,
          login: v.login,
          url: '/github/$login?tab=contributors',
        );
      },
    );
  }
}
