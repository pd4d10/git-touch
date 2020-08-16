import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/home.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  Widget _buildChild(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    switch (theme.theme) {
      case AppThemeType.cupertino:
        return CupertinoApp(
          theme: CupertinoThemeData(brightness: theme.brightness),
          home: Home(),
        );
      default:
        return MaterialApp(
          theme: ThemeData(
            brightness: theme.brightness,
            primaryColor:
                theme.brightness == Brightness.dark ? null : Colors.white,
            accentColor: theme.palette.primary,
            scaffoldBackgroundColor: theme.palette.background,
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
              },
            ),
          ),
          home: Home(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return Container(key: auth.rootKey, child: _buildChild(context));
  }
}
