import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';

class GtOrgsScreen extends StatelessWidget {
  // final String branch; // TODO:
  Future<ListPayload<GiteaOrg, int>> _query(BuildContext context,
      [int page = 1]) async {
    final res = await context
        .read<AuthModel>()
        .fetchGiteaWithPage('/orgs?limit=20&page=$page');
    // TODO: https://github.com/go-gitea/gitea/issues/10199
    return ListPayload(
      cursor: page + 1,
      hasMore: (res.data as List).length == 20,
      items: (res.data as List).map((v) => GiteaOrg.fromJson(v)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaOrg, int>(
      title: AppBarTitle('Organizations'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
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
