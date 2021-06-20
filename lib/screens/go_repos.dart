import 'package:flutter/material.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/repository_item.dart';

class GoReposScreen extends StatelessWidget {
  final String api;
  final String title;
  final bool isViewer;

  GoReposScreen(String owner, {this.isViewer = false})
      : api = isViewer ? '/users/$owner/repos' : '/user/repos',
        title = 'Repositories';
  GoReposScreen.org(String owner)
      : api = '/orgs/$owner/repos',
        title = 'Repositories',
        isViewer = false;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GogsRepository, int>(
      title: AppBarTitle(title),
      fetch: (page) async {
        final res =
            await context.read<AuthModel>().fetchGogsWithPage(api, page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GogsRepository.fromJson(v)],
        );
      },
      itemBuilder: (v) {
        return RepositoryItem.go(
          payload: v,
          name: v.fullName!.split('/')[1],
          owner: v.owner!.username,
        );
      },
    );
  }
}
