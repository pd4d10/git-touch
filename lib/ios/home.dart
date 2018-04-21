// import 'dart:async';
// import 'dart:convert';
import '../utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/event.dart';

class IosHomeTab extends StatelessWidget {
  @override
  Widget build(context) {
    return new FutureBuilder(
      future: fetchEvents(),
      builder: (context, snapshot) {
        Widget widget;
        if (snapshot.hasData) {
          List<Event> events = snapshot.data;
          widget = new ListView(
            padding: new EdgeInsets.all(8.0),
            // itemExtent: 20.0,
            children: events.map((event) {
              switch (event.type) {
                case 'IssuesEvent':
                  return new IssuesEvent(event);
                case 'PushEvent':
                  return new PushEvent(event);
                case 'PullRequestEvent':
                  return new PullRequestEvent(event);
                default:
                  return new Text('');
              }
            }).toList(),
          );
        } else if (snapshot.hasError) {
          widget = new Text("${snapshot.error}");
        } else {
          widget = new CupertinoActivityIndicator();
        }

        return widget;
        // return new CustomScrollView(slivers: [
        //   new CupertinoRefreshControl(
        //     onRefresh: () {
        //       return fetchEvents();
        //     },
        //   ),
        //   // new CupertinoActivityIndicator(),
        // ]);
      },
    );
  }
}
