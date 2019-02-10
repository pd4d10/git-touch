import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../scaffolds/refresh_stateless.dart';
import '../providers/notification.dart';
import '../providers/settings.dart';
import '../widgets/notification_item.dart';
import '../widgets/list_group.dart';
import '../widgets/link.dart';
import '../widgets/empty.dart';
import '../utils/utils.dart';

String getRepoKey(NotificationGroup group) {
  return ('_' + group.owner + '_' + group.name).replaceAll('-', '__');
}

String getItemKey(NotificationPayload item) {
  return '_' + item.number.toString();
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
  String error = '';
  int active = 0;
  bool loading = true;
  Map<String, NotificationGroup> groupMap = {};

  @override
  void initState() {
    super.initState();
    nextTick(_onSwitchTab);
  }

  Future<Map<String, NotificationGroup>> fetchNotifications(int index) async {
    List items = await SettingsProvider.of(context).getWithCredentials(
        '/notifications?all=${index == 2}&participating=${index == 1}');
    var ns = items.map((item) => NotificationPayload.fromJson(item)).toList();

    if (index == 0) {
      NotificationProvider.of(context).setCount(ns.length);
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
      var data = await SettingsProvider.of(context).query(schema);
      _groupMap.forEach((repo, group) {
        group.items.forEach((item) {
          var itemData = data[getRepoKey(group)][getItemKey(item)];
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
  ) {
    var group = entry.value;
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
              material: false,
              beforeRedirect: () async {
                await SettingsProvider.of(context)
                    .putWithCredentials('/repos/$repo/notifications');
                await _onSwitchTab();
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
              if (mounted) {
                setState(() {
                  groupMap[entry.key].items[index].unread = false;
                });
              }
            },
          );
        });
  }

  Future<void> _onSwitchTab([int index]) async {
    if (loading) return;

    setState(() {
      error = '';
      if (index != null) {
        active = index;
      }
      loading = true;
    });
    try {
      groupMap = await fetchNotifications(active);
    } catch (err) {
      error = err.toString();
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  var textMap = {
    0: 'Unread',
    1: 'Paticipating',
    2: 'All',
  };

  Widget _buildTitle() {
    switch (SettingsProvider.of(context).theme) {
      case ThemeMap.cupertino:
        // var textStyle = DefaultTextStyle.of(context).style;
        return DefaultTextStyle(
          style: TextStyle(fontSize: 16),
          child: SizedBox.expand(
            child: CupertinoSegmentedControl(
              groupValue: active,
              onValueChanged: _onSwitchTab,
              children: textMap.map((key, text) => MapEntry(key, Text(text))),
            ),
          ),
        );
      default:
        return Text('Notifications');
    }
  }

  void _confirm() async {
    var value = await showConfirm(context, 'Mark all as read?');
    if (value) {
      await SettingsProvider.of(context).putWithCredentials('/notifications');
      await _onSwitchTab();
    }
  }

  @override
  Widget build(context) {
    return RefreshStatelessScaffold(
      title: _buildTitle(),
      bottom: TabBar(
        onTap: _onSwitchTab,
        tabs: textMap.entries.map((entry) => Tab(text: entry.value)).toList(),
      ),
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
      actions: <Widget>[
        IconButton(
          icon: Icon(Octicons.check),
          onPressed: _confirm,
        )
      ],
      onRefresh: _onSwitchTab,
      loading: loading,
      error: error,
      bodyBuilder: () {
        return groupMap.isEmpty
            ? EmptyWidget()
            : Column(
                children: groupMap.entries
                    .map((entry) => _buildGroupItem(context, entry))
                    .toList());
      },
    );
  }
}
