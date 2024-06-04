import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/scaffolds/tab.dart';
import 'package:git_touch/scaffolds/utils.dart';

class TabStatefulScaffold<T> extends StatefulWidget {
  const TabStatefulScaffold({
    required this.title,
    required this.bodyBuilder,
    required this.fetchData,
    required this.tabs,
    this.actionBuilder,
  });
  final Widget title;
  final Widget Function(T payload, int activeTab) bodyBuilder;
  final Future<T> Function(int activeTab) fetchData;
  final List<String> tabs;
  final Widget Function(T payload, void Function() refresh)? actionBuilder;

  @override
  State<TabStatefulScaffold<T>> createState() => _TabStatefulScaffoldState();
}

class _TabStatefulScaffoldState<T> extends State<TabStatefulScaffold<T>> {
  late bool _loading;
  T? _payload0;
  T? _payload1;
  T? _payload2;
  String _error = '';
  int _activeTab = 0;

  T? _getPayload(int selected) {
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

  T? get _payload => _getPayload(_activeTab);

  set _payload(T? v) {
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
      _payload = await widget.fetchData(_activeTab);
    } catch (err) {
      _error = err.toString();
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          _loading = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabScaffold(
      title: widget.title,
      action: widget.actionBuilder == null
          ? null
          : widget.actionBuilder!(_payload as T, _refresh),
      tabs: widget.tabs,
      activeTab: _activeTab,
      onTabSwitch: (selected) async {
        if (_loading) return;

        setState(() {
          _activeTab = selected;
        });
        if (_getPayload(selected) == null) {
          await _refresh();
        }
      },
      onRefresh: _refresh,
      body: ErrorLoadingWrapper(
        bodyBuilder: () => widget.bodyBuilder(_payload as T, _activeTab),
        error: _error,
        loading: _payload == null,
        reload: _refresh,
      ),
    );
  }
}
