import 'package:flutter/material.dart';
import 'package:git_touch/models/settings.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../scaffolds/list.dart';
import '../utils/utils.dart';
import '../widgets/link.dart';
import '../screens/issue.dart';

class IssuesScreen extends StatelessWidget {
  final String owner;
  final String name;
  final bool isPullRequest;

  IssuesScreen({
    @required this.owner,
    @required this.name,
    this.isPullRequest = false,
  });

  Future<ListPayload> _query(BuildContext context, [String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    var resource = isPullRequest ? 'pullRequests' : 'issues';

    var data = await Provider.of<SettingsModel>(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    $resource(states: OPEN, orderBy: {field: CREATED_AT, direction: DESC}, first: $pageSize$cursorChunk) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        number
        title
        updatedAt
        author {
          login
          avatarUrl
        }
        labels(first: 10) {
          nodes {
            name
            color
          }
        }
        comments {
          totalCount
        }
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
    return isPullRequest ? Octicons.git_pull_request : Octicons.issue_opened;
  }

  Widget _buildItem(payload) {
    return Link(
      screenBuilder: (context) {
        return IssueScreen(
          number: payload['number'],
          owner: owner,
          name: name,
          isPullRequest: isPullRequest,
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        // color: payload.unread ? Colors.white : Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(_buildIconData(), color: Palette.green, size: 16),
                SizedBox(width: 6),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: join(SizedBox(height: 8), [
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
                          payload['title'] + ' (#${payload['number']})',
                          style: TextStyle(
                            fontSize: 16,
                            color: PrimerColors.gray900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if ((payload['labels']['nodes'] as List).isNotEmpty)
                          Wrap(
                            spacing: 2,
                            runSpacing: 2,
                            children: (payload['labels']['nodes'] as List)
                                .map((label) {
                              final color = convertColor(label['color']);
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 3),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                child: Text(
                                  label['name'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: getFontColorByBrightness(color),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 13, color: PrimerColors.gray700),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Avatar(
                                login: payload['author']['login'],
                                url: payload['author']['avatarUrl'],
                                size: 8,
                              ),
                              SizedBox(width: 4),
                              Text(
                                payload['author']['login'],
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(' opened ' +
                                  timeago.format(
                                      DateTime.parse(payload['updatedAt']))),
                              if (payload['comments']['totalCount'] > 0) ...[
                                Expanded(child: SizedBox()),
                                Icon(Octicons.comment,
                                    size: 13, color: PrimerColors.gray700),
                                SizedBox(width: 4),
                                Text(numberFormat
                                    .format(payload['comments']['totalCount']))
                              ],
                            ],
                          ),
                        )
                      ]),
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
      title: AppBarTitle(
          (isPullRequest ? 'Pull requests' : 'Issues') + ' of $owner/$name'),
      onRefresh: () => _query(context),
      onLoadMore: (cursor) => _query(cursor),
      itemBuilder: _buildItem,
    );
  }
}
