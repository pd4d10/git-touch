import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

final settingsRouter = RouterScreen(
  '/settings',
  (context, parameters) => SettingsScreen(),
);

class SettingsScreen extends StatelessWidget {
  Widget _buildRightWidget(BuildContext context, bool checked) {
    final theme = Provider.of<ThemeModel>(context);
    if (!checked) return null;
    return Icon(Icons.check, color: theme.paletteOf(context).primary, size: 24);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return SingleScaffold(
      title: AppBarTitle('Settings'),
      body: Column(
        children: <Widget>[
          CommonStyle.verticalGap,
          TableView(
            headerText: 'ACCOUNTS',
            items: [
              TableViewItem(
                text: Text('Switch to another account'),
                url: '/login',
              ),
            ],
          ),
          CommonStyle.verticalGap,
          TableView(
            headerText: 'APP THEME',
            items: [
              Tuple2('Material', AppThemeType.material),
              Tuple2('Cupertino', AppThemeType.cupertino),
            ].map((t) {
              return TableViewItem(
                text: Text(t.item1),
                rightWidget: _buildRightWidget(
                  context,
                  theme.theme == t.item2,
                ),
                onTap: () {
                  if (theme.theme != t.item2) {
                    theme.setTheme(t.item2);
                  }
                },
                hideRightChevron: true,
              );
            }).toList(),
          ),
          CommonStyle.verticalGap,
          TableView(
            headerText: 'BRIGHTNESS',
            items: [
              Tuple2('Follow System', AppBrightnessType.followSystem),
              Tuple2('Light', AppBrightnessType.light),
              Tuple2('Dark', AppBrightnessType.dark),
            ].map((t) {
              return TableViewItem(
                text: Text(t.item1),
                rightWidget: _buildRightWidget(
                  context,
                  theme.brighnessValue == t.item2,
                ),
                onTap: () {
                  if (theme.brighnessValue != t.item2)
                    theme.setBrightness(t.item2);
                },
                hideRightChevron: true,
              );
            }).toList(),
          ),
          CommonStyle.verticalGap,
          TableView(
            headerText: 'CODE VIEW',
            items: [
              TableViewItem(
                text: Text('Code settings'),
                url: '/choose-code-theme',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
