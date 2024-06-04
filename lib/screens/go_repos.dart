import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:provider/provider.dart';

class GoReposScreen extends StatelessWidget {
  const GoReposScreen(String owner, {this.isViewer = true})
      : api = isViewer ? '/users/$owner/repos' : '/user/repos',
        title = 'Repositories';
  const GoReposScreen.org(String owner)
      : api = '/orgs/$owner/repos',
        title = 'Repositories',
        isViewer = true;
  final String api;
  final String title;
  final bool isViewer;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GogsRepository, int>(
      title: Text(title),
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
        return RepoItem.go(
          payload: v,
          name: v.fullName!.split('/')[1],
          owner: v.owner!.username,
        );
      },
    );
  }
}
