import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/event.dart';
import '../providers/event.dart';
import '../models/event.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    // FIXME: context hack
    // Future.delayed(Duration(seconds: 0)).then((_) {
    //   EventProvider.of(context).update.add(true);
    // });
  }

  @override
  Widget build(context) {
    // Navigator.of(context).pushNamed('/user');
    final eventBloc = EventProvider.of(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("GitFlux"),
      ),
      child: StreamBuilder<List<Event>>(
        stream: eventBloc.events,
        builder: (context, snapshot) {
          // print(snapshot.data);
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
              // print(index);
              try {
                return EventItem(snapshot.data[index]);
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
