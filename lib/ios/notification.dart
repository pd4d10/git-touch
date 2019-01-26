import 'dart:core';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/cupertino.dart' hide Notification;
import 'package:git_flux/providers/notification.dart';
import 'package:git_flux/screens/screens.dart';
import 'package:git_flux/utils/utils.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  Widget _getRouteWidget(String type) {
    switch (type) {
      case 'Issue':
      case 'PullRequest':
        return IssueScreen();
      default:
        throw new Exception('Unhandled notification type: $type');
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
        throw new Exception('Unhandled icon type: $type');
    }
  }

  Widget _buildItem(BuildContext context, Notification item) {
    return Material(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
                builder: (context) => _getRouteWidget(item.subject.type)),
          );
        },
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(_buildIconData(item.subject.type),
                    color: CupertinoColors.inactiveGray),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(item.subject.title,
                                  style: TextStyle(height: 1)),
                              Padding(padding: EdgeInsets.only(top: 4)),
                              Text(TimeAgo.format(item.updatedAt),
                                  style: TextStyle(fontSize: 12))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.inactiveGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupItem(BuildContext context, NotificationGroup group) {
    return Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, left: 4, bottom: 4),
            color: CupertinoColors.extraLightBackgroundGray,
            child: Text(
              group.fullName,
              style: TextStyle(color: CupertinoColors.black),
            ),
          ),
          Column(
              children:
                  group.items.map((item) => _buildItem(context, item)).toList())
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    NotificationBloc bloc = NotificationProvider.of(context);
    TextStyle _textStyle = DefaultTextStyle.of(context).style;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: StreamBuilder<int>(
          stream: bloc.active,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Text("loading...");
            }
            return SizedBox.expand(
              child: DefaultTextStyle(
                style: _textStyle,
                child: CupertinoSegmentedControl(
                  groupValue: snapshot.data,
                  onValueChanged: (int index) {
                    bloc.activeUpdate.add(index);
                  },
                  children: {
                    0: Text('Unread'),
                    1: Text('Paticipating'),
                    2: Text('All')
                  },
                ),
              ),
            );
          },
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: StreamBuilder<List<NotificationGroup>>(
              stream: bloc.items,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Text('loading...');
                }

                return ListView(
                    shrinkWrap: true,
                    children: snapshot.data
                        .map((group) => _buildGroupItem(context, group))
                        .toList());
              },
            ),
          )
        ],
      ),
    );
  }
}
