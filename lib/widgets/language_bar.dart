import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:github/github.dart' as github;

class LanguageBarItem {
  String name;
  String hexColor;
  double ratio;
  LanguageBarItem({
    @required this.name,
    @required this.ratio,
    String hexColor,
  }) : hexColor = hexColor ?? github.languageColors[name];
}

class LanguageBar extends StatelessWidget {
  final List<LanguageBarItem> items;
  LanguageBar(this.items);

  @override
  Widget build(BuildContext context) {
    final langWidth = MediaQuery.of(context).size.width -
        CommonStyle.padding.left -
        CommonStyle.padding.right -
        items.length +
        1;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: () {
        showCupertinoModalPopup(context: context, builder: _buildPopup);
      },
      child: Container(
        // color: theme.palette.background,
        padding: CommonStyle.padding.copyWith(top: 8, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            height: 10,
            child: Row(
              children: join(
                SizedBox(width: 1),
                items
                    .map((lang) => Container(
                        color: convertColor(lang.hexColor),
                        width: langWidth * lang.ratio))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopup(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      color: theme.palette.background,
      padding: CommonStyle.padding,
      height: 300,
      child: SingleChildScrollView(
        child: Table(children: [
          for (final edge in items)
            TableRow(children: [
              Container(
                padding: CommonStyle.padding,
                child: Row(children: <Widget>[
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: convertColor(edge.hexColor),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    edge.name,
                    style: TextStyle(
                      color: theme.palette.text,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: theme.palette.background,
                    ),
                  ),
                ]),
              ),
              Container(
                padding: CommonStyle.padding,
                child: Text(
                  '${(edge.ratio * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: theme.palette.secondaryText,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: theme.palette.background,
                  ),
                ),
              ),
            ])
        ]),
      ),
    );
  }
}
