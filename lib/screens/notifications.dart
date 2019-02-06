import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/refresh_scaffold.dart';
import '../providers/notification.dart';
import '../widgets/notification_item.dart';
import '../widgets/list_group.dart';
import '../widgets/link.dart';
import '../utils/utils.dart';

Future<List<NotificationPayload>> fetchNotifications([int page = 1]) async {
  List items = await getWithCredentials('/notifications?page=$page&all=true');
  return items.map((item) => NotificationPayload.fromJson(item)).toList();
}

class NotificationGroup {
  String repo;
  List<NotificationPayload> items = [];

  NotificationGroup(this.repo);
}

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  int active = 0;
  bool loading = false;
  Map<String, NotificationGroup> groupMap = {};

  Widget _buildGroupItem(String key, NotificationGroup group) {
    var repo = group.repo;
    return ListGroup(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              repo,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Link(
              onTap: () async {
                await putWithCredentials('/repos/$repo/notifications');
                await _refresh();
              },
              child: Icon(
                Octicons.check,
                color: Colors.black45,
                size: 20,
              ),
            ),
          ],
        ),
        items: group.items,
        itemBuilder: (item, index) {
          return NotificationItem(
            payload: item,
            markAsRead: () {
              setState(() {
                groupMap[key].items[index].unread = false;
              });
            },
          );
        });
  }

  Future<void> _onSwitchTab(BuildContext context, int index) async {
    // setState(() {
    //   active = index;
    //   loading = true;
    // });

    var ns = await fetchNotifications();

    // NotificationProvider.of(context).setCount(ns.length);

    Map<String, NotificationGroup> _groupMap = {};
    ns.forEach((item) {
      String repo = item.owner + '/' + item.name;
      if (_groupMap[repo] == null) {
        _groupMap[repo] = NotificationGroup(repo);
      }

      _groupMap[repo].items.add(item);
    });

    setState(() {
      groupMap = _groupMap;
      // loading = false;
    });
  }

  // TODO: filter
  // CupertinoSegmentedControl(
  //                 groupValue: active,
  //                 onValueChanged: (index) => _onSwitchTab(context, index),
  //                 children: {
  //                   0: Text('Unread'),
  //                   1: Text('Paticipating'),
  //                   2: Text('All')
  //                 },
  //               )

  Future<void> _refresh() async {
    print('onrefresh');
    await _onSwitchTab(context, active);
  }

  @override
  Widget build(context) {
    return RefreshScaffold(
      title: Text('Notifications'),
      onRefresh: _refresh,
      bodyBuilder: () {
        var children = groupMap.entries
            .map((entry) => _buildGroupItem(entry.key, entry.value))
            .toList();

        return Column(children: children);
      },
    );
  }
}
