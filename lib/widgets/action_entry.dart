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
        return GestureDetector(
          child: Icon(iconData),
          onTap: onTap,
        );
      default:
        return IconButton(
          icon: Icon(iconData),
          onPressed: onTap,
        );
    }
  }
}
