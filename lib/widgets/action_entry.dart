import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class ActionEntry extends StatelessWidget {
  final IconData? iconData;
  final String? url;
  final VoidCallback? onTap;
  ActionEntry({this.url, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    switch (theme.theme) {
      case AppThemeType.cupertino:
        return CupertinoButton(
          minSize: 0,
          child: Icon(iconData, size: 22),
          padding: EdgeInsets.zero,
          onPressed: () {
            if (onTap != null) onTap!();
            if (url != null) theme.push(context, url!);
          },
        );
      default:
        return IconButton(
          icon: Icon(iconData),
          onPressed: () {
            if (onTap != null) onTap!();
            if (url != null) theme.push(context, url!);
          },
        );
    }
  }
}
