import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/scaffolds/utils.dart';
import 'package:primer/primer.dart';

class RefreshStatefulScaffoldPayload<T> {
  bool loading;
  String error;
  T data;
  void Function() refresh;

  RefreshStatefulScaffoldPayload(
      this.loading, this.error, this.data, this.refresh);
}

class RefreshStatefulScaffold<T> extends StatefulWidget {
  final Widget title;
  final Widget Function(RefreshStatefulScaffoldPayload<T> payload) bodyBuilder;
  final Future<T> Function() fetchData;
  final Widget Function(RefreshStatefulScaffoldPayload<T> payload)
      actionBuilder;

  RefreshStatefulScaffold({
    @required this.title,
    @required this.bodyBuilder,
    @required this.fetchData,
    this.actionBuilder,
  });

  @override
  _RefreshStatefulScaffoldState createState() =>
      _RefreshStatefulScaffoldState();
}

class _RefreshStatefulScaffoldState<T>
    extends State<RefreshStatefulScaffold<T>> {
  bool _loading;
  T _data;
  String _error = '';

  RefreshStatefulScaffoldPayload get _payload =>
      RefreshStatefulScaffoldPayload(_loading, _error, _data, _refresh);

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
      _data = await widget.fetchData();
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
    if (widget.actionBuilder == null) return null;
    return widget.actionBuilder(_payload);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: _data == null ? Colors.white : PrimerColors.gray100,
      title: widget.title,
      body: RefreshWrapper(
        onRefresh: _refresh,
        body: ErrorLoadingWrapper(
          bodyBuilder: () => widget.bodyBuilder(_payload),
          error: _error,
          loading: _data == null,
          reload: _refresh,
        ),
      ),
      action: _trailing,
    );
  }
}
