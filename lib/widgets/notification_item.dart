import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import '../screens/issue.dart';
import '../screens/pull_request.dart';
import 'link.dart';

class NotificationPayload {
  String id;
  String type;
  String owner;
  String name;
  int number;
  String title;
  String updateAt;
  bool unread;

  NotificationPayload.fromJson(input) {
    id = input['id'];
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

class NotificationItem extends StatefulWidget {
  final NotificationPayload payload;
  final Function markAsRead;

  NotificationItem({
    Key key,
    @required this.payload,
    @required this.markAsRead,
  }) : super(key: key);

  @override
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  NotificationPayload get payload => widget.payload;
  bool loading = false;

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

  Widget _buildCheckIcon() {
    return Icon(
      payload.unread ? Octicons.check : Octicons.primitive_dot,
      color: loading ? Colors.black12 : Colors.black45,
      size: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Link(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => _buildRoute()),
        );
      },
      child: Opacity(
        opacity: payload.unread ? 1 : 0.5,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Icon(_buildIconData(), color: Colors.black45, size: 20),
              ),
              Expanded(
                child: Text(
                  payload.title,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Link(
                child: _buildCheckIcon(),
                onTap: () async {
                  if (payload.unread && !loading) {
                    setState(() {
                      loading = true;
                    });
                    try {
                      await patchWithCredentials(
                          '/notifications/threads/' + payload.id);
                      widget.markAsRead();
                    } finally {
                      setState(() {
                        loading = false;
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
