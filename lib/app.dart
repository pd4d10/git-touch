import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/home.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/screens/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);

    final themData = ThemeData(
      brightness: theme.brightness,
      // primaryColorBrightness: theme.brightness,
      primaryColorLight: theme.paletteLight.background,
      primaryColorDark: theme.paletteDark.background,
    );

    // TODO:
    if (!auth.ready || !Provider.of<ThemeModel>(context).ready) {
      return MaterialApp(theme: themData, home: Scaffold(body: Text('a')));
    }

    // Fimber.d(settings.activeLogin);
    if (auth.activeAccount == null) {
      return MaterialApp(theme: themData, home: LoginScreen());
    }

    switch (theme.theme) {
      case AppThemeType.cupertino:
        return CupertinoApp(
          theme: CupertinoThemeData(brightness: theme.brightness),
          home: Home(),
        );
      default:
        return MaterialApp(
          theme: themData,
          home: Home(),
        );
    }
  }
}
