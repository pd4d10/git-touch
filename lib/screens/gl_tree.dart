import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';
import '../generated/l10n.dart';

class GlTreeScreen extends StatelessWidget {
  final int id;
  final String ref;
  final String path;
  GlTreeScreen(this.id, this.ref, {this.path});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return RefreshStatefulScaffold<Iterable<GitlabTreeItem>>(
      title: AppBarTitle(path ?? S.of(context).files),
      fetch: () async {
        final uri = Uri(
          path: '/projects/$id/repository/tree',
          queryParameters: {
            'ref': ref,
            ...(path == null ? {} : {'path': path})
          },
        );
        final res = await auth.fetchGitlab(uri.toString());
        return (res as List).map((v) => GitlabTreeItem.fromJson(v));
      },
      bodyBuilder: (data, _) {
        return ObjectTree(
          items: data.map((item) {
            return ObjectTreeItem(
              type: item.type,
              name: item.name,
              downloadUrl:
                  '${auth.activeAccount.domain}/api/v4/projects/$id/repository/files/${item.path.urlencode}/raw?ref=master', // TODO:
              url: (() {
                switch (item.type) {
                  case 'tree':
                    return '/gitlab/projects/$id/tree/$ref?path=${item.path.urlencode}';
                  case 'blob':
                    return '/gitlab/projects/$id/blob/$ref?path=${item.path.urlencode}';
                  default:
                    return null;
                }
              })(),
            );
          }),
        );
      },
    );
  }
}
