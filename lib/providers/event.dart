import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';
import '../models/event.dart';
import 'package:rxdart/rxdart.dart';
import '../utils.dart';

Future<List<Event>> fetchEvents([int page = 1]) async {
  List data = await getWithCredentials(
    '/users/pd4d10/received_events/public?page=$page',
  );
  return data.map<Event>((item) {
    return Event.fromJson(item);
  }).toList();
}

class EventBloc {
  final _items = BehaviorSubject<List<Event>>(seedValue: []);
  final _page = BehaviorSubject(seedValue: 0);
  final _update = StreamController<bool>();

  // Stream<int> get eventPage => _page.stream;
  Stream<List<Event>> get events => _items.stream;
  Sink<bool> get update => _update.sink;

  EventBloc() {
    _update.stream.listen((bool isRefresh) async {
      if (isRefresh) {
        _items.add(await fetchEvents());
        _page.add(1);
      } else {
        _items.add(await fetchEvents());
        _page.add(_page.value + 1);
      }
    });
  }

  void dispose() {
    _items.close();
    _page.close();
  }
}

class EventProvider extends InheritedWidget {
  final EventBloc bloc;

  EventProvider({
    Key key,
    Widget child,
    @required EventBloc bloc,
  })  : bloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static EventBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(EventProvider) as EventProvider)
          .bloc;
}
