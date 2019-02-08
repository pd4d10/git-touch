import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../providers/settings.dart';
import '../widgets/loading.dart';
import '../widgets/error_reload.dart';

// This is a scaffold for pull to refresh
class RefreshStatelessScaffold extends StatelessWidget {
  final Widget title;
  final Widget Function() bodyBuilder;
  final Future<void> Function() onRefresh;
  final bool loading;
  final String error;
  final Widget trailing;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;

  RefreshStatelessScaffold({
    @required this.title,
    @required this.bodyBuilder,
    @required this.onRefresh,
    @required this.loading,
    @required this.error,
    this.trailing,
    this.actions,
    this.bottom,
  });

  Widget _buildBody() {
    if (error.isNotEmpty) {
      return ErrorReload(text: error, reload: onRefresh);
    } else if (loading) {
      return Loading(more: true);
    } else {
      return bodyBuilder();
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).theme) {
      case ThemeMap.cupertino:
        return CupertinoPageScaffold(
          navigationBar:
              CupertinoNavigationBar(middle: title, trailing: trailing),
          child: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverRefreshControl(onRefresh: onRefresh),
                SliverToBoxAdapter(child: _buildBody())
              ],
            ),
          ),
        );
      default:
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: title,
              actions: actions,
              bottom: bottom,
            ),
            body: RefreshIndicator(
              onRefresh: onRefresh,
              child: SingleChildScrollView(child: _buildBody()),
            ),
          ),
        );
    }
  }
}
