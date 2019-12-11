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
  final List<String> paths;

  GitlabTreeScreen(this.id, {this.paths = const []});

  String get _path => paths.join('/');

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
      title: AppBarTitle(_path.isEmpty ? 'Files' : _path),
      fetchData: () async {
        var url = '/projects/$id/repository/tree';
        if (paths.isNotEmpty) {
          url += '?path=' + paths.join('/');
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
              text: Text(item.path),
              screenBuilder: (_) {
                if (item.type == 'commit') return null;
                return GitlabTreeScreen(
                  id,
                  paths: [...paths, item.path],
                );
              },
            );
          }),
        );
      },
    );
  }
}
