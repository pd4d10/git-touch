import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/scaffolds/tab.dart';
import 'package:git_touch/scaffolds/utils.dart';

class TabStatefulScaffold<T> extends StatefulWidget {
  final Widget title;
  final Widget Function(T payload, int activeTab) bodyBuilder;
  final Future<T> Function(int activeTab) onRefresh;
  final List<String> tabs;
  final Widget Function(T payload) trailingBuilder;

  TabStatefulScaffold({
    @required this.title,
    @required this.bodyBuilder,
    @required this.onRefresh,
    @required this.tabs,
    this.trailingBuilder,
  });

  @override
  _TabStatefulScaffoldState createState() => _TabStatefulScaffoldState();
}

class _TabStatefulScaffoldState<T> extends State<TabStatefulScaffold<T>> {
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

  @override
  Widget build(BuildContext context) {
    return TabScaffold(
      title: widget.title,
      trailing: _buildTrailing(),
      tabs: widget.tabs,
      activeTab: _activeTab,
      onTabSwitch: _switch,
      onRefresh: _refresh,
      body: ErrorLoadingWrapper(
        bodyBuilder: () => widget.bodyBuilder(_payload, _activeTab),
        error: _error,
        loading: _payload == null,
        reload: _refresh,
      ),
    );
  }
}
