import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';

class GtObjectScreen extends StatelessWidget {
  const GtObjectScreen(this.owner, this.name, {this.path});
  final String owner;
  final String name;
  final String? path;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: Text(path ?? AppLocalizations.of(context)!.files),
      fetch: () async {
        final suffix = path == null ? '' : '/$path';
        final res = await context
            .read<AuthModel>()
            .fetchGitea('/repos/$owner/$name/contents$suffix');
        return res;
      },
      actionBuilder: (dynamic p, _) {
        if (p is List) {
          return null;
        } else {
          return const ActionEntry(
            iconData: Ionicons.cog,
            url: '/choose-code-theme',
          );
        }
      },
      bodyBuilder: (dynamic p, _) {
        if (p is List) {
          final items = p.map((t) => GiteaTree.fromJson(t)).toList();
          items.sort((a, b) {
            return sortByKey('dir', a.type, b.type);
          });
          return AntList(children: [
            for (var v in items)
              createObjectTreeItem(
                name: v.name,
                type: v.type,
                size: v.type == 'file' ? v.size : null,
                url: '/gitea/$owner/$name/blob?path=${v.path!.urlencode}',
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
