import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/cupertino.dart' hide Notification;
import '../providers/settings.dart';
import '../screens/screens.dart';
import '../widgets/notification_item.dart';
import '../widgets/loading.dart';
import '../utils/utils.dart';

class NotificationGroup {
  String fullName;
  List<Notification> items = [];

  NotificationGroup(this.fullName);
}

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  int active = 0;
  bool loading = false;
  List<NotificationGroup> groups = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((_) {
      _onSwitchTab(context, 0);
    });
  }

  Widget _buildGroupItem(BuildContext context, int index) {
    var group = groups[index];

    return Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, left: 4, bottom: 4),
            color: CupertinoColors.extraLightBackgroundGray,
            child: Text(
              group.fullName,
              style: TextStyle(color: CupertinoColors.black),
            ),
          ),
          Column(
              children: group.items
                  .map((item) => NotificationItem(item: item))
                  .toList())
        ],
      ),
    );
  }

  void _onSwitchTab(BuildContext context, int index) async {
    setState(() {
      active = index;
      loading = true;
    });

    var ns = await ghClient.activity
        .listNotifications(all: index == 2, participating: index == 1)
        .toList();

    // NotificationProvider.of(context).countUpdate.add(ns.length);

    Map<String, NotificationGroup> groupMap = {};
    ns.forEach((item) {
      String repo = item.repository.fullName;
      if (groupMap[repo] == null) {
        groupMap[repo] = NotificationGroup(repo);
      }

      groupMap[repo].items.add(item);
    });

    setState(() {
      groups = groupMap.values.toList();
      loading = false;
    });
  }

  @override
  Widget build(context) {
    // NotificationBloc bloc = NotificationProvider.of(context);
    TextStyle _textStyle = DefaultTextStyle.of(context).style;

    switch (SettingsProvider.of(context).layout) {
      case LayoutMap.cupertino:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: SizedBox.expand(
              child: DefaultTextStyle(
                style: _textStyle,
                child: CupertinoSegmentedControl(
                  groupValue: active,
                  onValueChanged: (index) => _onSwitchTab(context, index),
                  children: {
                    0: Text('Unread'),
                    1: Text('Paticipating'),
                    2: Text('All')
                  },
                ),
              ),
            ),
          ),
          child: SafeArea(
            child: CustomScrollView(slivers: [
              CupertinoSliverRefreshControl(),
              SliverSafeArea(
                top: false,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index == groups.length) {
                        return Loading(more: true);
                      } else {
                        return _buildGroupItem(context, index);
                      }
                    },
                    childCount: groups.length + 1,
                  ),
                ),
              ),
            ]),
          ),
          //  ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: groups.length,
          //   itemBuilder: _buildGroupItem,
          // ),
        );
      default:
        return Scaffold(
          appBar: AppBar(title: Text('Notification')),
          body: ListView.builder(
            itemCount: groups.length,
            itemBuilder: _buildGroupItem,
          ),
        );
    }
  }
}
