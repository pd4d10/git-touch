import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

Future queryIssue(int id, String owner, String name) async {
  var data = await query('''
{
  repository(owner: "$owner", name: "$name") {
    issue(number: $id) {
      $graphqlChunk1
      timeline(first: $pageSize) {
        pageInfo {
          hasNextPage
          endCursor
        }
        nodes {
          $graghqlChunk
        }
      }
    }
  }
}
''');
  return data['repository']['issue'];
}

class IssueScreen extends StatelessWidget {
  final int id;
  final String owner;
  final String name;

  IssueScreen(this.id, this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return IssuePullRequestScreen(
      id: id,
      owner: owner,
      name: name,
      init: () => queryIssue(id, owner, name),
      extra: Row(
        children: <Widget>[Text('test')],
      ),
    );
  }
}
