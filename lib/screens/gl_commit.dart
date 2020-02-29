import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/diff_view.dart';
import 'package:provider/provider.dart';

class GlCommitScreen extends StatelessWidget {
  final String id;
  final String sha;
  GlCommitScreen(this.id, {this.sha});

  Future<List<GitlabDiff>> _query(BuildContext context, [int page = 1]) async {
    final auth = Provider.of<AuthModel>(context);
    final res = await auth
        .fetchGitlabWithPage('/projects/$id/repository/commits/$sha/diff');
    return (res.data as List).map((v) => GitlabDiff.fromJson(v)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<List<GitlabDiff>>(
      title: AppBarTitle('Commits'),
      fetchData: () => _query(context),
      bodyBuilder: (items, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (var item in items) DiffView(item.diff),
          ],
        );
      },
    );
  }
}
