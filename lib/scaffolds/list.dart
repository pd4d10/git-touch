import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../providers/settings.dart';
import '../widgets/error_reload.dart';
import '../widgets/loading.dart';
import '../widgets/empty.dart';

class ListPayload<T, K> {
  K cursor;
  List<T> items;
  bool hasMore;

  ListPayload({this.items, this.cursor, this.hasMore});
}

// This is a scaffold for infinite scroll screens
class ListScaffold<T, K> extends StatefulWidget {
  final Widget title;
  // final IconData trailingIconData;
  // final Function trailingOnTap;
  final Widget Function(T payload) itemBuilder;
  final Future<ListPayload<T, K>> Function() onRefresh;
  final Future<ListPayload<T, K>> Function(K cursor) onLoadMore;

  ListScaffold({
    @required this.title,
    // this.trailingIconData,
    // this.trailingOnTap,
    @required this.itemBuilder,
    @required this.onRefresh,
    @required this.onLoadMore,
  });

  @override
  _ListScaffoldState createState() => _ListScaffoldState();
}

class _ListScaffoldState<T, K> extends State<ListScaffold<T, K>> {
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
    _controller.addListener(() {
      if (_controller.offset + 100 > _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange &&
          !loading &&
          !loadingMore &&
          hasMore) {
        _loadMore();
      }
    });
  }

  Future<void> _refresh() async {
    // print('list scaffold refresh');
    setState(() {
      error = '';
      loading = true;
    });
    try {
      var _payload = await widget.onRefresh();
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
      }
    }
  }

  Future<void> _loadMore() async {
    // print('list scaffold load more');
    setState(() {
      loadingMore = true;
    });
    try {
      var _payload = await widget.onLoadMore(cursor);
      items.addAll(_payload.items);
      cursor = _payload.cursor;
      hasMore = _payload.hasMore;
    } catch (err) {
      print(err);
    } finally {
      if (mounted) {
        setState(() {
          loadingMore = false;
        });
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
      return Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
      );
    }

    return widget.itemBuilder(items[index ~/ 2]);
  }

  Widget _buildSliver(BuildContext context) {
    if (error.isNotEmpty) {
      return SliverToBoxAdapter(
        child: ErrorReload(text: error, onTap: _refresh),
      );
    } else if (loading) {
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

  Widget _buildBody(BuildContext context) {
    if (error.isNotEmpty) {
      return ErrorReload(text: error, onTap: _refresh);
    } else if (loading) {
      return Loading(more: false);
    } else if (items.isEmpty) {
      return EmptyWidget();
    } else {
      return ListView.builder(
        controller: _controller,
        itemCount: 2 * items.length + 1,
        itemBuilder: _buildItem,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).theme) {
      case ThemeMap.cupertino:
        List<Widget> slivers = [
          CupertinoSliverRefreshControl(onRefresh: widget.onRefresh)
        ];
        // if (widget.header != null) {
        //   slivers.add(SliverToBoxAdapter(child: widget.header));
        // }
        slivers.add(_buildSliver(context));

        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: widget.title,
            // trailing: Link(
            //   child: Icon(
            //     widget.trailingIconData,
            //     size: 24,
            //     color: Colors.blueAccent,
            //   ),
            //   beforeRedirect: widget.trailingOnTap,
            //   bgColor: Colors.transparent,
            // ),
          ),
          child: SafeArea(
            child: CustomScrollView(
              controller: _controller,
              slivers: slivers,
            ),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(
            title: widget.title,
            // actions: widget.trailingIconData == null
            //     ? []
            //     : <Widget>[
            //         IconButton(
            //           icon: Icon(widget.trailingIconData),
            //           onPressed: widget.trailingOnTap,
            //         )
            //       ],
          ),
          body: RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: _buildBody(context),
          ),
        );
    }
  }
}
