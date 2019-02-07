import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import '../widgets/list_scaffold.dart';
import '../widgets/timeline_item.dart';
import '../widgets/comment_item.dart';
import '../providers/settings.dart';

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
    return Column(children: <Widget>[
      Container(
        // padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              payload['title'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            CommentItem(payload),
          ],
        ),
      )
    ]);
  }

  get _fullName => widget.owner + '/' + widget.name;

  List get _items => payload == null ? [] : payload['timeline']['nodes'];

  Future queryIssue(
      BuildContext context, int id, String owner, String name) async {
    var data = await SettingsProvider.of(context).query('''
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

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text(_fullName + ' #' + widget.id.toString()),
      header: payload == null ? null : _buildHeader(),
      itemCount: _items.length,
      itemBuilder: (context, index) => TimelineItem(_items[index], payload),
      onRefresh: () async {
        var _payload =
            await queryIssue(context, widget.id, widget.owner, widget.name);
        if (mounted) {
          setState(() {
            payload = _payload;
          });
        }
      },
      // onLoadMore: () => ,
    );
  }
}
