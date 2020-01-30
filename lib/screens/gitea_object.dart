import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';

final giteaObjectRouter = RouterScreen(
  '/gitea/:owner/:name/blob',
  (context, params) => GiteaObjectScreen(
    params['owner'].first,
    params['name'].first,
    path: params['path']?.first?.urldecode,
  ),
);

class GiteaObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String path;
  GiteaObjectScreen(this.owner, this.name, {this.path});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: AppBarTitle(path ?? 'Files'),
      fetchData: () async {
        final suffix = path == null ? '' : '/$path';
        final res = await Provider.of<AuthModel>(context)
            .fetchGitea('/repos/$owner/$name/contents$suffix');
        return res;
      },
      actionBuilder: (p, _) {
        if (p is List) {
          return null;
        } else {
          final theme = Provider.of<ThemeModel>(context);
          return ActionEntry(
            iconData: Icons.settings,
            onTap: () {
              theme.push(context, '/choose-code-theme');
            },
          );
        }
      },
      bodyBuilder: (p, _) {
        if (p is List) {
          return ObjectTree(
            items: p.map((t) {
              final v = GiteaTree.fromJson(t);
              return ObjectTreeItem(
                name: v.name,
                type: v.type,
                url: '/gitea/$owner/$name/blob?path=${v.path.urlencode}',
              );
            }),
          );
        } else {
          final v = GiteaBlob.fromJson(p);
          return BlobView(v.name, base64Text: v.content);
        }
      },
    );
  }
}
