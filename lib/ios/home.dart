// import 'dart:async';
// import 'dart:convert';
import '../utils.dart';
import 'package:flutter/cupertino.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/event.dart';
// import 'user.dart';
import '../models/event.dart';

class IosHomeTab extends StatefulWidget {
  @override
  createState() {
    return IosHomeTabState();
  }
}

class IosHomeTabState extends State<IosHomeTab> {
  int page = 1;
  List<Event> events = [];

  loadFirst() async {
    events = await fetchEvents();
    print(events);
    page = 1;
    return events;
  }

  loadMore() async {
    events.addAll(await fetchEvents(page + 1));
    page++;
    return events;
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: FutureBuilder(
        future: loadFirst(),
        builder: (context, snapshot) {
          Widget widget;
          if (snapshot.hasData) {
            // List<Event> events = snapshot.data;
            // ScrollController(debugLabel: 'aaa', )

            // widget = CupertinoRefreshControl(
            //   // key: _refreshIndicatorKey,
            //   onRefresh: () {
            //     print(1);
            //     loadFirst();
            //   },
            // );
            widget = ListView.builder(itemBuilder: (context, index) {
              print(index);
              try {
                return EventItem(events[index]);
              } catch (err) {
                return Text(err.toString());
//                return null;
              }
            });
          } else if (snapshot.hasError) {
            widget = Text("${snapshot.error}");
          } else {
            widget = CupertinoActivityIndicator();
          }

          return widget;
        },
      ),
    );
  }
}
