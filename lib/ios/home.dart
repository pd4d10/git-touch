import 'dart:async';
// import 'dart:convert';
import '../utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/event.dart';

class IosHomeTab extends StatefulWidget {
  @override
  createState() {
    return new IosHomeTabState();
  }
}

class IosHomeTabState extends State<IosHomeTab> {
  int page = 1;
  List<Event> events = [];

  loadFirst() async {
    events = await fetchEvents();
    page = 1;
    return events;
  }

  loadMore() async {
    events.addAll(await fetchEvents(page + 1));
    page++;
    return events;
  }

  @override
  Widget build(context) {
    return new FutureBuilder(
      future: loadFirst(),
      builder: (context, snapshot) {
        Widget widget;
        if (snapshot.hasData) {
          // List<Event> events = snapshot.data;
          widget = new CustomScrollView(
            slivers: [
              new CupertinoRefreshControl(
                onRefresh: () {
                  return loadFirst();
                },
              ),
              new SliverSafeArea(
                // top: true,
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                    (context, index) {
                      var event = events[index];
                      switch (event.type) {
                        case 'IssuesEvent':
                          return new IssuesEvent(event);
                        case 'PushEvent':
                          return new PushEvent(event);
                        case 'PullRequestEvent':
                          return new PullRequestEvent(event);
                        case 'WatchEvent':
                          return new WatchEvent(event);
                        default:
                          return new Text('Not implement yet');
                      }
                    },
                    childCount: 30,
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          widget = new Text("${snapshot.error}");
        } else {
          widget = new CupertinoActivityIndicator();
        }

        return widget;
      },
    );
  }
}
