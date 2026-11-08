import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/models/notification.dart';
import 'package:git_touch/scaffolds/tab_stateful.dart';
import 'package:git_touch/widgets/empty.dart';
import 'package:git_touch/widgets/list_group.dart';
import 'package:git_touch/widgets/notification_item.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';

class GhNotificationScreen extends StatefulWidget {
  @override
  GhNotificationScreenState createState() => GhNotificationScreenState();
}

class GhNotificationScreenState extends State<GhNotificationScreen> {
  Future<Map<String, NotificationGroup>> fetchNotifications(int index) async {
    final ns = await context.read<AuthModel>().ghClient.getJSON(
          '/notifications?all=${index == 2}&participating=${index == 1}',
          convert: (dynamic vs) =>
              [for (var v in vs) GithubNotificationItem.fromJson(v)],
        );
    if (index == 0) {
      context.read<NotificationModel>().setCount(ns.length);
    }

    final groupMap = <String, NotificationGroup>{};

    for (final item in ns) {
      final repo = item.repository!.fullName ?? ''; // TODO: nullable
      if (groupMap[repo] == null) {
        groupMap[repo] = NotificationGroup(repo);
      }

      groupMap[repo]!.items.add(item);
    }

    if (groupMap.isNotEmpty) {
      // query state of issues and pull requests
      var schema = '{';
      groupMap.forEach((repo, group) {
        // Check if issue and pull request exist
        if (group.items.where((item) {
          return item.subject!.type == 'Issue' ||
              item.subject!.type == 'PullRequest';
        }).isEmpty) {
          return;
        }

        schema +=
            '${group.key}: repository(owner: "${group.owner}", name: "${group.name}") {';

        for (final item in group.items) {
          switch (item.subject!.type) {
            case 'Issue':
              schema += '''
${item.key}: issue(number: ${item.subject!.number}) {
  state
}
''';
              break;
            case 'PullRequest':
              schema += '''
${item.key}: pullRequest(number: ${item.subject!.number}) {
  state
}
''';
              break;
          }
        }

        schema += '}';
      });
      schema += '}';

      if (schema == '{}') return groupMap;

      // Fimber.d(schema);
      final data = await context.read<AuthModel>().query(schema);
      groupMap.forEach((repo, group) {
        for (final item in group.items) {
          final groupData = data[group.key];
          if (groupData == null) continue;

          final itemData = data[group.key][item.key];
          if (itemData != null) {
            item.state = itemData['state'];
          }
        }
      });
      // Fimber.d(data);
    }

    return groupMap;
  }

  Widget _buildGroupItem(
    BuildContext context,
    MapEntry<String, NotificationGroup> entry,
    Map<String, NotificationGroup> groupMap,
  ) {
    final group = entry.value;
    return ListGroup(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            group.fullName!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AntTheme.of(context).colorText,
            ),
          ),
          GestureDetector(
            onTap: () async {
              await context
                  .read<AuthModel>()
                  .ghClient
                  .activity
                  .markRepositoryNotificationsRead(
                      RepositorySlug.full(group.fullName!));
              // await _onSwitchTab(); // TODO:
            },
            child: Icon(
              Ionicons.checkmark_done,
              color: AntTheme.of(context).colorWeak,
              size: 24,
            ),
          ),
        ],
      ),
      items: group.items,
      itemBuilder: (dynamic item, index) {
        return NotificationItem(
          payload: item,
          markAsRead: () {
            if (mounted) {
              setState(() {
                groupMap[entry.key]!.items[index].unread = false;
              });
            }
          },
        );
      },
    );
  }

  @override
  Widget build(context) {
    return TabStatefulScaffold<Map<String, NotificationGroup>>(
      title: Text(AppLocalizations.of(context)!.notification),
      tabs: [
        AppLocalizations.of(context)!.unread,
        AppLocalizations.of(context)!.participating,
        AppLocalizations.of(context)!.all
      ],
      fetchData: fetchNotifications,
      bodyBuilder: (dynamic groupMap, activeTab) {
        if (groupMap.isEmpty) return EmptyWidget();

        return Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            ...groupMap.entries
                .map((entry) => _buildGroupItem(context, entry, groupMap))
                .toList()
          ],
        );
      },
      // actionBuilder: (_, refresh) => ActionEntry(
      //   iconData: Ionicons.checkmark_done,
      //   onTap: () async {
      //     final value = await context
      //         .read<ThemeModel>()
      //         .showConfirm(context, Text('Mark all as read?'));
      //     if (value) {
      //       await context
      //           .read<AuthModel>()
      //           .ghClient
      //           .activity
      //           .markNotificationsRead();
      //       refresh();
      //     }
      //   },
      // ),
    );
  }
}
