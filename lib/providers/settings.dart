import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:git_touch/utils/utils.dart';

class LayoutMap {
  static const material = 0;
  static const cupertino = 1;
}

class SettingsBloc {
  final _layout = BehaviorSubject(seedValue: LayoutMap.material);
  // final _update = StreamController<bool>();

  Stream<int> get layout {
    // _layout.value
  }
  Sink<int> get layoutUpdate => _layout.sink;

  SettingsBloc() {}
}

class EventProvider extends InheritedWidget {
  final SettingsBloc bloc;

  EventProvider({
    Key key,
    Widget child,
    @required SettingsBloc bloc,
  })  : bloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SettingsBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(EventProvider) as EventProvider)
          .bloc;
}
