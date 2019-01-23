import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import '../utils.dart';
import '../models/notification.dart';

Future<List<NotificationItem>> fetchNotifications([int index = 0]) async {
  String search = '';
  if (index == 1) {
    search = '?paticipating=true';
  } else if (index == 2) {
    search = '?all=true';
  }
  List data = await getWithCredentials('/notifications$search');
  // print(data.length);
  return data
      .map<NotificationItem>((item) => NotificationItem.fromJson(item))
      .toList();
}

class NotificationBloc {
  final _items = BehaviorSubject<List<NotificationItem>>(seedValue: []);
  final _active = BehaviorSubject(seedValue: 0);
  final _loading = BehaviorSubject(seedValue: false);

  Stream<List<NotificationItem>> get items => _items.stream;
  Stream<int> get active => _active.stream;
  Stream<bool> get loading => _loading.stream;

  Sink<int> get activeUpdate => _active.sink;

  NotificationBloc() {
    _active.stream.listen((int index) async {
      _loading.add(true);
      _items.add(await fetchNotifications(index));
      _loading.add(false);
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
