import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/list_scaffold.dart';
import '../utils/utils.dart';
import '../screens/issue.dart';
import '../screens/pull_request.dart';
import '../widgets/link.dart';

class NotificationPayload {
  String type;
  String owner;
  String name;
  int number;
  String title;
  String updateAt;
  bool unread;

  NotificationPayload.fromJson(input) {
    type = input['subject']['type'];
    name = input['repository']['name'];
    owner = input['repository']['owner']['login'];

    String url = input['subject']['url'];
    String numberStr = url.split('/').lastWhere((_) => true);
    number = int.parse(numberStr);

    title = input['subject']['title'];
    updateAt = TimeAgo.formatFromString(input['updated_at']);
    unread = input['unread'];
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key key,
    @required this.payload,
  }) : super(key: key);

  final NotificationPayload payload;

  Widget _buildRoute() {
    switch (payload.type) {
      case 'Issue':
        return IssueScreen(payload.number, payload.owner, payload.name);
      case 'PullRequest':
        return PullRequestScreen(payload.number, payload.owner, payload.name);
      default:
        // throw new Exception('Unhandled notification type: $type');
        return Text('test');
    }
  }

  IconData _buildIconData() {
    switch (payload.type) {
      case 'Issue':
        return Octicons.issue_opened;
      // color: Color.fromRGBO(0x28, 0xa7, 0x45, 1),
      case 'PullRequest':
        return Octicons.git_pull_request;
      // color: Color.fromRGBO(0x6f, 0x42, 0xc1, 1),
      default:
        return Octicons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Link(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => _buildRoute()),
        );
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
                  padding: EdgeInsets.only(right: 8, top: 20),
                  child: Icon(_buildIconData(), color: Colors.black45),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          payload.owner +
                              '/' +
                              payload.name +
                              ' #' +
                              payload.number.toString(),
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        Padding(padding: EdgeInsets.only(top: 4)),
                        Text(
                          payload.title,
                          style: TextStyle(fontSize: 15),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(padding: EdgeInsets.only(top: 6)),
                        Text(
                          payload.updateAt,
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
                Column(
                  children: <Widget>[
                    Icon(Octicons.check, color: Colors.black45),
                    Icon(Octicons.unmute, color: Colors.black45)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<NotificationPayload>> fetchNotifications(int page) async {
  List items =
      await getWithCredentials('/notifications?page=$page&per_page=20');
  return items.map((item) => NotificationPayload.fromJson(item)).toList();
}

/// [@deprecated]
class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  // int active = 0;
  int page = 0;
  var payload;
  List<NotificationPayload> _items = [];

  final titleMap = {
    0: 'Unread',
    1: 'Participating',
    2: 'All',
  };

  Future<void> _refresh() async {
    page = 1;
    var items = await fetchNotifications(page);
    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text('Inbox'),
      trailingIconData: Octicons.check,
      trailingOnTap: () async {
        bool answer = await showConfim(context, 'Mark all as read?');
        if (answer == true) {
          await putWithCredentials('/notifications');
          _refresh();
        }
      },
      onRefresh: _refresh,
      onLoadMore: () async {
        page = page + 1;
        var items = await fetchNotifications(page);
        setState(() {
          _items.addAll(items);
        });
      },
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return NotificationItem(payload: _items[index]);
      },
    );
  }
}
