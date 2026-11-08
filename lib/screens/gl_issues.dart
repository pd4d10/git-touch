import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/hex_color_tag.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';

class GlIssuesScreen extends StatelessWidget {
  const GlIssuesScreen(this.id, {this.prefix});
  final String id;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabIssue, int>(
      title: Text(AppLocalizations.of(context)!.issues),
      fetch: (page) async {
        page = page ?? 1;
        final auth = context.read<AuthModel>();
        final res = await auth.fetchGitlabWithPage(
            '/projects/$id/issues?state=opened&page=$page');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items:
              (res.data as List).map((v) => GitlabIssue.fromJson(v)).toList(),
        );
      },
      actionBuilder: () => ActionEntry(
        iconData: Octicons.plus,
        url: '/gitlab/projects/$id/issues/new',
      ),
      itemBuilder: (p) => IssueItem(
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
        url: '/gitlab/projects/${p.projectId}/issues/${p.iid}',
      ),
    );
  }
}
