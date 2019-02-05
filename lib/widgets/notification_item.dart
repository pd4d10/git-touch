import 'dart:core';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/cupertino.dart' hide Notification;
import '../utils/utils.dart';
import '../screens/issue.dart';
import '../screens/pull_request.dart';
import 'link.dart';

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
        color: payload.unread ? Colors.white : Colors.black12,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Octicons.check, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
