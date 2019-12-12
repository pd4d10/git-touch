import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:primer/primer.dart';
import 'package:seti/seti.dart';

class GitlabTreeScreen extends StatelessWidget {
  final int id;
  final String path;

  GitlabTreeScreen(this.id, {this.path});

  static const _iconDefaultColor = PrimerColors.blue300;

  Widget _buildIcon(GitlabTreeItem item) {
    switch (item.type) {
      case 'blob':
        return SetiIcon(item.path, size: 36);
      case 'tree':
      case 'commit':
        return Icon(
          item.type == 'tree'
              ? Octicons.file_directory
              : Octicons.file_submodule,
          color: _iconDefaultColor,
          size: 24,
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Iterable<GitlabTreeItem>>(
      title: AppBarTitle(path == null ? 'Files' : path),
      fetchData: () async {
        var url = '/projects/$id/repository/tree';
        if (path != null) {
          url += '?path=' + path;
        }
        final res = await Provider.of<AuthModel>(context).fetchGitlab(url);
        return (res as List).map((v) => GitlabTreeItem.fromJson(v));
      },
      bodyBuilder: (data, _) {
        return TableView(
          hasIcon: true,
          items: data.map((item) {
            return TableViewItem(
              leftWidget: _buildIcon(item),
              text: Text(item.name),
              url: (() {
                switch (item.type) {
                  case 'tree':
                    return '/tree/$id?path=${item.path}';
                  case 'blob':
                    return '/blob/$id?path=${item.path}';
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
