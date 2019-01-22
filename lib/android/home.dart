import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/event.dart';
import '../utils.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  // HomePage({Key key, this.title, this.message}) : super(key: key);
  HomePage(this.message);

  // final String title;
  final Function message;

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 1;
  List<Event> events = [];
  bool isLoading = false;

  loadFirst() async {
    var data = await fetchEvents();
    setState(() {
      events.clear();
      events.addAll(data);
      // print(events);
      page = 1;
      // isLoading = false;
    });
    return data;
  }

  loadMore() async {
    // if (isLoading) return;
    // print('more');
    setState(() {
      isLoading = true;
    });
    var data = await fetchEvents(page + 1);
    setState(() {
      events.addAll(data);
      // print(events.length);
      page++;
      isLoading = false;
    });
  }

  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  build(BuildContext context) {
    return FutureBuilder(
      future: loadFirst(),
      builder: (context, snapshot) {
        Widget widget;
        if (snapshot.hasData) {
          widget = RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              await loadFirst();
              return null;
            },
            child: ListView.builder(
              // reverse: true,
              itemBuilder: (context, index) {
                try {
                  if (index >= events.length) {
                    // print(events.length);
                    if (!isLoading) {
                      // print('index: $index');
                      // print('length: ${events.length}');
                      loadMore();
                    }
                    return Text('Loading...');
                    // print(index);
                    // Load next page
                    // return CupertinoActivityIndicator();
                    // if (isLoading) {
                    //   return Text('Loading...');
                    // } else {
                    //   // print(isLoading);
                    //   // setState(() {
                    //   // isLoading = true;
                    //   // });
                    //   return CupertinoRefreshControl();
                    // }
                    // return Text('Loading...');
                  }

                  return EventItem(events[index]);
                } catch (err) {
                  return Text(err.toString());
                  // return null;
                }
              },
            ),
          );
        } else if (snapshot.hasError) {
          widget = Text("${snapshot.error}");
        } else {
          widget = CupertinoActivityIndicator();
          // widget = null;
        }

        return widget;
      },
    );
  }
}
