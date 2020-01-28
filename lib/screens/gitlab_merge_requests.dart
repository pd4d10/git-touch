import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:provider/provider.dart';

final gitlabMergeRequestsRouter = RouterScreen(
    '/gitlab/projects/:id/merge_requests',
    (context, params) => GitlabMergeRequestsScreen(params['id'].first));

class GitlabMergeRequestsScreen extends StatelessWidget {
  final String id;

  GitlabMergeRequestsScreen(this.id);

  Future<ListPayload<GitlabIssue, int>> _query(BuildContext context,
      [int page = 1]) async {
    final res = await Provider.of<AuthModel>(context)
        .fetchGitlab('/projects/$id/merge_requests?page=$page');
    return ListPayload(
      cursor: page + 1,
      hasMore: true, // TODO:
      items: (res as List).map((v) => GitlabIssue.fromJson(v)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabIssue, int>(
      title: AppBarTitle('Merge Requests'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(context, cursor),
      itemBuilder: (p) => IssueItem(
        isPr: true,
        author: p.author.username,
        avatarUrl: p.author.avatarUrl,
        commentCount: p.userNotesCount,
        number: p.iid,
        title: p.title,
        updatedAt: p.updatedAt,
        labels: p.labels.isEmpty
            ? null
            : Wrap(spacing: 4, runSpacing: 4, children: [
                for (var label in p.labels)
                  MyLabel(name: label, cssColor: '#428BCA')
              ]),
        url: '/gitlab/projects/${p.projectId}/merge_requests/${p.iid}',
      ),
    );
  }
}
