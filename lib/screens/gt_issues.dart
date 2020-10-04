import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';

class GtIssuesScreen extends StatelessWidget {
  final String owner;
  final String name;
  final bool isPr;
  GtIssuesScreen(this.owner, this.name, {this.isPr = false});

  Future<ListPayload<GiteaIssue, int>> _query(BuildContext context,
      [int page = 1]) async {
    final type = isPr ? 'pulls' : 'issues';
    final res = await context.read<AuthModel>().fetchGiteaWithPage(
        '/repos/$owner/$name/issues?state=open&page=$page&limit=20&type=$type');
    return ListPayload(
      cursor: res.cursor,
      hasMore: res.hasMore,
      items: (res.data as List).map((v) => GiteaIssue.fromJson(v)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaIssue, int>(
      title: AppBarTitle(isPr ? 'Pull Requests' : 'Issues'),
      // TODO: create issue
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (p) => IssueItem(
        author: p.user.login,
        avatarUrl: p.user.avatarUrl,
        commentCount: p.comments,
        number: p.number,
        title: p.title,
        updatedAt: p.updatedAt,
        url: p.htmlUrl,
      ),
    );
  }
}
