import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';

class GhObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String ref;
  final String path;
  final String raw;
  GhObjectScreen(this.owner, this.name, this.ref, {this.path, this.raw});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      // canRefresh: !_isImage, // TODO:
      title: AppBarTitle(path == null ? 'Files' : path),
      fetchData: () async {
        // Do not request again for images
        if (path != null &&
            raw != null &&
            ['png', 'jpg', 'jpeg', 'gif', 'webp'].contains(path.ext))
          return {'download_url': raw};

        final suffix = path == null ? '' : '/$path';
        final res = await Provider.of<AuthModel>(context)
            .getWithCredentials('/repos/$owner/$name/contents$suffix?ref=$ref');
        return res;
      },
      actionBuilder: (data, _) {
        if (data is Map) {
          return ActionEntry(
            iconData: Icons.settings,
            url: '/choose-code-theme',
          );
        }
      },
      bodyBuilder: (data, _) {
        if (data is List) {
          final items = data.map((t) => GithubTreeItem.fromJson(t)).toList();
          items.sort((a, b) {
            return sortByKey('dir', a.type, b.type);
          });
          return ObjectTree(
            items: items.map((v) {
              // if (item.type == 'commit') return null;
              final uri = Uri(
                path: '/$owner/$name/blob/$ref',
                queryParameters: {
                  'path': v.path,
                  ...(v.downloadUrl == null ? {} : {'raw': v.downloadUrl}),
                },
              ).toString();
              return ObjectTreeItem(
                name: v.name,
                type: v.type,
                url: uri.toString(),
                downloadUrl: v.downloadUrl,
                size: v.type == 'file' ? v.size : null,
              );
            }),
          );
        } else {
          // TODO: Markdown base path
          // basePaths: [owner, name, branch, ...paths]
          final v = GithubTreeItem.fromJson(data);
          return BlobView(
            path,
            base64Text: v.content?.dropLineBreak,
            networkUrl: v.downloadUrl,
          );
        }
      },
    );
  }
}
