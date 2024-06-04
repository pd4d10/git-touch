import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/scaffolds/utils.dart';

class RefreshStatefulScaffold<T> extends StatefulWidget {
  const RefreshStatefulScaffold({
    required this.title,
    required this.bodyBuilder,
    required this.fetch,
    this.actionBuilder,
    this.action,
    this.canRefresh = true,
  }) : assert(actionBuilder == null || action == null);
  final Widget title;
  final Widget? Function(T data, void Function(T newData) setData) bodyBuilder;
  final Future<T> Function() fetch;
  final Widget? Function(T data, void Function(T newData) setData)?
      actionBuilder;
  final Widget? action;
  final bool canRefresh;

  @override
  State<RefreshStatefulScaffold<T>> createState() =>
      _RefreshStatefulScaffoldState();
}

class _RefreshStatefulScaffoldState<T>
    extends State<RefreshStatefulScaffold<T>> {
  // bool _loading;
  T? _data;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _refresh();
    setState(() {});
  }

  Future<void> _refresh() async {
    try {
      setState(() {
        _error = '';
        // _loading = true;
      });
      _data = await widget.fetch();
    } catch (err) {
      _error = err.toString();
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          // _loading = true;
        });
      }
    }
  }

  Widget? get _action {
    if (widget.action != null) return widget.action;
    if (widget.actionBuilder == null || _data == null) return null;
    return widget.actionBuilder!(_data as T, (v) {
      setState(() {
        _data = v;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = ErrorLoadingWrapper(
      bodyBuilder: () => widget.bodyBuilder(_data as T, (v) {
        setState(() {
          _data = v;
        });
      }),
      error: _error,
      loading: _data == null,
      reload: _refresh,
    );
    if (widget.canRefresh) {
      child = RefreshWrapper(
        onRefresh: _refresh,
        body: child,
      );
    }

    return CommonScaffold(
      title: widget.title,
      body: child,
      action: _action,
    );
  }
}
