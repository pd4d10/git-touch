import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import '../widgets/long_list_scaffold.dart';
import '../widgets/timeline_item.dart';
import '../widgets/comment_item.dart';
import '../providers/settings.dart';

class IssueScreen extends StatefulWidget {
  final int number;
  final String owner;
  final String name;

  IssueScreen({
    @required this.number,
    @required this.owner,
    @required this.name,
  });

  IssueScreen.fromFullName({@required this.number, @required String fullName})
      : this.owner = fullName.split('/')[0],
        this.name = fullName.split('/')[1];

  @override
  _IssueScreenState createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  get _fullName => widget.owner + '/' + widget.name;
  get owner => widget.owner;
  get id => widget.number;
  get name => widget.name;

  Future queryIssue() async {
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    issue(number: $id) {
      $graphqlChunk1
      timeline(first: $pageSize) {
        totalCount
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

  Future queryMore(String cursor) async {
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    issue(number: $id) {
      timeline(first: $pageSize, after: $cursor) {
        totalCount
        pageInfo {
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

  Future<List> queryTrailing() async {
    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    issue(number: $id) {
      timeline(last: $pageSize) {
        nodes {
          $graghqlChunk
        }
      }
    }
  }
}
''');
    return data['repository']['issue']['timeline']['nodes'];
  }

  @override
  Widget build(BuildContext context) {
    return LongListScaffold(
      title: Text(_fullName + ' #' + widget.number.toString()),
      headerBuilder: (payload) {
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
      },
      itemBuilder: (itemPayload) => TimelineItem(itemPayload),
      onRefresh: () async {
        var res = await queryIssue();
        int totalCount = res['timeline']['totalCount'];
        String cursor = res['timeline']['pageInfo']['endCursor'];
        List leadingItems = res['timeline']['nodes'];

        var payload = LongListPayload(
          header: res,
          totalCount: totalCount,
          cursor: cursor,
          leadingItems: leadingItems,
          trailingItems: [],
        );

        if (totalCount > 2 * pageSize) {
          payload.trailingItems = await queryTrailing();
        }

        return payload;
      },
      onLoadMore: (String _cursor) async {
        var res = await queryMore(_cursor);
        int totalCount = res['timeline']['totalCount'];
        String cursor = res['timeline']['pageInfo']['endCursor'];
        List leadingItems = res['timeline']['nodes'];

        var payload = LongListPayload(
          totalCount: totalCount,
          cursor: cursor,
          leadingItems: leadingItems,
        );

        return payload;
      },
    );
  }
}
