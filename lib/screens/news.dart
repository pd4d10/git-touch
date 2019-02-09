import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../scaffolds/list.dart';
import '../widgets/event_item.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';

class NewsScreen extends StatefulWidget {
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  Future<List<Event>> fetchEvents(int page) async {
    var settings = SettingsProvider.of(context);
    var login = settings.activeLogin;
    List data = await settings.getWithCredentials(
        '/users/$login/received_events?page=$page&per_page=$pageSize');
    // print(data);
    return data.map<Event>((item) => Event.fromJSON(item)).toList();
  }

  @override
  Widget build(context) {
    // FIXME: can't add generic type here. Don't know why
    // type '(Event) => EventItem' is not a subtype of type '(dynamic) => Widget'
    return ListScaffold(
      title: Text('News'),
      itemBuilder: (payload) => EventItem(payload),
      onRefresh: () async {
        var page = 1;
        var items = await fetchEvents(page);
        return ListPayload(
            cursor: page + 1, hasMore: items.length == pageSize, items: items);
      },
      onLoadMore: (page) async {
        var items = await fetchEvents(page);
        return ListPayload(
            cursor: page + 1, hasMore: items.length == pageSize, items: items);
      },
    );
  }
}
