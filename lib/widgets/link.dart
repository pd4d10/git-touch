import 'package:flutter/material.dart';
import '../providers/settings.dart';

class Link extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onTap;
  final Color bgColor;

  Link({@required this.child, @required this.onTap, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: bgColor ?? Colors.white,
        child: InkWell(
          splashColor: SettingsProvider.of(context).theme == ThemeMap.cupertino
              ? Colors.transparent
              : null,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
