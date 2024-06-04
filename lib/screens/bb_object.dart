import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:universal_io/io.dart';

class BbObjectScreen extends StatelessWidget {
  const BbObjectScreen(this.owner, this.name, this.ref, {this.path});
  final String owner;
  final String name;
  final String ref;
  final String? path;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);

    return ListStatefulScaffold<dynamic, String?>(
      title: Text(path ?? 'Files'),
      fetch: (next) async {
        final res = await auth.fetchBb(
            next ?? '/repositories/$owner/$name/src/$ref/${path ?? ''}');
        if (res.headers[HttpHeaders.contentTypeHeader] == 'text/plain') {
          return ListPayload(
            cursor: '',
            hasMore: true,
            items: [utf8.decode(res.bodyBytes)],
          );
        } else {
          final v =
              BbPagination.fromJson(json.decode(utf8.decode(res.bodyBytes)));
          final items = [for (var t in v.values) BbTree.fromJson(t)];
          items.sort((a, b) {
            return sortByKey('dir', a.type, b.type);
          });

          return ListPayload(
            cursor: v.next,
            hasMore: v.next != null,
            items: items,
          );
        }
      },
      itemBuilder: (pl) {
        if (pl is String) {
          return BlobView(path, text: pl);
        } else if (pl is BbTree) {
          return createObjectTreeItem(
            name: p.basename(pl.path),
            type: pl.type,
            // size: v.type == 'commit_file' ? v.size : null,
            size: pl.size,
            url: '/bitbucket/$owner/$name/src/$ref?path=${pl.path.urlencode}',
            downloadUrl: pl.links!['self']['href'] as String?,
          );
        } else {
          return Container();
        }
      },
      actionBuilder: () {
        return const ActionEntry(
          iconData: Ionicons.cog,
          url: '/choose-code-theme',
        );
      },
    );
  }
}
