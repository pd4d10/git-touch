import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';
import '../widgets/loading.dart';
import '../widgets/error_reload.dart';

class TabScaffold<T> extends StatefulWidget {
  final Widget title;
  final Widget Function(T payload) bodyBuilder;
  final Future<T> Function(int activeTab) onRefresh;
  final Widget Function(T payload) trailingBuilder;
  final List<String> tabs;

  TabScaffold({
    @required this.title,
    @required this.bodyBuilder,
    @required this.onRefresh,
    this.trailingBuilder,
    this.tabs,
  });

  @override
  _TabScaffoldState createState() => _TabScaffoldState();
}

class _TabScaffoldState<T> extends State<TabScaffold<T>> {
  bool _loading;
  T _payload;
  String _error = '';
  int _activeTab = 0;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Widget _buildBody() {
    if (_error.isNotEmpty) {
      return ErrorReload(text: _error, onTap: _refresh);
    } else if (_payload == null) {
      return Loading(more: false);
    } else {
      return widget.bodyBuilder(_payload);
    }
  }

  Future<void> _refresh([int activeTab]) async {
    try {
      setState(() {
        _error = '';
        _loading = true;
        if (activeTab != null) {
          _activeTab = activeTab;
        }
      });
      _payload = await widget.onRefresh(activeTab);
    } catch (err) {
      _error = err.toString();
      throw err;
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Widget _buildTrailing() {
    if (_payload == null || widget.trailingBuilder == null) return null;

    return widget.trailingBuilder(_payload);
  }

  List<Widget> _buildActions() {
    if (_payload == null || widget.trailingBuilder == null) return null;
    var w = widget.trailingBuilder(_payload);
    return [if (w != null) w];
  }

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: DefaultTextStyle(
              style: TextStyle(),
              child: CupertinoSegmentedControl(
                groupValue: _activeTab,
                onValueChanged: _refresh,
                children: widget.tabs.asMap().map((key, text) => MapEntry(
                    key,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(text),
                    ))),
              ),
            ),
            trailing: null, // TODO:
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverRefreshControl(onRefresh: _refresh),
                SliverToBoxAdapter(child: _buildBody())
              ],
            ),
          ),
        );
      default:
        return DefaultTabController(
          length: widget.tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: widget.title,
              actions: _buildActions(),
              bottom: TabBar(
                onTap: _refresh,
                tabs: widget.tabs
                    .map((text) => Tab(text: text.toUpperCase()))
                    .toList(),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: _refresh,
              child: SingleChildScrollView(child: _buildBody()),
            ),
          ),
        );
    }
  }
}
