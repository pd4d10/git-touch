import 'package:flutter/cupertino.dart';
import '../models/notification.dart';
import '../providers/notification.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  initState() {
    super.initState();
    // initFetch();
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(context) {
    NotificationBloc bloc = NotificationProvider.of(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          StreamBuilder<int>(
            stream: bloc.active,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Text("loading...");
              }

              return CupertinoSegmentedControl(
                groupValue: snapshot.data,
                onValueChanged: (int index) {
                  bloc.activeUpdate.add(index);
                },
                children: {
                  0: Text('Unread'),
                  1: Text('Paticipating'),
                  2: Text('All')
                },
              );
            },
          ),
          StreamBuilder<bool>(
              stream: bloc.loading,
              builder: (context, snapshot) {
                return Flexible(
                  child: snapshot.data == null || snapshot.data
                      ? CupertinoActivityIndicator()
                      : StreamBuilder<List<NotificationItem>>(
                          stream: bloc.items,
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Text('loading...');
                            }

                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return RichText(
                                  text: TextSpan(
                                    text: snapshot
                                        .data[index].repository.fullName,
                                    style:
                                        TextStyle(color: CupertinoColors.black),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                );
              }),
        ],
      ),
    );
  }
}
