import 'package:flutter/material.dart';
import 'package:git_touch/generated/l10n.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';

class GtObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String path;
  GtObjectScreen(this.owner, this.name, {this.path});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: AppBarTitle(path ?? S.of(context).files),
      fetch: () async {
        final suffix = path == null ? '' : '/$path';
        final res = await context
            .read<AuthModel>()
            .fetchGitea('/repos/$owner/$name/contents$suffix');
        return res;
      },
      actionBuilder: (p, _) {
        if (p is List) {
          return null;
        } else {
          return ActionEntry(
            iconData: Icons.settings,
            url: '/choose-code-theme',
          );
        }
      },
      bodyBuilder: (p, _) {
        if (p is List) {
          final items = p.map((t) => GiteaTree.fromJson(t)).toList();
          items.sort((a, b) {
            return sortByKey('dir', a.type, b.type);
          });
          return ObjectTree(items: [
            for (var v in items)
              ObjectTreeItem(
                name: v.name,
                type: v.type,
                size: v.type == 'file' ? v.size : null,
                url: '/gitea/$owner/$name/blob?path=${v.path.urlencode}',
                downloadUrl: v.downloadUrl,
              ),
          ]);
        } else {
          final v = GiteaBlob.fromJson(p);
          return BlobView(v.name, base64Text: v.content);
        }
      },
    );
  }
}
