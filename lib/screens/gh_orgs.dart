import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import '../generated/l10n.dart';

class GhUserOrganizationScreen extends StatelessWidget {
  final String login;
  GhUserOrganizationScreen(this.login);

  Widget build(BuildContext context) {
    return ListStatefulScaffold<GithubUserOrganizationItem, int>(
      title: AppBarTitle(S.of(context).organizations),
      fetch: (page) async {
        page = page ?? 1;
        final res = await context
            .read<AuthModel>()
            .ghClient
            .getJSON<List, List<GithubUserOrganizationItem>>(
              '/users/$login/orgs?page=$page',
              convert: (vs) =>
                  [for (var v in vs) GithubUserOrganizationItem.fromJson(v)],
            );
        return ListPayload(
          cursor: page + 1,
          items: res,
          hasMore: res.isNotEmpty,
        );
      },
      itemBuilder: (v) {
        return UserItem.github(
          avatarUrl: v.avatarUrl,
          login: v.login,
          name: null, // TODO: organization name
          bio: v.description == null ? null : Text(v.description),
        );
      },
    );
  }
}
