import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class GtOrgsScreen extends StatelessWidget {
  final String api;
  GtOrgsScreen() : api = '/orgs';
  GtOrgsScreen.ofUser(String login) : api = '/users/$login/orgs';

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaOrg, int>(
      title: AppBarTitle(S.of(context).organizations),
      fetch: (page) async {
        final res =
            await context.read<AuthModel>().fetchGiteaWithPage(api, page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GiteaOrg.fromJson(v)],
        );
      },
      itemBuilder: (v) {
        return UserItem.gitea(
          avatarUrl: v.avatarUrl,
          login: v.username,
          name: v.fullName,
          bio: Text(v.description ?? v.website ?? v.location),
        );
      },
    );
  }
}
