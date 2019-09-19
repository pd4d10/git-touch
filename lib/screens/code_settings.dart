import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/simple.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';

class CodeSettingsScreen extends StatelessWidget {
  final String code;
  final String language;

  CodeSettingsScreen(this.code, this.language);

  static Timer _themeDebounce;

  @override
  Widget build(BuildContext context) {
    var codeProvider = Provider.of<CodeModel>(context);

    return SimpleScaffold(
      title: AppBarTitle('Code theme'),
      bodyBuilder: () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TableView(
              items: [
                TableViewItem(
                    text: Text('Syntax Highlighting'),
                    rightWidget: Text(codeProvider.theme),
                    onTap: () {
                      Provider.of<ThemeModel>(context).showPicker(
                        context,
                        items: CodeModel.themes
                            .map((t) => PickerItem(t, text: t))
                            .toList(),
                        initialValue: codeProvider.theme,
                        onChange: (String value) {
                          Provider.of<CodeModel>(context).setTheme(value);
                        },
                      );
                    }),
                TableViewItem(
                  text: Text('Font Size'),
                  rightWidget: Text(codeProvider.fontSize.toString()),
                  onTap: () {
                    Provider.of<ThemeModel>(context).showPicker(
                      context,
                      items: CodeModel.fontSizes
                          .map(
                              (size) => PickerItem(size, text: size.toString()))
                          .toList(),
                      initialValue: codeProvider.fontSize,
                      onChange: (int value) {
                        Provider.of<CodeModel>(context).setFontSize(value);
                      },
                    );
                  },
                ),
                TableViewItem(
                  text: Text('Font Family'),
                  rightWidget: Text(codeProvider.fontFamily.toString()),
                  onTap: () {
                    Provider.of<ThemeModel>(context).showPicker(
                      context,
                      items: CodeModel.fontFamilies
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      initialValue: codeProvider.fontFamily,
                      onChange: (String value) {
                        Provider.of<CodeModel>(context).setFontFamily(value);
                      },
                    );
                  },
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: HighlightView(
                code,
                language: language,
                theme: themeMap[codeProvider.theme],
                textStyle: TextStyle(
                  fontSize: codeProvider.fontSize.toDouble(),
                  fontFamily: codeProvider.fontFamilyUsed,
                ),
                padding: const EdgeInsets.all(10),
              ),
            )
          ],
        );
      },
    );
  }
}
