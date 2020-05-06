import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/gist_files_item.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import 'package:github/github.dart';
import 'package:github/github.dart';

class GhGistsFilesScreen extends StatelessWidget {
  final String id;
  GhGistsFilesScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    // final Future<GithubGistsItem> gist = _query(context);
    return RefreshStatefulScaffold(
      title: AppBarTitle('Files'),
      fetchData: () async {
        final data = await auth.ghClient.getJSON(
          '/gists/$id',
          convert: (vs) => GithubGistsItem.fromJson(vs),
        );
        // print(data.fileNames);
        return data;
      },
      bodyBuilder: (payload, _) {
        return ObjectTree(
          items: payload.fileNames.values.map((v) {
            return ObjectTreeItem(
              url: '',
              type: v.type,
              name: v.filename,
              downloadUrl: v.rawUrl,
            );
          }),
        );
      },
    );
  }
}
