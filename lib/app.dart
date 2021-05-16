import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/home.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:intl/locale.dart' as l;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);

    final LocaleListResolutionCallback localeListResolutionCallback =
        (locales, supportedLocales) {
      // 1. user set locale
      // 2. system locale
      try {
        if (theme.locale != null) {
          final intlLocale = l.Locale.parse(theme.locale!);
          locales = [
            Locale.fromSubtags(
              languageCode: intlLocale.languageCode,
              countryCode: intlLocale.countryCode,
              scriptCode: intlLocale.scriptCode,
            ),
            ...locales!
          ];
        }
      } catch (err) {
        print(err);
      }

      for (final locale in locales!) {
        // this is necessary because Flutter only handles zh_Hans -> zh
        // and would not handle non-exist language code
        if (AppLocalizations.delegate.isSupported(locale)) {
          return locale;
        }
      }

      // 3. if none match, use the default
      return supportedLocales.firstWhere((l) => l.languageCode == 'en');
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
