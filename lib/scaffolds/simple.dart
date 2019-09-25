import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class SimpleScaffold extends StatelessWidget {
  final Widget title;
  final Widget child;
  final Widget trailing;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;

  SimpleScaffold({
    @required this.title,
    @required this.child,
    this.trailing,
    this.actions,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CupertinoPageScaffold(
          navigationBar:
              CupertinoNavigationBar(middle: title, trailing: trailing),
          child: SafeArea(
            child: SingleChildScrollView(child: child),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(title: title, actions: actions, bottom: bottom),
          body: SingleChildScrollView(child: child),
        );
    }
  }
}
