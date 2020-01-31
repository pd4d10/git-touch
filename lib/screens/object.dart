import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;
import 'package:git_touch/utils/utils.dart';

final objectRouter = RouterScreen('/:owner/:name/blob/:ref', (context, params) {
  return ObjectScreen(
    params['owner'].first,
    params['name'].first,
    params['ref'].first,
    path: params['path']?.first,
  );
});

class ObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;
  final String path;
  ObjectScreen(this.owner, this.name, this.branch, {this.path});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      // canRefresh: !_isImage, // TODO:
      title: AppBarTitle(path == null ? 'Files' : path),
      fetchData: () async {
        final suffix = path == null ? '' : '/$path';
        final res = await Provider.of<AuthModel>(context).getWithCredentials(
            '/repos/$owner/$name/contents$suffix?ref=$branch');
        return res;
      },
      actionBuilder: (data, _) {
        if (data is Map) {
          final theme = Provider.of<ThemeModel>(context);
          return ActionEntry(
            iconData: Icons.settings,
            onTap: () {
              theme.push(context, '/choose-code-theme');
            },
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
              String url;
              var ext = p.extension(v.name);
              if (ext.startsWith('.')) ext = ext.substring(1);
              if (['pdf', 'docx', 'doc', 'pptx', 'ppt', 'xlsx', 'xls']
                  .contains(ext)) {
                // Let system browser handle these files
                //
                // TODO:
                // Unhandled Exception: PlatformException(Error, Error while launching
                // https://github.com/flutter/flutter/issues/49162
                url = v.downloadUrl;
              } else {
                url = '/$owner/$name/blob/$branch?path=${v.path.urlencode}';
              }

              return ObjectTreeItem(
                name: v.name,
                type: v.type,
                url: url,
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
            base64Text: v.content,
            networkUrl: v.downloadUrl,
          );
        }
      },
    );
  }
}
