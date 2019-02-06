import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/refresh_scaffold.dart';
import '../providers/notification.dart';
import '../widgets/notification_item.dart';
import '../widgets/list_group.dart';
import '../widgets/link.dart';
import '../utils/utils.dart';

String getRepoKey(NotificationGroup group) {
  return '_' + group.owner + '_' + group.name;
}

String getItemKey(NotificationPayload item) {
  return '_' + item.number.toString();
}

Future<Map<String, NotificationGroup>> fetchNotifications(
    [int page = 1]) async {
  List items = await getWithCredentials(
      '/notifications?page=$page&all=true&per_page=100');
  var ns = items.map((item) => NotificationPayload.fromJson(item)).toList();

  Map<String, NotificationGroup> _groupMap = {};

  ns.forEach((item) {
    String repo = item.owner + '/' + item.name;
    if (_groupMap[repo] == null) {
      _groupMap[repo] = NotificationGroup(item.owner, item.name);
    }

    _groupMap[repo].items.add(item);
  });

  var schema = '{';
  _groupMap.forEach((repo, group) {
    var repoKey = getRepoKey(group);
    schema +=
        '$repoKey: repository(owner: "${group.owner}", name: "${group.name}") {';

    group.items.forEach((item) {
      var key = getItemKey(item);

      switch (item.type) {
        case 'Issue':
          schema += '''
$key: issue(number: ${item.number}) {
  state
}
''';
          break;
        case 'PullRequest':
          schema += '''
$key: pullRequest(number: ${item.number}) {
  state
}
''';
          break;
      }
    });

    schema += '}';
  });
  schema += '}';

  // print(schema);
  var data = await query(schema);
  _groupMap.forEach((repo, group) {
    group.items.forEach((item) {
      var itemData = data[getRepoKey(group)][getItemKey(item)];
      if (itemData != null) {
        item.state = itemData['state'];
      }
    });
  });
  // print(data);

  return _groupMap;
}

class NotificationGroup {
  String owner;
  String name;
  get repo => owner + '/' + name;
  List<NotificationPayload> items = [];

  NotificationGroup(this.owner, this.name);
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

    var _groupMap = await fetchNotifications();

    // NotificationProvider.of(context).setCount(ns.length);

    setState(() {
      groupMap = _groupMap;
      // loading = false;
    });
  }

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
        List<Widget> children = [];
        children.add(CupertinoSegmentedControl(
          groupValue: active,
          onValueChanged: (index) => _onSwitchTab(context, index),
          children: {
            0: Text('Unread'),
            1: Text('Paticipating'),
            2: Text('All')
          },
        ));
        children.addAll(groupMap.entries
            .map((entry) => _buildGroupItem(entry.key, entry.value)));

        return Column(children: children);
      },
    );
  }
}
