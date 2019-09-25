import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class CommonScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget trailing;
  final PreferredSizeWidget bottom;

  CommonScaffold({
    @required this.title,
    @required this.body,
    this.trailing,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CupertinoPageScaffold(
          navigationBar:
              CupertinoNavigationBar(middle: title, trailing: trailing),
          child: SafeArea(child: body),
        );
      default:
        return Scaffold(
          appBar: AppBar(
            title: title,
            actions: [
              if (trailing != null) trailing,
            ],
            bottom: bottom,
          ),
          body: body,
        );
    }
  }
}

class RefreshWrapper extends StatelessWidget {
  final Widget body;
  final void Function() onRefresh;

  RefreshWrapper({
    @required this.onRefresh,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverRefreshControl(onRefresh: onRefresh),
            SliverToBoxAdapter(child: body),
          ],
        );
      default:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(child: body),
        );
    }
  }
}
