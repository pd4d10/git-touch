import 'package:flutter/material.dart';
import 'package:git_touch/providers/settings.dart';
import 'package:git_touch/scaffolds/refresh.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/link.dart';

class ObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;
  final List<String> paths;

  ObjectScreen({
    @required this.owner,
    @required this.name,
    this.branch = 'master',
    this.paths = const [],
  });

  get expression => '$branch:' + paths.join('/');

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

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: Text(paths.join('/')),
      onRefresh: () async {
        var data = await SettingsProvider.of(context).query('''{
  repository(owner: "$owner", name: "$name") {
    object(expression: "$expression") {
      ... on Tree {
        entries {
          type
          name
        }
      }
    }
  }
}''');
        return data['repository']['object']['entries'];
      },
      bodyBuilder: (payload) {
        return Column(
          children: (payload as List).map((item) {
            return Link(
              screenBuilder: (context) {
                switch (item['type']) {
                  case 'tree':
                    return ObjectScreen(
                      name: name,
                      owner: owner,
                      branch: branch,
                      paths: [...paths, item['name']],
                    );
                  case 'blob': // TODO:
                  default:
                    return null;
                }
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade100))),
                child: Row(
                  children: <Widget>[
                    Icon(_buildIconData(item),
                        color: Color(0x80032f62), size: 20),
                    SizedBox(width: 4),
                    Expanded(
                        child:
                            Text(item['name'], style: TextStyle(fontSize: 16)))
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
