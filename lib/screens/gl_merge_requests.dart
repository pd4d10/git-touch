import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/hex_color_tag.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';

class GlMergeRequestsScreen extends StatelessWidget {
  const GlMergeRequestsScreen(this.id, {this.prefix});
  final String id;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabIssue, int>(
      title: Text(AppLocalizations.of(context)!.mergeRequests),
      fetch: (page) async {
        page = page ?? 1;
        final res = await context.read<AuthModel>().fetchGitlabWithPage(
            '/projects/$id/merge_requests?state=opened&page=$page');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items:
              (res.data as List).map((v) => GitlabIssue.fromJson(v)).toList(),
        );
      },
      itemBuilder: (p) => IssueItem(
        isPr: true,
        author: p.author!.username,
        avatarUrl: p.author!.avatarUrl,
        commentCount: p.userNotesCount,
        subtitle: '#${p.iid}',
        title: p.title,
        updatedAt: p.updatedAt,
        labels: p.labels!.isEmpty
            ? null
            : Wrap(spacing: 4, runSpacing: 4, children: [
                for (var label in p.labels!)
                  HexColorTag(name: label, color: '428BCA')
              ]),
        // url: '/gitlab/projects/${p.projectId}/merge_requests/${p.iid}',
        url: '$prefix/merge_requests/${p.iid}', // TODO:
      ),
    );
  }
}
