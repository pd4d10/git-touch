import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/scaffolds/utils.dart';

class RefreshStatefulScaffold<T> extends StatefulWidget {
  final Widget title;
  final Widget Function(T payload) bodyBuilder;
  final Future<T> Function() onRefresh;
  final Widget Function(T payload) trailingBuilder;

  RefreshStatefulScaffold({
    @required this.title,
    @required this.bodyBuilder,
    @required this.onRefresh,
    this.trailingBuilder,
  });

  @override
  _RefreshStatefulScaffoldState createState() =>
      _RefreshStatefulScaffoldState();
}

class _RefreshStatefulScaffoldState<T>
    extends State<RefreshStatefulScaffold<T>> {
  bool _loading;
  T _payload;
  String _error = '';

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
      _payload = await widget.onRefresh();
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

  Widget get _trailing {
    if (widget.trailingBuilder == null) return null;
    return widget.trailingBuilder(_payload);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: widget.title,
      body: RefreshWrapper(
        onRefresh: _refresh,
        body: ErrorLoadingWrapper(
          bodyBuilder: () => widget.bodyBuilder(_payload),
          error: _error,
          loading: _payload == null,
          reload: _refresh,
        ),
      ),
      trailing: _trailing,
    );
  }
}
