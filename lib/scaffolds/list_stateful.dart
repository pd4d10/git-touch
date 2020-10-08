import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import '../widgets/error_reload.dart';
import '../widgets/loading.dart';
import '../widgets/empty.dart';

class ListPayload<T, K> {
  K cursor;
  List<T> items;
  bool hasMore;

  ListPayload({
    @required this.items,
    @required this.cursor,
    @required this.hasMore,
  });
}

// This is a scaffold for infinite scroll screens
class ListStatefulScaffold<T, K> extends StatefulWidget {
  final Widget title;
  final Widget Function() actionBuilder;
  final Widget Function(T payload) itemBuilder;
  final Future<ListPayload<T, K>> Function(K cursor) fetch;

  ListStatefulScaffold({
    @required this.title,
    @required this.itemBuilder,
    @required this.fetch,
    this.actionBuilder,
  });

  @override
  _ListStatefulScaffoldState<T, K> createState() =>
      _ListStatefulScaffoldState();
}

class _ListStatefulScaffoldState<T, K>
    extends State<ListStatefulScaffold<T, K>> {
  bool loading = false;
  bool loadingMore = false;
  String error = '';

  List<T> items = [];
  K cursor;
  bool hasMore;

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _refresh();
    _controller.addListener(onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onScroll() {
    // Fimber.d(_controller.position.maxScrollExtent - _controller.offset);
    if (_controller.position.maxScrollExtent - _controller.offset < 100 &&
        !_controller.position.outOfRange &&
        !loading &&
        !loadingMore &&
        hasMore) {
      _loadMore();
    }
  }

  // if items not enough, fetch next page
  // This should be triggered after build
  // TODO: disabled
  void _makeSureItemsFill() {
    // Future.delayed(Duration(milliseconds: 300)).then((_) {
    //   onScroll();
    // });
  }

  Future<void> _refresh({bool force = false}) async {
    // Fimber.d('list scaffold refresh');
    setState(() {
      error = '';
      loading = true;
      if (force) {
        items = [];
      }
    });
    try {
      var _payload = await widget.fetch(null);
      items = _payload.items;
      cursor = _payload.cursor;
      hasMore = _payload.hasMore;
    } catch (err) {
      error = err.toString();
      throw err;
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
        _makeSureItemsFill();
      }
    }
  }

  Future<void> _loadMore() async {
    // Fimber.d('list scaffold load more');
    setState(() {
      loadingMore = true;
    });
    try {
      var _payload = await widget.fetch(cursor);
      items.addAll(_payload.items);
      cursor = _payload.cursor;
      hasMore = _payload.hasMore;
    } catch (err) {
      error = err.toString();
      throw err;
    } finally {
      if (mounted) {
        setState(() {
          loadingMore = false;
        });
        _makeSureItemsFill();
      }
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == 2 * items.length) {
      if (hasMore) {
        return Loading(more: true);
      } else {
        return Container();
      }
    }

    if (index % 2 == 1) {
      return CommonStyle.border;
    }

    return widget.itemBuilder(items[index ~/ 2]);
  }

  Widget _buildCupertinoSliver() {
    if (error.isNotEmpty) {
      return SliverToBoxAdapter(
        child: ErrorReload(text: error, onTap: _refresh),
      );
    } else if (loading && items.isEmpty) {
      return SliverToBoxAdapter(child: Loading(more: false));
    } else if (items.isEmpty) {
      return SliverToBoxAdapter(child: EmptyWidget());
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          _buildItem,
          childCount: 2 * items.length + 1,
        ),
      );
    }
  }

  Widget _buildMaterial() {
    if (error.isNotEmpty) {
      return ErrorReload(text: error, onTap: _refresh);
    } else if (loading && items.isEmpty) {
      return Loading(more: false);
    } else if (items.isEmpty) {
      return EmptyWidget();
    } else {
      return Scrollbar(
        child: ListView.builder(
          controller: _controller,
          itemCount: 2 * items.length + 1,
          itemBuilder: _buildItem,
        ),
      );
    }
  }

  Widget _buildBody() {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CupertinoScrollbar(
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              CupertinoSliverRefreshControl(onRefresh: _refresh),
              _buildCupertinoSliver(),
            ],
          ),
        );
      default:
        return RefreshIndicator(
          onRefresh: _refresh,
          child: _buildMaterial(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: widget.title,
      body: _buildBody(),
      action: widget.actionBuilder == null ? null : widget.actionBuilder(),
    );
  }
}
