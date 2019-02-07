import 'package:flutter/material.dart';

class NotificationProvider extends StatefulWidget {
  final Widget child;

  NotificationProvider({@required this.child});

  static _NotificationProviderState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedNotificationProvider)
            as _InheritedNotificationProvider)
        .data;
  }

  @override
  _NotificationProviderState createState() => new _NotificationProviderState();
}

class _NotificationProviderState extends State<NotificationProvider> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  void setCount(int value) {
    setState(() {
      count = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedNotificationProvider(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedNotificationProvider extends InheritedWidget {
  final _NotificationProviderState data;

  _InheritedNotificationProvider({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedNotificationProvider old) => true;
}
