import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/list_scaffold.dart';
import '../widgets/notification_item.dart';
import '../utils/utils.dart';

Future<List<NotificationPayload>> fetchNotifications(int page) async {
  List items =
      await getWithCredentials('/notifications?page=$page&per_page=20');
  return items.map((item) => NotificationPayload.fromJson(item)).toList();
}

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

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text('Inbox'),
      onRefresh: () async {
        page = 1;
        var items = await fetchNotifications(page);
        setState(() {
          _items = items;
        });
      },
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
