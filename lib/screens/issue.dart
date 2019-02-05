import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import '../widgets/list_scaffold.dart';
import '../widgets/timeline_item.dart';

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

class IssueScreen extends StatefulWidget {
  final int id;
  final String owner;
  final String name;

  IssueScreen(this.id, this.owner, this.name);

  @override
  _IssueScreenState createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  Map<String, dynamic> payload;

  Widget _buildHeader() {
    return Text('issue');
  }

  get _fullName => widget.owner + '/' + widget.name;

  List get _items => payload == null ? [] : payload['timeline']['nodes'];

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text(_fullName + ' #' + widget.id.toString()),
      header: payload == null ? null : _buildHeader(),
      itemCount: _items.length,
      itemBuilder: (context, index) => TimelineItem(_items[index], payload),
      onRefresh: () async {
        var _payload = await queryIssue(widget.id, widget.owner, widget.name);
        setState(() {
          payload = _payload;
        });
      },
      // onLoadMore: () => ,
    );
  }
}
