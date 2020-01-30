import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/gh.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';

final objectRouter = RouterScreen(
  '/:owner/:name/blob/:ref',
  (context, params) => ObjectScreen(
    params['owner'].first,
    params['name'].first,
    params['ref'].first,
    paths: params['path']?.first?.urldecode?.split('/') ?? [],
  ),
);

class ObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;
  final List<String> paths;

  ObjectScreen(this.owner, this.name, this.branch, {this.paths = const []});

  String get _expression => '$branch:$_path';
  String get _extname {
    if (paths.isEmpty) return '';
    var dotext = p.extension(paths.last);
    if (dotext.isEmpty) return '';
    return dotext.substring(1);
  }

  String get _path => paths.join('/');
  bool get _isImage => ['png', 'jpg', 'jpeg', 'gif', 'webp'].contains(_extname);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GhObjectGitObject>(
      canRefresh: !_isImage,
      title: AppBarTitle(_path.isEmpty ? 'Files' : _path),
      fetchData: () async {
        final res = await Provider.of<AuthModel>(context)
            .gqlClient
            .execute(GhObjectQuery(
              variables: GhObjectArguments(
                owner: owner,
                name: name,
                expression: _expression,
              ),
            ));
        final data = res.data.repository.object;

        if (data.resolveType == 'Tree') {
          (data as GhObjectTree).entries.sort((a, b) {
            if (a.type == 'tree' && b.type == 'blob') {
              return -1;
            }
            if (a.type == 'blob' && b.type == 'tree') {
              return 1;
            }
            return 0;
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
                final p = [...paths, v.name].join('/').urlencode;

                return ObjectTreeItem(
                  name: v.name,
                  type: v.type,
                  url: '/$owner/$name/blob/$branch?path=$p',
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
              _path,
              text: (data as GhObjectBlob).text,
              networkUrl:
                  'https://raw.githubusercontent.com/$owner/$name/$branch/$_path', // TODO: private
            );
          default:
            return null;
        }
      },
    );
  }
}
