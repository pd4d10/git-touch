import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class GlTreeScreen extends StatelessWidget {
  final int id;
  final String ref;
  final String? path;
  GlTreeScreen(this.id, this.ref, {this.path});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);

    return ListStatefulScaffold<GitlabTreeItem, int>(
      title: AppBarTitle(path ?? AppLocalizations.of(context)!.files),
      fetch: (page) async {
        final uri = Uri(
          path: '/projects/$id/repository/tree',
          queryParameters: {
            'ref': ref,
            'page': page?.toString(),
            ...(path == null ? {} : {'path': path})
          },
        );
        final res = await auth.fetchGitlabWithPage(uri.toString());
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GitlabTreeItem.fromJson(v)],
        );
      },
      itemBuilder: (item) {
        return ObjectTreeItem(
          type: item.type,
          name: item.name,
          downloadUrl:
              '${auth.activeAccount!.domain}/api/v4/projects/$id/repository/files/${item.path.urlencode}/raw?ref=master', // TODO:
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
      },
    );
  }
}
