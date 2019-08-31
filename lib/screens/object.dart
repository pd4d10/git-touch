import 'package:flutter_highlight/themes/github.dart';
import 'package:git_touch/screens/image_view.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:git_touch/providers/settings.dart';
import 'package:git_touch/scaffolds/refresh.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:primer/primer.dart';

class ObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;
  final List<String> paths;
  final String type;

  ObjectScreen({
    @required this.owner,
    @required this.name,
    this.branch = 'master',
    this.paths = const [],
    this.type = 'tree',
  });

  String get expression => '$branch:' + paths.join('/');
  String get extname {
    if (paths.isEmpty) return '';
    var dotext = path.extension(paths.last);
    if (dotext.isEmpty) return '';
    return dotext.substring(1);
  }

  String get rawUrl =>
      'https://raw.githubusercontent.com/$owner/$name/$branch/' +
      paths.join('/'); // TODO:

  IconData _buildIconData(item) {
    switch (item['type']) {
      case 'tree':
        return Octicons.file_directory;
      case 'blob':
        return Octicons.file;
      default:
        return Octicons.link;
    }
  }

  String get _subQuery {
    switch (type) {
      case 'tree':
        return '''
... on Tree {
  entries {
    type
    name
  }
}
''';
      case 'blob':
      default:
        return '''
... on Blob {
  text
}
''';
    }
  }

  Widget _buildTree(payload) {
    var entries = payload['entries'] as List;
    return Column(
      children: entries.map((item) {
        return Link(
          screenBuilder: (context) {
            // TODO: All image types
            var ext = path.extension(item['name']);
            if (ext.isNotEmpty) ext = ext.substring(1);
            if (['png', 'jpg', 'jpeg'].contains(ext)) {
              return ImageView(NetworkImage('$rawUrl/' + item['name']));
            }
            return ObjectScreen(
              name: name,
              owner: owner,
              branch: branch,
              paths: [...paths, item['name']],
              type: item['type'],
            );
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade100))),
            child: Row(
              children: <Widget>[
                Icon(_buildIconData(item), color: Color(0x80032f62), size: 20),
                SizedBox(width: 8),
                Expanded(
                    child: Text(item['name'],
                        style: TextStyle(
                            fontSize: 16, color: PrimerColors.blue500)))
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBlob(payload) {
    // FIXME:
    return Highlight(
      payload['text'],
      language: extname.isEmpty ? 'plaintext' : extname,
      theme: githubTheme,
      padding: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: Text(paths.join('/')),
      onRefresh: () async {
        var data = await SettingsProvider.of(context).query('''{
  repository(owner: "$owner", name: "$name") {
    object(expression: "$expression") {
      $_subQuery
    }
  }
}''');

        if (type == 'tree') {
          var entries = data['repository']['object']['entries'] as List;
          entries.sort((a, b) {
            if (a['type'] == 'tree' && b['type'] == 'blob') {
              return -1;
            }
            if (a['type'] == 'blob' && b['type'] == 'tree') {
              return 1;
            }
            return 0;
          });
        }

        return data['repository']['object'];
      },
      bodyBuilder: (payload) {
        switch (type) {
          case 'tree':
            return _buildTree(payload);
          case 'blob':
            return _buildBlob(payload);
          default:
            return null;
        }
      },
    );
  }
}
