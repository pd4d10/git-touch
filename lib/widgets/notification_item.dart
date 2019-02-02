import 'dart:core';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/cupertino.dart' hide Notification;
import '../utils/utils.dart';
import 'link.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Notification item;

  Widget _buildRoute(Notification item) {
    String type = item.subject.type;
    switch (type) {
      case 'Issue':
      case 'PullRequest':
      // return IssueScreen(item.repository.);
      default:
        // throw new Exception('Unhandled notification type: $type');
        return Text('test');
    }
  }

  IconData _buildIconData(String type) {
    switch (type) {
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
          CupertinoPageRoute(builder: (context) => _buildRoute(item)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                _buildIconData(item.subject.type),
                color: Colors.black45,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.subject.title,
                            style: TextStyle(fontSize: 15),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            TimeAgo.format(item.updatedAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
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
            ),
          ],
        ),
      ),
    );
  }
}
