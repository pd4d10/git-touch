import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/commit_item.dart';
import 'package:gql_github/commits.data.gql.dart';
import 'package:gql_github/commits.req.gql.dart';
import 'package:gql_github/schema.schema.gql.dart';
import 'package:provider/provider.dart';

class GhCommits extends StatelessWidget {
  const GhCommits(this.owner, this.name, {this.branch});
  final String owner;
  final String name;
  final String? branch;

  Widget _buildStatus(GStatusState? state) {
    const size = 18.0;
    switch (state) {
      case GStatusState.SUCCESS:
        return const Icon(Octicons.check,
            color: GithubPalette.open, size: size);
      case GStatusState.FAILURE:
        return const Icon(Octicons.x, color: GithubPalette.closed, size: size);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GCommitsRefCommit_history_nodes, String?>(
      title: Text(AppLocalizations.of(context)!.commits),
      fetch: (cursor) async {
        final req = GCommitsReq((b) {
          b.vars.owner = owner;
          b.vars.name = name;
          b.vars.hasRef = branch != null;
          b.vars.ref = branch ?? '';
          b.vars.after = cursor;
        });
        final res =
            await context.read<AuthModel>().ghGqlClient.request(req).first;
        final ref = res.data!.repository!.defaultBranchRef ??
            res.data!.repository!.ref!;
        final history = (ref.target as GCommitsRefCommit).history;
        return ListPayload(
          cursor: history.pageInfo.endCursor,
          hasMore: history.pageInfo.hasNextPage,
          items: history.nodes ?? [],
        );
      },
      itemBuilder: (p) {
        final login = p.author?.user?.login;
        return CommitItem(
          url: '/github/$owner/$name/commit/${p.oid}',
          avatarUrl: p.author?.avatarUrl,
          avatarLink: login == null ? null : '/github/$login',
          message: p.messageHeadline,
          author: login ?? p.author!.name,
          createdAt: p.committedDate,
          widgets: p.status == null
              ? null
              : [
                  const SizedBox(width: 4),
                  _buildStatus(p.status!.state),
                ],
        );
      },
    );
  }
}
