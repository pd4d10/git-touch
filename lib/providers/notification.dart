import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class NotificationBloc {
  final _count = BehaviorSubject(seedValue: 0);
  final _updater = StreamController();

  Stream<int> get count => _count.stream;
  Sink get countUpdate => _updater.sink;

  NotificationBloc() {
    _updater.stream.listen((_) {
      _count.add(99);
    });
  }
}

class NotificationProvider extends InheritedWidget {
  final NotificationBloc bloc;

  NotificationProvider({
    Key key,
    Widget child,
    @required NotificationBloc bloc,
  })  : bloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static NotificationBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(NotificationProvider)
              as NotificationProvider)
          .bloc;
}
