import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/scaffolds/tab_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/notification.dart';
import 'package:git_touch/models/auth.dart';
import '../widgets/notification_item.dart';
import '../widgets/list_group.dart';
import '../widgets/empty.dart';
import '../utils/utils.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  Future<Map<String, NotificationGroup>> fetchNotifications(int index) async {
    List items = await Provider.of<AuthModel>(context).getWithCredentials(
        '/notifications?all=${index == 2}&participating=${index == 1}');
    var ns = items.map((item) => NotificationPayload.fromJson(item)).toList();

    if (index == 0) {
      Provider.of<NotificationModel>(context).setCount(ns.length);
    }

    Map<String, NotificationGroup> _groupMap = {};

    ns.forEach((item) {
      String repo = item.owner + '/' + item.name;
      if (_groupMap[repo] == null) {
        _groupMap[repo] = NotificationGroup(item.owner, item.name);
      }

      _groupMap[repo].items.add(item);
    });

    if (_groupMap.isNotEmpty) {
      // query state of issues and pull requests
      var schema = '{';
      _groupMap.forEach((repo, group) {
        // Check if issue and pull request exist
        if (group.items.where((item) {
          return item.type == 'Issue' || item.type == 'PullRequest';
        }).isEmpty) {
          return;
        }

        schema +=
            '${group.key}: repository(owner: "${group.owner}", name: "${group.name}") {';

        group.items.forEach((item) {
          var key = item.key;

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
      var data = await Provider.of<AuthModel>(context).query(schema);
      _groupMap.forEach((repo, group) {
        group.items.forEach((item) {
          var groupData = data[group.key];
          if (groupData == null) return;

          var itemData = data[group.key][item.key];
          if (itemData != null) {
            item.state = itemData['state'];
          }
        });
      });
      // print(data);
    }

    return _groupMap;
  }

  Widget _buildGroupItem(
      BuildContext context,
      MapEntry<String, NotificationGroup> entry,
      Map<String, NotificationGroup> groupMap) {
    var group = entry.value;
    var repo = group.repo;
    return ListGroup(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            repo,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () async {
              await Provider.of<AuthModel>(context)
                  .putWithCredentials('/repos/$repo/notifications');
              // await _onSwitchTab(); // TODO:
            },
            child: Icon(
              Octicons.check,
              color: Colors.black45,
              size: 24,
            ),
          ),
        ],
      ),
      items: group.items,
      itemBuilder: (item, index) {
        return NotificationItem(
          payload: item,
          markAsRead: () {
            if (mounted) {
              setState(() {
                groupMap[entry.key].items[index].unread = false;
              });
            }
          },
        );
      },
    );
  }

  @override
  Widget build(context) {
    return TabStatefulScaffold(
      title: AppBarTitle('Notifications'),
      tabs: ['Unread', 'Paticipating', 'All'],
      // trailing: GestureDetector(
      //   child: Icon(Icons.more_vert, size: 20),
      //   onTap: () async {
      //     int value = await showCupertinoDialog(
      //       context: context,
      //       builder: (context) {
      //         return CupertinoAlertDialog(
      //           title: Text('Select filter'),
      //           actions: textMap.entries.map((entry) {
      //             return CupertinoDialogAction(
      //               child: Text(entry.value),
      //               onPressed: () {
      //                 Navigator.pop(context, entry.key);
      //               },
      //             );
      //           }).toList(),
      //         );
      //       },
      //     );
      //     _onSwitchTab(value);
      //   },
      // ),
      // trailingBuilder: (_) => IconButton(
      //   icon: Icon(Icons.done_all),
      //   onPressed: () async {
      //     // TODO:
      //     // var value = await Provider.of<ThemeModel>(context)
      //     //     .showConfirm(context, 'Mark all as read?');
      //     // if (value) {
      //     //   await Provider.of<SettingsModel>(context)
      //     //       .putWithCredentials('/notifications');
      //     //   await fetchNotifications(0);
      //     // }
      //   },
      // ),
      onRefresh: fetchNotifications,
      bodyBuilder: (groupMap, activeTab) {
        if (groupMap.isEmpty) return EmptyWidget();

        return Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            ...groupMap.entries
                .map((entry) => _buildGroupItem(context, entry, groupMap))
                .toList()
          ],
        );
      },
    );
  }
}
