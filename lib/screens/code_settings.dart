import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/simple.dart';
import 'package:git_touch/utils/utils.dart';
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
                        children: CodeModel.themes.map((k) => Text(k)).toList(),
                        initialItem:
                            CodeModel.themes.indexOf(codeProvider.theme),
                        onSelectedItemChanged: (int value) {
                          if (_themeDebounce?.isActive ?? false)
                            _themeDebounce.cancel();
                          _themeDebounce =
                              Timer(const Duration(milliseconds: 500), () {
                            Provider.of<CodeModel>(context)
                                .setTheme(CodeModel.themes[value]);
                          });
                        },
                      );
                    }),
                TableViewItem(
                  text: Text('Font Size'),
                  rightWidget: Text(codeProvider.fontSize.toString()),
                  onTap: () {
                    Provider.of<ThemeModel>(context).showPicker(
                      context,
                      children: CodeModel.fontSizes
                          .map((k) => Text(k.toString()))
                          .toList(),
                      initialItem:
                          CodeModel.fontSizes.indexOf(codeProvider.fontSize),
                      onSelectedItemChanged: (int value) {
                        if (_themeDebounce?.isActive ?? false)
                          _themeDebounce.cancel();
                        _themeDebounce =
                            Timer(const Duration(milliseconds: 500), () {
                          Provider.of<CodeModel>(context)
                              .setFontSize(CodeModel.fontSizes[value]);
                        });
                      },
                    );
                  },
                ),
                TableViewItem(
                  text: Text('Font Family'),
                  rightWidget: Text(codeProvider.fontFamily.toString()),
                  onTap: () {
                    // TODO:
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
                  fontFamily: monospaceFont,
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
