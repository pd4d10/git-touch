import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:git_flux/utils/utils.dart';

class EventBloc {
  final _items = BehaviorSubject<List<Event>>(seedValue: []);
  final _page = BehaviorSubject(seedValue: 0);
  final _update = StreamController<bool>();

  // Stream<int> get eventPage => _page.stream;
  Stream<List<Event>> get events => _items.stream;
  Sink<bool> get update => _update.sink;

  EventBloc() {
    // _update.stream.listen((bool isRefresh) async {
    //   if (isRefresh) {
    //     _items.add(await fetchEvents(1));
    //     _page.add(1);
    //   } else {
    //     _items.add(await fetchEvents(1));
    //     _page.add(_page.value + 1);
    //   }
    // });
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
