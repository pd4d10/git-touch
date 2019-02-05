import 'dart:io';
import 'package:flutter/material.dart';

class LayoutMap {
  static const material = 0;
  static const cupertino = 1;
}

class SettingsProvider extends StatefulWidget {
  final Widget child;

  SettingsProvider({@required this.child});

  static _SettingsProviderState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedSettingsProvider)
            as _InheritedSettingsProvider)
        .data;
  }

  @override
  _SettingsProviderState createState() => new _SettingsProviderState();
}

class _SettingsProviderState extends State<SettingsProvider> {
  int layout;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      layout = LayoutMap.cupertino;
    }
    layout = LayoutMap.material;
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedSettingsProvider(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedSettingsProvider extends InheritedWidget {
  final _SettingsProviderState data;

  _InheritedSettingsProvider({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedSettingsProvider old) => true;
}
