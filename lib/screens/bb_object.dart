import 'dart:convert';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;

class BbObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String ref;
  final String path;
  BbObjectScreen(this.owner, this.name, this.ref, {this.path});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return RefreshStatefulScaffold(
      title: AppBarTitle(path ?? 'Files'),
      fetch: () async {
        final res = await auth
            .fetchBb('/repositories/$owner/$name/src/$ref/${path ?? ''}');
        if (res.headers[HttpHeaders.contentTypeHeader] == 'text/plain') {
          return utf8.decode(res.bodyBytes);
        } else {
          return BbPagination.fromJson(json.decode(utf8.decode(res.bodyBytes)))
              .values;
        }
      },
      actionBuilder: (p, _) {
        if (p is String) {
          return ActionEntry(
            iconData: Icons.settings,
            url: '/choose-code-theme',
          );
        } else {
          return null;
        }
      },
      bodyBuilder: (pl, _) {
        if (pl is String) {
          return BlobView(path, text: pl);
        } else if (pl is List) {
          final items = pl.map((t) => BbTree.fromJson(t)).toList();
          items.sort((a, b) {
            return sortByKey('dir', a.type, b.type);
          });
          return ObjectTree(items: [
            for (var v in items)
              ObjectTreeItem(
                name: p.basename(v.path),
                type: v.type,
                size: v.type == 'commit_file' ? v.size : null,
                url:
                    '/bitbucket/$owner/$name/src/$ref?path=${v.path.urlencode}',
                downloadUrl: v.links['self']['href'] as String,
              ),
          ]);
        } else {
          return null;
        }
      },
    );
  }
}
