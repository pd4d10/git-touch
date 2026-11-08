import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/hex_color_tag.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:gql_github/issues.data.gql.dart';
import 'package:gql_github/issues.req.gql.dart';
import 'package:provider/provider.dart';

class GhIssuesScreen extends StatelessWidget {
  const GhIssuesScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GIssuesData_repository_issues_nodes, String?>(
      title: Text(AppLocalizations.of(context)!.issues),
      actionBuilder: () => ActionEntry(
        iconData: Octicons.plus,
        url: '/github/$owner/$name/issues/new',
      ),
      fetch: (cursor) async {
        final req = GIssuesReq((b) {
          b.vars.owner = owner;
          b.vars.name = name;
          b.vars.cursor = cursor;
        });
        final res =
            await context.read<AuthModel>().ghGqlClient.request(req).first;
        final issues = res.data!.repository!.issues;
        return ListPayload(
          cursor: issues.pageInfo.endCursor,
          hasMore: issues.pageInfo.hasNextPage,
          items: issues.nodes!.toList(),
        );
      },
      itemBuilder: (p) {
        return IssueItem(
          author: p.author?.login,
          avatarUrl: p.author?.avatarUrl,
          commentCount: p.comments.totalCount,
          subtitle: '#${p.number}',
          title: p.title,
          updatedAt: p.updatedAt,
          labels: p.labels!.nodes!.isEmpty
              ? null
              : Wrap(spacing: 4, runSpacing: 4, children: [
                  for (var label in p.labels!.nodes!)
                    HexColorTag(name: label.name, color: label.color)
                ]),
          url: '/github/$owner/$name/issues/${p.number}',
        );
      },
    );
  }
}
