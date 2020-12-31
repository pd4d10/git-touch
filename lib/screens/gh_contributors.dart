import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/contributor_item.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import '../generated/l10n.dart';

class GhContributorsScreen extends StatelessWidget {
  final String owner;
  final String name;
  GhContributorsScreen(this.owner, this.name);

  Widget build(BuildContext context) {
    return ListStatefulScaffold<GithubContributorItem, int>(
      title: AppBarTitle(S.of(context).contributors),
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
        final String login = v.login;
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
