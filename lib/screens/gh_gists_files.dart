import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import '../generated/l10n.dart';

class GhGistsFilesScreen extends StatelessWidget {
  final String id;
  final String login;
  GhGistsFilesScreen(this.login, this.id);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GithubGistsItem>(
      title: AppBarTitle(S.of(context).files),
      fetch: () async {
        final data = await context.read<AuthModel>().ghClient.getJSON(
            '/gists/$id',
            convert: (vs) => GithubGistsItem.fromJson(vs));
        return data;
      },
      bodyBuilder: (payload, _) {
        return ObjectTree(
          items: payload.fileNames.map((v) {
            final uri = Uri(
              path: '/github/$login/gists/$id/${v.filename}',
              queryParameters: {
                'content': v.content,
                ...(v.rawUrl == null ? {} : {'raw': v.rawUrl}),
              },
            ).toString();
            return ObjectTreeItem(
              url: uri,
              type: 'file',
              name: v.filename,
              downloadUrl: v.rawUrl,
              size: v.size,
            );
          }),
        );
      },
    );
  }
}
