import 'package:flutter/material.dart';
import '../providers/settings.dart';

class Link extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onTap;

  Link({@required this.child, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: Colors.white,
        child: InkWell(
          splashColor:
              SettingsProvider.of(context).layout == LayoutMap.cupertino
                  ? Colors.transparent
                  : null,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
