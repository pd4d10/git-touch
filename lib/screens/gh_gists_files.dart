import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:gql_github/gist.data.gql.dart';
import 'package:gql_github/gist.req.gql.dart';
import 'package:provider/provider.dart';

class GhGistsFilesScreen extends StatelessWidget {
  const GhGistsFilesScreen(this.login, this.id);
  final String id;
  final String login;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GGistData_user_gist?>(
      title: Text(AppLocalizations.of(context)!.files),
      fetch: () async {
        final req = GGistReq((b) => b
          ..vars.login = login
          ..vars.name = id);
        final res =
            await context.read<AuthModel>().ghGqlClient.request(req).first;
        final gist = res.data!.user!.gist;
        return gist;
      },
      bodyBuilder: (payload, _) {
        return AntList(
          children: payload!.files!.map((v) {
            final uri = Uri(
              path: '/github/$login/gists/$id/${v.name}',
              queryParameters: {
                'content': v.text,
              },
            ).toString();
            return createObjectTreeItem(
              url: uri,
              type: 'file',
              name: v.name ?? '',
              downloadUrl: null,
              size: v.size,
            );
          }).toList(),
        );
      },
    );
  }
}
