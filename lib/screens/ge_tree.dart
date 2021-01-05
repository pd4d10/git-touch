import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class GeTreeScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String sha;
  GeTreeScreen(this.owner, this.name, this.sha);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<List<GiteeTreeItem>>(
      title: AppBarTitle(S.of(context).files),
      fetch: () async {
        final res = await context
            .read<AuthModel>()
            .fetchGitee('/repos/$owner/$name/git/trees/$sha');
        final items = [for (var v in res['tree']) GiteeTreeItem.fromJson(v)];
        items.sort((a, b) {
          return sortByKey('tree', a.type, b.type);
        });
        return items;
      },
      bodyBuilder: (data, _) {
        return ObjectTree(
          items: [
            for (var item in data)
              ObjectTreeItem(
                type: item.type,
                name: item.path,
                size: item.size,
                downloadUrl: '', // TODO:
                url: (() {
                  switch (item.type) {
                    case 'tree':
                      return '/gitee/$owner/$name/tree/${item.sha}?path=${item.path.urlencode}';
                    case 'blob':
                      return '/gitee/$owner/$name/blob/${item.sha}?path=${item.path.urlencode}';
                    default:
                      return null;
                  }
                })(),
              )
          ],
        );
      },
    );
  }
}
