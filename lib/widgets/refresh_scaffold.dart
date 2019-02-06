import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../providers/settings.dart';
import 'loading.dart';

typedef RefreshCallback = Future<void> Function();
typedef WidgetBuilder = Widget Function();

class RefreshScaffold extends StatelessWidget {
  final Widget title;
  final WidgetBuilder bodyBuilder;
  final RefreshCallback onRefresh;
  final bool loading;
  final Widget trailing;
  final List<Widget> actions;

  RefreshScaffold({
    @required this.title,
    @required this.bodyBuilder,
    @required this.onRefresh,
    @required this.loading,
    this.trailing,
    this.actions,
  });

  Widget _buildBody() {
    if (loading) {
      return Loading(more: true);
    } else {
      return bodyBuilder();
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).layout) {
      case LayoutMap.cupertino:
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
        return Scaffold(
          appBar: AppBar(
            title: title,
            actions: actions,
          ),
          body: RefreshIndicator(
            onRefresh: onRefresh,
            child: SingleChildScrollView(child: _buildBody()),
          ),
        );
    }
  }
}
