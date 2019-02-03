import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/list_scaffold.dart';
import '../widgets/event_item.dart';
import '../utils/utils.dart';

class NewsScreen extends StatefulWidget {
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  int page = 1;
  List<Event> _events = [];

  @override
  Widget build(context) {
    return ListScaffold(
      title: 'News',
      itemCount: _events.length,
      itemBuilder: (context, index) => EventItem(_events[index]),
      onRefresh: () async {
        page = 1;
        var items = await fetchEvents(page);
        setState(() {
          _events = items;
        });
      },
      onLoadMore: () async {
        page = page + 1;
        var items = await fetchEvents(page);
        setState(() {
          _events.addAll(items);
        });
      },
    );
  }
}
