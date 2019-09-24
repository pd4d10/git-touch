import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';
import '../widgets/loading.dart';
import '../widgets/error_reload.dart';

class TabScaffold<T> extends StatefulWidget {
  final Widget title;
  final Widget Function(T payload, int activeTab) bodyBuilder;
  final Future<T> Function(int activeTab) onRefresh;
  final List<String> tabs;
  final Widget Function(T payload) trailingBuilder;

  TabScaffold({
    @required this.title,
    @required this.bodyBuilder,
    @required this.onRefresh,
    @required this.tabs,
    this.trailingBuilder,
  });

  @override
  _TabScaffoldState createState() => _TabScaffoldState();
}

class _TabScaffoldState<T> extends State<TabScaffold<T>> {
  bool _loading;
  T _payload0;
  T _payload1;
  T _payload2;
  String _error = '';
  int _activeTab = 0;

  T _getPayload(int selected) {
    switch (selected) {
      case 0:
        return _payload0;
      case 1:
        return _payload1;
      case 2:
        return _payload2;
      default:
        throw '';
    }
  }

  T get _payload => _getPayload(_activeTab);

  set _payload(T v) {
    switch (_activeTab) {
      case 0:
        _payload0 = v;
        break;
      case 1:
        _payload1 = v;
        break;
      case 2:
        _payload2 = v;
        break;
    }
  }

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
      return widget.bodyBuilder(_payload, _activeTab);
    }
  }

  Future<void> _refresh() async {
    try {
      setState(() {
        _error = '';
        _loading = true;
      });
      _payload = await widget.onRefresh(_activeTab);
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

  Future<void> _switch(int selected) async {
    setState(() {
      _activeTab = selected;
    });
    if (_getPayload(selected) == null) {
      await _refresh();
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
              style: TextStyle(fontSize: 16),
              child: CupertinoSegmentedControl(
                groupValue: _activeTab,
                onValueChanged: _switch,
                children: widget.tabs.asMap().map((key, text) => MapEntry(
                    key,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                onTap: _switch,
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
