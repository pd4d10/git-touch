import 'package:flutter_highlight/themes/github.dart';
import 'package:git_touch/screens/image_view.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/scaffolds/refresh.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:primer/primer.dart';
import 'package:seti/seti.dart';

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

  static const _iconDefaultColor = PrimerColors.blue300;

  List<Widget> _buildIcon(item) {
    switch (item['type']) {
      case 'blob':
        return [
          SizedBox(width: 6),
          SetiIcon(item['name'], size: 28),
          SizedBox(width: 6),
        ];
      case 'tree':
      case 'commit':
        return [
          SizedBox(width: 10),
          Icon(
            item['type'] == 'tree'
                ? Octicons.file_directory
                : Octicons.file_submodule,
            color: _iconDefaultColor,
            size: 20,
          ),
          SizedBox(width: 10),
        ];
      default:
        return [];
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: join(
        BorderView(),
        entries.map((item) {
          return Link(
            screenBuilder: item['type'] == 'commit'
                ? null
                : (context) {
                    // TODO: All image types
                    var ext = path.extension(item['name']);
                    if (ext.isNotEmpty) ext = ext.substring(1);
                    if (['png', 'jpg', 'jpeg', 'gif', 'webp'].contains(ext)) {
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
              height: 40,
              child: Row(
                children: <Widget>[
                  ..._buildIcon(item),
                  Expanded(
                      child: Text(item['name'],
                          style: TextStyle(
                              fontSize: 16, color: PrimerColors.gray900)))
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBlob(payload) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: HighlightView(
        payload['text'],
        language: extname.isEmpty ? 'plaintext' : extname,
        theme: githubTheme,
        padding: EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: AppBarTitle(paths.join('/')),
      onRefresh: () async {
        var data = await Provider.of<SettingsModel>(context).query('''{
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
