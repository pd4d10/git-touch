import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import '../utils.dart';
import '../models/notification.dart';

class NotificationGroup {
  String fullName;
  List<NotificationItem> items = [];

  NotificationGroup(this.fullName);
}

Future<List<NotificationGroup>> fetchNotifications([int index = 0]) async {
  String search = '';
  if (index == 1) {
    search = '?paticipating=true';
  } else if (index == 2) {
    search = '?all=true';
  }
  List data = await getWithCredentials('/notifications$search');
  Map<String, NotificationGroup> groupMap = {};
  data.forEach((item) {
    String repo = item['repository']['full_name'];
    if (groupMap[repo] == null) {
      groupMap[repo] = NotificationGroup(repo);
    }

    groupMap[repo].items.add(NotificationItem.fromJson(item));
  });
  return groupMap.values.toList();
}

class NotificationBloc {
  final _groups = BehaviorSubject<List<NotificationGroup>>(seedValue: []);
  final _active = BehaviorSubject(seedValue: 0);
  final _loading = BehaviorSubject(seedValue: false);

  Stream<List<NotificationGroup>> get items => _groups.stream;
  Stream<int> get active => _active.stream;
  Stream<bool> get loading => _loading.stream;

  Sink<int> get activeUpdate => _active.sink;

  NotificationBloc() {
    _active.stream.listen((int index) async {
      _loading.add(true);
      _groups.add(await fetchNotifications(index));
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
