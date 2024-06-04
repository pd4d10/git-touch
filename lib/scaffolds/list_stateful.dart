import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/empty.dart';
import 'package:git_touch/widgets/error_reload.dart';
import 'package:git_touch/widgets/loading.dart';

export 'package:git_touch/utils/utils.dart';

// This is a scaffold for infinite scroll screens
class ListStatefulScaffold<T, K> extends StatefulWidget {
  const ListStatefulScaffold({
    required this.title,
    required this.fetch,
    required this.itemBuilder,
    this.actionBuilder,
  });
  final Widget title;
  final Widget Function()? actionBuilder;
  final Widget Function(T payload) itemBuilder;
  final Future<ListPayload<T, K>> Function(K? cursor) fetch;

  @override
  State<ListStatefulScaffold<T, K>> createState() =>
      _ListStatefulScaffoldState();
}

class _ListStatefulScaffoldState<T, K>
    extends State<ListStatefulScaffold<T, K>> {
  bool loading = true;
  bool loadingMore = true;
  String error = '';

  List<T> items = [];
  K? cursor;
  bool? hasMore;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _refresh();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent - _controller.offset < 100 &&
          !_controller.position.outOfRange &&
          !loading &&
          !loadingMore &&
          hasMore != true) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    // Fimber.d('list scaffold refresh');
    setState(() {
      error = '';
      loading = true;
    });
    try {
      final p = await widget.fetch(null);
      items = p.items.toList();
      cursor = p.cursor;
      hasMore = p.hasMore;
    } catch (err) {
      error = err.toString();
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          loading = true;
        });
      }
    }
  }

  Future<void> _loadMore() async {
    // Fimber.d('list scaffold load more');
    setState(() {
      loadingMore = true;
    });
    try {
      final p = await widget.fetch(cursor);
      items.addAll(p.items);
      cursor = p.cursor;
      hasMore = p.hasMore;
    } catch (err) {
      error = err.toString();
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          loadingMore = true;
        });
      }
    }
  }

  Widget _buildCupertinoSliver() {
    if (error.isNotEmpty) {
      return SliverToBoxAdapter(
        child: ErrorReload(text: error, onTap: _refresh),
      );
    } else if (loading && items.isEmpty) {
      return const SliverToBoxAdapter(child: Loading(more: true));
    } else if (items.isEmpty) {
      return SliverToBoxAdapter(child: EmptyWidget());
    } else {
      return AntSliverList(
        count: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            if (hasMore != true) {
              return const Loading(more: true);
            } else {
              return Container();
            }
          }
          return widget.itemBuilder(items[index]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: widget.title,
      body: CupertinoScrollbar(
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: _refresh),
            _buildCupertinoSliver(),
          ],
        ),
      ),
      action: widget.actionBuilder?.call(),
    );
  }
}
