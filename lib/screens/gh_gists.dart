import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/gists_item.dart';
import 'package:gql_github/gists.data.gql.dart';
import 'package:gql_github/gists.req.gql.dart';
import 'package:provider/provider.dart';

class GhGistsScreen extends StatelessWidget {
  const GhGistsScreen(this.login);
  final String login;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GGistsData_user_gists_nodes, String?>(
      title: Text(AppLocalizations.of(context)!.gists),
      fetch: (page) async {
        final req = GGistsReq((b) => b
          ..vars.login = login
          ..vars.after = page);
        final res =
            await context.read<AuthModel>().ghGqlClient.request(req).first;
        final gists = res.data!.user!.gists;
        return ListPayload(
          cursor: gists.pageInfo.endCursor,
          items: gists.nodes ?? [],
          hasMore: gists.pageInfo.hasNextPage,
        );
      },
      itemBuilder: (v) {
        final filenames = [for (var file in v.files!) file.name];
        // TODO: add gist comments
        return GistsItem(
          description: v.description,
          login: login,
          filenames: filenames,
          language: v.files![0].language!.name,
          avatarUrl: v.owner!.avatarUrl,
          updatedAt: v.updatedAt,
          id: v.name,
        );
      },
    );
  }
}
