import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/notification.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import '../widgets/event_item.dart';
import 'package:git_touch/models/auth.dart';

class NewsScreen extends StatefulWidget {
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  @override
  initState() {
    super.initState();
    // FIXME:
    nextTick(() async {
      // Check if there are unread notification items.
      // 1 item is enough since count is not displayed for now.
      var items = await Provider.of<AuthModel>(context)
          .getWithCredentials('/notifications?per_page=1');

      if (items is List && items.isNotEmpty) {
        Provider.of<NotificationModel>(context).setCount(1);
      }
    });
  }

  Future<ListPayload<EventPayload, int>> fetchEvents([int page = 1]) async {
    final settings = Provider.of<AuthModel>(context);
    final login = settings.activeAccount.login;
    List data = await settings.getWithCredentials(
        '/users/$login/received_events?page=$page&per_page=$pageSize');
    // Fimber.d(data.length);
    var hasMore = data.length == pageSize;
    var events =
        data.map<EventPayload>((item) => EventPayload.fromJson(item)).toList();

    return ListPayload(
      cursor: page + 1,
      hasMore: hasMore,
      items: events,
    );
  }

  @override
  Widget build(context) {
    return ListStatefulScaffold<EventPayload, int>(
      title: AppBarTitle('News'),
      actionBuilder: () {
        return ActionEntry(
          iconData:
              Provider.of<ThemeModel>(context).brightness == Brightness.dark
                  ? Ionicons.md_sunny
                  : Ionicons.md_moon,
          onTap: () {
            Provider.of<ThemeModel>(context).toggleBrightness();
          },
        );
      },
      itemBuilder: (payload) => EventItem(payload),
      onRefresh: fetchEvents,
      onLoadMore: (page) => fetchEvents(page),
    );
  }
}
