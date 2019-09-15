import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:git_touch/models/theme.dart';

class Link extends StatelessWidget {
  final Widget child;
  final String url;
  final WidgetBuilder screenBuilder;
  final Function onTap;
  final Color bgColor;
  final bool material;
  final bool fullscreenDialog;
  final Icon iconButton;

  Link({
    this.child,
    this.url,
    this.screenBuilder,
    this.onTap,
    this.bgColor,
    this.material = true,
    this.fullscreenDialog = false,
    this.iconButton,
  })  : assert(child != null || iconButton != null),
        assert(screenBuilder == null || url == null);

  void _onTap(BuildContext context, int theme) {
    if (onTap != null) {
      onTap();
    }

    if (screenBuilder != null) {
      Provider.of<ThemeModel>(context).pushRoute(
          context: context,
          builder: screenBuilder,
          fullscreenDialog: fullscreenDialog);
    }

    if (url != null) {
      launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeModel>(context).theme;

    if (iconButton != null) {
      return IconButton(
        icon: iconButton,
        onPressed: () => _onTap(context, theme),
      );
    }

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
          splashColor:
              theme == AppThemeMap.cupertino ? Colors.transparent : null,
          onTap: () => _onTap(context, theme),
        ),
      ),
    );
  }
}
