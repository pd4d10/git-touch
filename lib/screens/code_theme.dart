import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';

class CodeThemeScreen extends StatelessWidget {
  final String code;
  final String language;

  CodeThemeScreen(this.code, this.language);

  @override
  Widget build(BuildContext context) {
    var codeProvider = Provider.of<CodeModel>(context);
    var themeProvider = Provider.of<ThemeModel>(context);

    return SingleScaffold(
      title: AppBarTitle('Code theme'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TableView(
            items: [
              TableViewItem(
                text: Text('Syntax Highlighting'),
                rightWidget: Text(codeProvider.theme),
                onTap: () {
                  themeProvider.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.theme,
                      items: CodeModel.themes
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      onChange: (value) {
                        Provider.of<CodeModel>(context).setTheme(value);
                      },
                    ),
                  );
                },
              ),
              TableViewItem(
                text: Text('Font Size'),
                rightWidget: Text(codeProvider.fontSize.toString()),
                onTap: () {
                  themeProvider.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.fontSize.toString(),
                      items: CodeModel.fontSizes
                          .map((v) =>
                              PickerItem(v.toString(), text: v.toString()))
                          .toList(),
                      onChange: (value) {
                        Provider.of<CodeModel>(context)
                            .setFontSize(int.tryParse(value) ?? 16);
                      },
                    ),
                  );
                },
              ),
              TableViewItem(
                text: Text('Font Family'),
                rightWidget: Text(codeProvider.fontFamily),
                onTap: () {
                  themeProvider.showPicker(
                    context,
                    PickerGroupItem(
                      value: codeProvider.fontFamily,
                      items: CodeModel.fontFamilies
                          .map((v) => PickerItem(v, text: v))
                          .toList(),
                      onChange: (String value) {
                        Provider.of<CodeModel>(context).setFontFamily(value);
                      },
                    ),
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
      ),
    );
  }
}
