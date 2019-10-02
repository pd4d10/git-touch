import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';

class CommonScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget action;
  final PreferredSizeWidget bottom;
  final Color backgroundColor;

  CommonScaffold({
    @required this.title,
    @required this.body,
    this.action,
    this.bottom,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CupertinoPageScaffold(
          backgroundColor: backgroundColor,
          navigationBar: CupertinoNavigationBar(
            middle: title,
            trailing: action,
            backgroundColor: PrimerColors.gray000,
            // border: Border(),
          ),
          child: SafeArea(child: body),
        );
      default:
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            title: title,
            actions: [
              if (action != null) action,
            ],
            bottom: bottom,
          ),
          body: body,
        );
    }
  }
}
