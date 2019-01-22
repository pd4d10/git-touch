import 'dart:async';
import '../utils.dart';
import 'package:flutter/cupertino.dart';
import '../models/notification.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  int tabIndex = 0;
  bool loading = false;
  List<NotificationItem> items = [];

  initState() {
    super.initState();
    initFetch();
  }

  initFetch() async {
    items = await fetchNotifications('all');
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  _onChange(int value) async {
    setState(() {
      loading = true;
      tabIndex = value;
    });
    items = await fetchNotifications('all');
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          CupertinoSegmentedControl(
            groupValue: tabIndex,
            onValueChanged: _onChange,
            children: {
              0: Text('Unread'),
              1: Text('Paticipating'),
              2: Text('All')
            },
          ),
          Flexible(
            child: loading
                ? CupertinoActivityIndicator()
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => RichText(
                          text: TextSpan(
                              text: items[index].id,
                              style: TextStyle(color: CupertinoColors.black)),
                        )),
          )
        ],
      ),
    );
  }
}
