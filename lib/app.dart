import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/home.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);

    final LocaleListResolutionCallback localeListResolutionCallback =
        (locales, supportedLocales) {
      return theme.userSetLocale ?? locales.first;
    };

    return Container(
      key: auth.rootKey,
      child: theme.theme == AppThemeType.cupertino
          ? CupertinoApp(
              theme: CupertinoThemeData(brightness: theme.brightness),
              home: Home(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              localeListResolutionCallback: localeListResolutionCallback,
            )
          : MaterialApp(
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
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              localeListResolutionCallback: localeListResolutionCallback,
            ),
    );
  }
}
