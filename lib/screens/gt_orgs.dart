import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';

class GtOrgsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaOrg, int>(
      title: AppBarTitle('Organizations'),
      onLoadMore: (page) async {
        // final String branch; // TODO:
        final res = await context
            .read<AuthModel>()
            .fetchGiteaWithPage('/orgs', page: page);
        // TODO: https://github.com/go-gitea/gitea/issues/10199
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: (res.data as List).map((v) => GiteaOrg.fromJson(v)).toList(),
        );
      },
      itemBuilder: (v) {
        return UserItem(
          avatarUrl: v.avatarUrl,
          login: v.username,
          bio: Text(v.description ?? ''),
          url: '/gitea/${v.username}?org=1',
        );
      },
    );
  }
}
