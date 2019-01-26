import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'package:git_flux/utils/utils.dart';

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
