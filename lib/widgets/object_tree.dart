import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:primer/primer.dart';
import 'package:seti/seti.dart';

class ObjectTreeItem {
  final String url;
  final String name;
  final String type;
  final int size;
  ObjectTreeItem({
    @required this.name,
    @required this.url,
    @required this.type,
    this.size,
  });
}

class ObjectTree extends StatelessWidget {
  final Iterable<ObjectTreeItem> items;
  ObjectTree({@required this.items});

  Widget _buildIcon(ObjectTreeItem item) {
    switch (item.type) {
      case 'blob': // github gql
      case 'file': // github rest, gitea
        return SetiIcon(item.name, size: 36);
      case 'tree': // github gql
      case 'dir': // github rest, gitea
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
    return TableView(
      hasIcon: true,
      items: [
        for (var item in items)
          TableViewItem(
            leftWidget: _buildIcon(item),
            text: Text(item.name),
            rightWidget: item.size == null ? null : Text(filesize(item.size)),
            url: item.url,
            hideRightChevron: item.size != null,
          )
      ],
    );
  }
}
