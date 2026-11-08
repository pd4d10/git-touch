import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/router.dart';
import 'package:intl/locale.dart' as l;
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);

    return AntTheme(
      key: auth.rootKey,
      data: AntThemeData(brightness: theme.brightness),
      child: Builder(
        builder: (context) {
          final antTheme = AntTheme.of(context);

          return CupertinoApp.router(
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            theme: CupertinoThemeData(
              brightness: theme.brightness,
              primaryColor: antTheme.colorPrimary,
              scaffoldBackgroundColor: antTheme.colorBox,
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(
                  fontSize: antTheme.fontSizeMain,
                  color: antTheme.colorText,
                ),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeListResolutionCallback: (locales, supportedLocales) {
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
            },
          );
        },
      ),
    );
  }
}
