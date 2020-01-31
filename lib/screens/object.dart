import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/gh.dart';
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

  String get _pathNotNull => path ?? '';

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GhObjectGitObject>(
      // canRefresh: !_isImage, // TODO:
      title: AppBarTitle(path == null ? 'Files' : path),
      fetchData: () async {
        final res = await Provider.of<AuthModel>(context)
            .gqlClient
            .execute(GhObjectQuery(
              variables: GhObjectArguments(
                owner: owner,
                name: name,
                expression: '$branch:$_pathNotNull',
              ),
            ));
        final data = res.data.repository.object;
        if (data.resolveType == 'Tree') {
          (data as GhObjectTree).entries.sort((a, b) {
            return sortByKey('tree', a.type, b.type);
          });
        }
        return data;
      },
      actionBuilder: (data, _) {
        switch (data.resolveType) {
          case 'Blob':
            final blob = data as GhObjectBlob;
            final theme = Provider.of<ThemeModel>(context);
            return ActionEntry(
              iconData: Icons.settings,
              onTap: () {
                theme.push(context, '/choose-code-theme');
              },
            );
          default:
            return null;
        }
      },
      bodyBuilder: (data, _) {
        switch (data.resolveType) {
          case 'Tree':
            return ObjectTree(
              items: (data as GhObjectTree).entries.map((v) {
                // if (item.type == 'commit') return null;
                String url;
                var ext = p.extension(v.name);
                if (ext.startsWith('.')) ext = ext.substring(1);
                if (['pdf', 'docx', 'doc', 'pptx', 'ppt', 'xlsx', 'xls']
                    .contains(ext)) {
                  // Let system browser handle these files
                  url =
                      'https://raw.githubusercontent.com/$owner/$name/$branch/$path';
                } else {
                  url =
                      '/$owner/$name/blob/$branch?path=${p.join(_pathNotNull, v.name).urlencode}';
                }

                return ObjectTreeItem(
                  name: v.name,
                  type: v.type,
                  url: url,
                  size: v.object.resolveType == 'Blob'
                      ? (v.object as GhObjectBlob).byteSize
                      : null,
                );
              }),
            );
          case 'Blob':
            // TODO: Markdown base path
            // basePaths: [owner, name, branch, ...paths]
            return BlobView(
              path,
              text: (data as GhObjectBlob).text,
              networkUrl:
                  'https://raw.githubusercontent.com/$owner/$name/$branch/$path', // TODO: private
            );
          default:
            return null;
        }
      },
    );
  }
}
