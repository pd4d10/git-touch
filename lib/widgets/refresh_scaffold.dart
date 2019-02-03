import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../providers/settings.dart';
import 'loading.dart';

typedef RefreshCallback = Future<void> Function();

class RefreshScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final RefreshCallback onRefresh;

  RefreshScaffold({
    @required this.title,
    @required this.body,
    @required this.onRefresh,
  });

  @override
  _RefreshScaffoldState createState() => _RefreshScaffoldState();
}

class _RefreshScaffoldState extends State<RefreshScaffold> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    print('refresh');
    setState(() {
      loading = true;
    });
    try {
      await widget.onRefresh();
    } catch (err) {
      print(err);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Widget _buildBody(BuildContext context) {
    if (loading) {
      return Loading(more: false);
    } else {
      return widget.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).layout) {
      case LayoutMap.cupertino:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text(widget.title)),
          child: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
                SliverToBoxAdapter(child: _buildBody(context))
              ],
            ),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: _buildBody(context),
          ),
        );
    }
  }
}
