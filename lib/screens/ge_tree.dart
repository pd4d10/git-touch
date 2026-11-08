import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';

class GeTreeScreen extends StatelessWidget {
  const GeTreeScreen(this.owner, this.name, this.sha);
  final String owner;
  final String name;
  final String sha;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<List<GiteeTreeItem>>(
      title: Text(AppLocalizations.of(context)!.files),
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
        return AntList(
          children: [
            for (var item in data)
              createObjectTreeItem(
                type: item.type,
                name: item.path,
                size: item.size,
                downloadUrl: '', // TODO:
                url: item.type == 'tree'
                    ? '/gitee/$owner/$name/tree/${item.sha}?path=${item.path.urlencode}'
                    : item.type == 'blob'
                        ? '/gitee/$owner/$name/blob/${item.sha}?path=${item.path.urlencode}'
                        : '',
              )
          ],
        );
      },
    );
  }
}
