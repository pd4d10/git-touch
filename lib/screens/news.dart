import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../scaffolds/list.dart';
import '../widgets/event_item.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';
import '../widgets/action.dart';

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

  Future<ListPayload<EventPayload, int>> fetchEvents([int page = 1]) async {
    var settings = SettingsProvider.of(context);
    var login = settings.activeLogin;
    List data = await settings.getWithCredentials(
        '/users/$login/received_events?page=$page&per_page=$pageSize');
    // print(data.length);
    var hasMore = data.length == pageSize;
    var events = data
        .map<EventPayload>((item) => EventPayload.fromJson(item))
        .where(testEvents)
        .toList();

    return ListPayload(
      cursor: page + 1,
      hasMore: hasMore,
      items: events,
    );
  }

  bool testEvents(EventPayload event) {
    switch (filter) {
      case NewsFilter.github:
        return ![
          'IssueCommentEvent',
          'IssuesEvent',
          'PullRequestEvent',
          'PullRequestReviewEvent',
          'PullRequestReviewCommentEvent',
        ].contains(event.type);
      default:
        return true;
    }
  }

  @override
  Widget build(context) {
    return ListScaffold<EventPayload, int>(
      title: Text('News'),
      itemBuilder: (payload) => EventItem(payload),
      onRefresh: fetchEvents,
      onLoadMore: (page) => fetchEvents(page),
      trailingBuiler: ({refresh}) {
        return ActionButton(
          title: 'Filter',
          actions: [
            Action(
              text: 'Show all items',
              onPress: () {
                filter = NewsFilter.all;
                refresh(force: true);
              },
            ),
            Action(
              text: 'Only GitHub items',
              onPress: () {
                filter = NewsFilter.github;
                refresh(force: true);
              },
            ),
          ],
        );
      },
    );
  }
}
