import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:primer/primer.dart';
import 'package:file_icon/file_icon.dart';

class ObjectTreeItem extends StatelessWidget {
  final String type;
  final String name;
  final int? size;
  final String? url;
  final String? downloadUrl;

  const ObjectTreeItem({
    required this.type,
    required this.name,
    this.size,
    this.url,
    this.downloadUrl,
  });

  Widget _buildIcon() {
    switch (type) {
      case 'blob': // github gql, gitlab
      case 'file': // github rest, gitea
      case 'commit_file': // bitbucket
        return FileIcon(name, size: 36);
      case 'tree': // github gql, gitlab
      case 'dir': // github rest, gitea
      case 'commit_directory': // bitbucket
        return Icon(
          Octicons.file_directory,
          color: PrimerColors.blue300,
          size: 24,
        );
      case 'commit':
        return Icon(
          Octicons.file_submodule,
          color: PrimerColors.blue300,
          size: 24,
        );
      default:
        throw 'object type error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableViewItem(
      leftWidget: _buildIcon(),
      text: Text(name),
      rightWidget: size == null ? null : Text(filesize(size)),
      url: [
        // Let system browser handle these files
        //
        // TODO:
        // Unhandled Exception: PlatformException(Error, Error while launching
        // https://github.com/flutter/flutter/issues/49162

        // Docs
        'pdf', 'docx', 'doc', 'pptx', 'ppt', 'xlsx', 'xls',
        // Fonts
        'ttf', 'otf', 'eot', 'woff', 'woff2',
        'svg',
      ].contains(name.ext)
          ? downloadUrl
          : url,
      hideRightChevron: size != null,
    );
  }
}
