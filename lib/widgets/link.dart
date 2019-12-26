import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';

class Link extends StatelessWidget {
  final Widget child;
  final String url;
  final Function onTap;

  Link({
    this.child,
    this.url,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return Material(
      child: Ink(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        child: InkWell(
          child: child,
          splashColor:
              theme.theme == AppThemeType.cupertino ? Colors.transparent : null,
          onTap: () async {
            if (onTap != null) {
              await onTap();
            }
            theme.push(context, url);
          },
        ),
      ),
    );
  }
}
