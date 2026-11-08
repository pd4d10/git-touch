import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/hex_color_tag.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:gql_github/issues.data.gql.dart';
import 'package:gql_github/issues.req.gql.dart';
import 'package:provider/provider.dart';

class GhPullsScreen extends StatelessWidget {
  const GhPullsScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GPullsData_repository_pullRequests_nodes,
        String?>(
      title: Text(AppLocalizations.of(context)!.pullRequests),
      fetch: (cursor) async {
        final req = GPullsReq((b) {
          b.vars.owner = owner;
          b.vars.name = name;
          b.vars.cursor = cursor;
        });
        final res =
            await context.read<AuthModel>().ghGqlClient.request(req).first;
        final pulls = res.data!.repository!.pullRequests;
        return ListPayload(
          cursor: pulls.pageInfo.endCursor,
          hasMore: pulls.pageInfo.hasNextPage,
          items: pulls.nodes!.toList(),
        );
      },
      itemBuilder: (p) => IssueItem(
        isPr: true,
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
        url: '/github/$owner/$name/pull/${p.number}',
      ),
    );
  }
}
