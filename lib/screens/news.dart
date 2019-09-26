import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/notification.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import '../widgets/event_item.dart';
import 'package:git_touch/models/settings.dart';

class NewsFilter {
  static const all = 'all';

  /// The same as GitHub dashboard
  ///
  /// Exclude issue and pull request events
  static const github = 'github';
}

class NewsScreen extends StatefulWidget {
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  String filter = NewsFilter.github;

  @override
  initState() {
    super.initState();
    // FIXME:
    nextTick(() async {
      // Check if there are unread notification items.
      // 1 item is enough since count is not displayed for now.
      var items = await Provider.of<SettingsModel>(context)
          .getWithCredentials('/notifications?per_page=1');

      if (items is List && items.isNotEmpty) {
        Provider.of<NotificationModel>(context).setCount(1);
      }
    });
  }

  int get pageSize {
    if (filter == NewsFilter.all) {
      return 30;
    }
    return 60;
  }

  Future<ListPayload<EventPayload, int>> fetchEvents([int page = 1]) async {
    final settings = Provider.of<SettingsModel>(context);
    final login = settings.activeAccount.login;
    List data = await settings.getWithCredentials(
        '/users/$login/received_events?page=$page&per_page=$pageSize');
    // print(data.length);
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
      itemBuilder: (payload) => EventItem(payload),
      onRefresh: fetchEvents,
      onLoadMore: (page) => fetchEvents(page),
    );
  }
}
