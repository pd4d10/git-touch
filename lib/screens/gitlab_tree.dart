import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';

class GitlabTreeScreen extends StatelessWidget {
  final int id;
  final String path;
  GitlabTreeScreen(this.id, {this.path});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return RefreshStatefulScaffold<Iterable<GitlabTreeItem>>(
      title: AppBarTitle(path ?? 'Files'),
      fetchData: () async {
        var url = '/projects/$id/repository/tree';
        if (path != null) {
          url += '?path=' + path;
        }
        final res = await auth.fetchGitlab(url);
        return (res as List).map((v) => GitlabTreeItem.fromJson(v));
      },
      bodyBuilder: (data, _) {
        return ObjectTree(
          items: data.map((item) {
            return ObjectTreeItem(
              type: item.type,
              name: item.name,
              downloadUrl:
                  '${auth.activeAccount.domain}/api/v4/projects/$id/repository/files/${item.path.urlencode}/raw?ref=master', // TODO:
              url: (() {
                switch (item.type) {
                  case 'tree':
                    return '/gitlab/projects/$id/tree?path=${item.path.urlencode}';
                  case 'blob':
                    return '/gitlab/projects/$id/blob?path=${item.path.urlencode}';
                  default:
                    return null;
                }
              })(),
            );
          }),
        );
      },
    );
  }
}
