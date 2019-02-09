import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import '../scaffolds/long_list.dart';
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

  // TODO: extract as widget, this is copied from pull request
  Widget _buildBadge(payload) {
    Color bgColor;
    IconData iconData;
    String text;

    if (payload['closed']) {
      bgColor = Palette.red;
      iconData = Octicons.issue_closed;
      text = 'Closed';
    } else {
      bgColor = Palette.green;
      iconData = Octicons.issue_opened;
      text = 'Open';
    }
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: <Widget>[
          Icon(iconData, color: Colors.white, size: 15),
          Padding(padding: EdgeInsets.only(left: 2)),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LongListScaffold(
      title: Text(_fullName + ' #' + widget.number.toString()),
      headerBuilder: (payload) {
        return Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        payload['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 8)),
                    _buildBadge(payload),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
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
