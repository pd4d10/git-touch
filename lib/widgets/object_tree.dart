import 'package:antd_mobile/antd_mobile.dart';
import 'package:file_icon/file_icon.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/utils/utils.dart';

Widget _buildIcon(String type, String name) {
  switch (type) {
    case 'blob': // github gql, gitlab
    case 'file': // github rest, gitea, rhodecode
    case 'commit_file': // bitbucket
      return FileIcon(name, size: 26); // TODO: size
    case 'tree': // github gql, gitlab
    case 'dir': // github rest, gitea, rhodecode
    case 'commit_directory': // bitbucket
      return const Icon(AntIcons.folderOutline);
    case 'commit':
      return const Icon(AntIcons.fileOutline);
    default:
      throw 'object type error';
  }
}

AntListItem createObjectTreeItem({
  required String name,
  required String type,
  required String url,
  String? downloadUrl,
  int? size,
}) {
  return AntListItem(
    prefix: _buildIcon(type, name),
    extra: size == null ? null : Text(filesize(size)),
    onClick: () async {
      final finalUrl = [
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
          : url;
      await launchStringUrl(finalUrl);
    },
    arrow: size == null ? const Icon(AntIcons.rightOutline) : null,
    child: Text(name),
  );
}
