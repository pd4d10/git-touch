import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class CodeThemeScreen extends StatelessWidget {
  String _getCode(bool isDark) => '''// ${isDark ? 'Dark' : 'Light'} Mode
import 'package:flutter/material.dart';

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
    var codeProvider = Provider.of<CodeModel>(context);
    var theme = Provider.of<ThemeModel>(context);

    return SingleScaffold(
      title: AppBarTitle(S.of(context).codeTheme),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CommonStyle.verticalGap,
          TableView(
            headerText: S.of(context).fontStyle,
            items: [
              TableViewItem(
                text: Text(S.of(context).fontSize),
                rightWidget: Text(codeProvider.fontSize.toString()),
                onTap: () {
                  theme.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.fontSize.toString(),
                      items: CodeModel.fontSizes
                          .map((v) =>
                              PickerItem(v.toString(), text: v.toString()))
                          .toList(),
                      onChange: (value) {
                        codeProvider.setFontSize(int.tryParse(value) ?? 16);
                      },
                    ),
                  );
                },
              ),
              TableViewItem(
                text: Text(S.of(context).fontFamily),
                rightWidget: Text(codeProvider.fontFamily),
                onTap: () {
                  theme.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.fontFamily,
                      items: CodeModel.fontFamilies
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      onChange: (String value) {
                        codeProvider.setFontFamily(value);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          CommonStyle.verticalGap,
          TableView(
            headerText: S.of(context).syntaxHighlighting,
            items: [
              TableViewItem(
                text: Text(S.of(context).light),
                rightWidget: Text(codeProvider.theme),
                onTap: () {
                  theme.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.theme,
                      items: CodeModel.themes
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      onChange: (value) {
                        codeProvider.setTheme(value);
                      },
                    ),
                  );
                },
              ),
              TableViewItem(
                text: Text(S.of(context).dark),
                rightWidget: Text(codeProvider.themeDark),
                onTap: () {
                  theme.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.themeDark,
                      items: CodeModel.themes
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      onChange: (value) {
                        codeProvider.setThemeDark(value);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          HighlightView(
            _getCode(false),
            language: 'dart',
            theme: themeMap[codeProvider.theme],
            textStyle: TextStyle(
              fontSize: codeProvider.fontSize.toDouble(),
              fontFamily: codeProvider.fontFamilyUsed,
            ),
            padding: CommonStyle.padding,
          ),
          HighlightView(
            _getCode(true),
            language: 'dart',
            theme: themeMap[codeProvider.themeDark],
            textStyle: TextStyle(
              fontSize: codeProvider.fontSize.toDouble(),
              fontFamily: codeProvider.fontFamilyUsed,
            ),
            padding: CommonStyle.padding,
          ),
        ],
      ),
    );
  }
}
