import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/utils.dart';
import 'package:provider/provider.dart';

class CommonTabPayload {
  final List<String> tabs;
  final int activeTab;
  final Function(int active) onTabSwitch;
  CommonTabPayload({
    @required this.tabs,
    @required this.activeTab,
    @required this.onTabSwitch,
  });
}

class TabScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget trailing;
  final void Function() onRefresh;
  final CommonTabPayload tabPayload;

  TabScaffold({
    @required this.title,
    @required this.body,
    this.trailing,
    @required this.onRefresh,
    @required this.tabPayload,
  });

  Widget _buildTitle(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return DefaultTextStyle(
          style: TextStyle(fontSize: 16),
          child: CupertinoSegmentedControl(
            groupValue: tabPayload.activeTab,
            onValueChanged: tabPayload.onTabSwitch,
            children: tabPayload.tabs.asMap().map((key, text) => MapEntry(
                key,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(text),
                ))),
          ),
        );
      default:
        return title;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = CommonScaffold(
      title: _buildTitle(context),
      body: RefreshWrapper(body: body, onRefresh: onRefresh),
      trailing: trailing,
      bottom: TabBar(
        onTap: tabPayload.onTabSwitch,
        tabs: tabPayload.tabs
            .map((text) => Tab(text: text.toUpperCase()))
            .toList(),
      ),
    );

    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return scaffold;
      default:
        return DefaultTabController(
          length: tabPayload.tabs.length,
          child: scaffold,
        );
    }
  }
}
