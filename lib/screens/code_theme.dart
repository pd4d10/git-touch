import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class CodeThemeScreen extends StatelessWidget {
  String _getCode(bool isDark) => '''// ${isDark ? 'Dark' : 'Light'} Mode
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
''';

  @override
  Widget build(BuildContext context) {
    final codeProvider = Provider.of<CodeModel>(context);
    final theme = Provider.of<ThemeModel>(context);

    return SingleScaffold(
      title: Text(AppLocalizations.of(context)!.codeTheme),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CommonStyle.verticalGap,
          AntList(
            mode: AntListMode.card,
            header: Text(AppLocalizations.of(context)!.fontStyle),
            children: [
              AntListItem(
                extra: Text(codeProvider.fontSize.toString()),
                onClick: () {
                  theme.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.fontSize.toString(),
                      items: CodeModel.fontSizes
                          .map((v) =>
                              PickerItem(v.toString(), text: v.toString()))
                          .toList(),
                      onChange: (value) {
                        codeProvider.setFontSize(int.tryParse(value!) ?? 16);
                      },
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.fontSize),
              ),
              AntListItem(
                extra: Text(codeProvider.fontFamily),
                onClick: () {
                  theme.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.fontFamily,
                      items: CodeModel.fontFamilies
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      onChange: (value) {
                        codeProvider.setFontFamily(value!);
                      },
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.fontFamily),
              ),
            ],
          ),
          CommonStyle.verticalGap,
          AntList(
            mode: AntListMode.card,
            header: Text(AppLocalizations.of(context)!.syntaxHighlighting),
            children: [
              AntListItem(
                extra: Text(codeProvider.theme),
                onClick: () {
                  theme.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.theme,
                      items: CodeModel.themes
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      onChange: (value) {
                        codeProvider.setTheme(value!);
                      },
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.light),
              ),
              AntListItem(
                child: HighlightView(
                  _getCode(false),
                  language: 'dart',
                  theme: themeMap[codeProvider.theme]!,
                  textStyle: codeProvider.fontStyle,
                  padding: CommonStyle.padding,
                ),
              ),
              AntListItem(
                extra: Text(codeProvider.themeDark),
                onClick: () {
                  theme.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.themeDark,
                      items: CodeModel.themes
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      onChange: (value) {
                        codeProvider.setThemeDark(value!);
                      },
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.dark),
              ),
              AntListItem(
                child: HighlightView(
                  _getCode(true),
                  language: 'dart',
                  theme: themeMap[codeProvider.themeDark]!,
                  textStyle: codeProvider.fontStyle,
                  padding: CommonStyle.padding,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
