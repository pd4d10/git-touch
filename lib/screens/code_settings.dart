import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/scaffolds/simple.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/picker.dart';
import 'package:provider/provider.dart';

class CodeSettingsScreen extends StatelessWidget {
  final String code;
  final String language;

  CodeSettingsScreen(this.code, this.language);

  @override
  Widget build(BuildContext context) {
    var codeProvider = Provider.of<CodeModel>(context);

    return SimpleScaffold(
      title: AppBarTitle('Code theme'),
      bodyBuilder: () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PickerGroup(
              items: [
                PickerGroupItem(
                  title: 'Syntax Highlighting',
                  value: codeProvider.theme,
                  items: CodeModel.themes.map((v) => PickerItem(v, text: v)),
                  onChange: (value) {
                    Provider.of<CodeModel>(context).setTheme(value);
                  },
                ),
                PickerGroupItem(
                  title: 'Font Size',
                  value: codeProvider.fontSize.toString(),
                  items: CodeModel.fontSizes
                      .map((v) => PickerItem(v.toString(), text: v.toString())),
                  onChange: (value) {
                    Provider.of<CodeModel>(context)
                        .setFontSize(int.tryParse(value) ?? 16);
                  },
                ),
                PickerGroupItem(
                  title: 'Font Family',
                  value: codeProvider.fontFamily,
                  items:
                      CodeModel.fontFamilies.map((v) => PickerItem(v, text: v)),
                  onChange: (String value) {
                    Provider.of<CodeModel>(context).setFontFamily(value);
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
