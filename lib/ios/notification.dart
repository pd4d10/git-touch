import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/notification.dart';
import '../providers/notification.dart';
import 'package:git_flux/screens/repo.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  initState() {
    super.initState();
    // initFetch();
  }

  Widget _buildItem(BuildContext context, NotificationItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            title: 'test', builder: (context) => RepoScreen()));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(Icons.info_outline),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.subject.title),
                  Text(item.updatedAt)
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }

  Widget _buildGroupItem(NotificationGroup group) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: CupertinoColors.extraLightBackgroundGray,
            child: Text(
              group.fullName,
              style: TextStyle(color: CupertinoColors.black),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: group.items.length,
            itemBuilder: (context, index) =>
                _buildItem(context, group.items[index]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    NotificationBloc bloc = NotificationProvider.of(context);
    TextStyle _textStyle = DefaultTextStyle.of(context).style;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: StreamBuilder<int>(
          stream: bloc.active,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Text("loading...");
            }
            return SizedBox.expand(
              child: DefaultTextStyle(
                style: _textStyle,
                child: CupertinoSegmentedControl(
                  groupValue: snapshot.data,
                  onValueChanged: (int index) {
                    bloc.activeUpdate.add(index);
                  },
                  children: {
                    0: Text('Unread'),
                    1: Text('Paticipating'),
                    2: Text('All')
                  },
                ),
              ),
            );
          },
        ),
      ),
      child: Column(
        children: <Widget>[
          StreamBuilder<bool>(
            stream: bloc.loading,
            builder: (context, snapshot) {
              return Flexible(
                child: snapshot.data == null || snapshot.data
                    ? CupertinoActivityIndicator()
                    : StreamBuilder<List<NotificationGroup>>(
                        stream: bloc.items,
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Text('loading...');
                          }

                          List<NotificationGroup> groups = snapshot.data;

                          return ListView.builder(
                            itemCount: groups.length,
                            itemBuilder: (context, i) =>
                                _buildGroupItem(groups[i]),
                          );
                        },
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
