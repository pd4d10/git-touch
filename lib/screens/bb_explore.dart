import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:provider/provider.dart';

class BbExplore extends StatelessWidget {
  Future<ListPayload<BbRepo, String>> _query(BuildContext context,
      [String nextUrl]) async {
    final auth = Provider.of<AuthModel>(context);
    final res = await auth.fetchBbWithPage(
        nextUrl ?? '/repositories?role=member&sort=-updated_on');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: <BbRepo>[
        for (var v in res.data) BbRepo.fromJson(v),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<BbRepo, String>(
      title: AppBarTitle('Explore'),
      onRefresh: () => _query(context),
      onLoadMore: (page) => _query(context, page),
      itemBuilder: (v) {
        return RepositoryItem.bb(payload: v);
      },
    );
  }
}
