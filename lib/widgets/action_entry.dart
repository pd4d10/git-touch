import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class ActionEntry extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  ActionEntry({this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CupertinoButton(
          minSize: 0,
          child: Icon(iconData, size: 22),
          padding: EdgeInsets.zero,
          onPressed: onTap,
        );
      default:
        return IconButton(
          icon: Icon(iconData),
          onPressed: onTap,
        );
    }
  }
}
