import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/home.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  Widget _buildChild(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    switch (theme.theme) {
      case AppThemeType.cupertino:
        return CupertinoApp(
          theme: CupertinoThemeData(brightness: theme.brightness),
          home: Home(),
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) {
            for (final supportedLocale in supportedLocales) {
              if (locale.languageCode == supportedLocale.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('hi', ''),
          ],
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
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) {
            for (final supportedLocale in supportedLocales) {
              if (locale.languageCode == supportedLocale.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('hi', ''),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return Container(key: auth.rootKey, child: _buildChild(context));
  }
}
