import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';

class GoObjectScreen extends StatelessWidget {
  const GoObjectScreen(this.owner, this.name, {this.path, this.ref});
  final String owner;
  final String name;
  final String? path;
  final String? ref;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: Text(path ?? AppLocalizations.of(context)!.files),
      fetch: () async {
        final suffix = path == null ? '' : '/$path';
        final res = await context
            .read<AuthModel>()
            .fetchGogs('/repos/$owner/$name/contents$suffix?ref=$ref');
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
          final items = p.map((t) => GogsTree.fromJson(t)).toList();
          items.sort((a, b) {
            return sortByKey('dir', a.type, b.type);
          });
          return AntList(children: [
            for (var v in items)
              createObjectTreeItem(
                name: v.name,
                type: v.type,
                size: v.type == 'file' ? v.size : null,
                url:
                    '/gogs/$owner/$name/blob?path=${v.path!.urlencode}&ref=$ref',
                downloadUrl: v.downloadUrl,
              ),
          ]);
        } else {
          final v = GogsBlob.fromJson(p);
          return BlobView(v.name, base64Text: v.content);
        }
      },
    );
  }
}
