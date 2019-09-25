import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/scaffolds/utils.dart';
import '../widgets/loading.dart';
import '../widgets/error_reload.dart';

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
    if (_payload == null || widget.trailingBuilder == null) return null;
    return widget.trailingBuilder(_payload);
  }

  Widget get _body {
    if (_error.isNotEmpty) {
      return ErrorReload(text: _error, onTap: _refresh);
    } else if (_payload == null) {
      return Loading(more: false);
    } else {
      return widget.bodyBuilder(_payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: widget.title,
      body: RefreshWrapper(onRefresh: _refresh, body: _body),
      trailing: _trailing,
    );
  }
}
