import 'package:flutter/material.dart';
import '../scaffolds/list.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';
import '../widgets/link.dart';
import '../screens/pull_request.dart';
import '../screens/issue.dart';

class IssuesScreen extends StatefulWidget {
  final String owner;
  final String name;
  final bool isPullRequest;

  IssuesScreen({
    @required this.owner,
    @required this.name,
    this.isPullRequest = false,
  });

  @override
  _IssuesScreenState createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  get owner => widget.owner;
  get name => widget.name;
  get isPullRequest => widget.isPullRequest;

  Future<ListPayload> _query([String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    var resource = isPullRequest ? 'pullRequests' : 'issues';

    var data = await SettingsProvider.of(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    $resource(states: OPEN, first: $pageSize$cursorChunk) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        number
        title
        updatedAt
      }
    }
  }
}
    ''');

    var repo = data["repository"][resource];

    return ListPayload(
      cursor: repo["pageInfo"]["endCursor"],
      hasMore: repo['pageInfo']['hasNextPage'],
      items: repo["nodes"],
    );
  }

  IconData _buildIconData() {
    return widget.isPullRequest
        ? Octicons.git_pull_request
        : Octicons.issue_opened;
  }

  Widget _buildItem(payload) {
    return Link(
      screenBuilder: (context) {
        if (widget.isPullRequest) {
          return PullRequestScreen(
            number: payload['number'],
            owner: owner,
            name: name,
          );
        } else {
          return IssueScreen(
            number: payload['number'],
            owner: owner,
            name: name,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
        // color: payload.unread ? Colors.white : Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 8, top: 4),
                  child: Icon(_buildIconData(), color: Palette.green),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text(
                        //   owner +
                        //       '/' +
                        //       name +
                        //       ' #' +
                        //       payload['number'].toString(),
                        //   style: TextStyle(fontSize: 13, color: Colors.black54),
                        // ),
                        // Padding(padding: EdgeInsets.only(top: 4)),
                        Text(
                          payload['title'],
                          style: TextStyle(fontSize: 15),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(padding: EdgeInsets.only(top: 6)),
                        Text(
                          payload['updatedAt'],
                          style: TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.w300,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Column(
                //   children: <Widget>[
                //     Icon(Octicons.check, color: Colors.black45),
                //     Icon(Octicons.unmute, color: Colors.black45)
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text('Issues of $owner/$name'),
      onRefresh: () => _query(),
      onLoadMore: (cursor) => _query(cursor),
      itemBuilder: _buildItem,
    );
  }
}
