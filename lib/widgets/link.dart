import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/settings.dart';

class Link extends StatelessWidget {
  final Widget child;
  final WidgetBuilder screenBuilder;
  final Function beforeRedirect;
  final Color bgColor;
  final bool material;
  final bool fullscreenDialog;

  Link({
    @required this.child,
    this.screenBuilder,
    this.beforeRedirect,
    this.bgColor,
    this.material = true,
    this.fullscreenDialog = false,
  });

  void _onTap(BuildContext context, int theme) {
    if (beforeRedirect != null) {
      beforeRedirect();
    }

    if (screenBuilder != null) {
      switch (theme) {
        case ThemeMap.cupertino:
          Navigator.of(context).push(CupertinoPageRoute(
            builder: screenBuilder,
            fullscreenDialog: fullscreenDialog,
          ));
          break;
        default:
          Navigator.of(context).push(MaterialPageRoute(
            builder: screenBuilder,
            fullscreenDialog: fullscreenDialog,
          ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = SettingsProvider.of(context).theme;

    if (!material) {
      return GestureDetector(
        child: child,
        onTap: () => _onTap(context, theme),
      );
    }

    return Material(
      child: Ink(
        color: bgColor ?? Colors.white,
        child: InkWell(
          child: child,
          splashColor: theme == ThemeMap.cupertino ? Colors.transparent : null,
          onTap: () => _onTap(context, theme),
        ),
      ),
    );
  }
}
