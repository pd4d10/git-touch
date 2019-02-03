import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../providers/settings.dart';
import 'loading.dart';

typedef RefreshCallback = Future<void> Function();

class ListScaffold extends StatefulWidget {
  final String title;
  final Widget header;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final RefreshCallback onRefresh;
  final RefreshCallback onLoadMore;

  ListScaffold({
    @required this.title,
    this.header,
    @required this.itemCount,
    @required this.itemBuilder,
    @required this.onRefresh,
    this.onLoadMore,
  });

  @override
  _ListScaffoldState createState() => _ListScaffoldState();
}

class _ListScaffoldState extends State<ListScaffold> {
  bool loading = false;
  bool loadingMore = false;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _refresh();
    _controller.addListener(() {
      if (_controller.offset + 100 > _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange &&
          !loading &&
          !loadingMore) {
        _loadMore();
      }
    });
  }

  Future<void> _refresh() async {
    print('refresh');
    setState(() {
      loading = true;
    });
    try {
      await widget.onRefresh();
    } catch (err) {
      print(err);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> _loadMore() async {
    print('more');
    setState(() {
      loadingMore = true;
    });
    try {
      await widget.onLoadMore();
    } catch (err) {
      print(err);
    } finally {
      loadingMore = false;
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == widget.itemCount) {
      return Loading(more: true);
    }

    return widget.itemBuilder(context, index);
  }

  Widget _buildSliver(BuildContext context) {
    if (loading) {
      return SliverToBoxAdapter(child: Loading(more: false));
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          _buildItem,
          childCount: widget.itemCount + 1,
        ),
      );
    }
  }

  Widget _buildBody(BuildContext context) {
    if (loading) {
      return Loading(more: false);
    } else {
      return ListView.builder(
        controller: _controller,
        itemCount: widget.itemCount + 1,
        itemBuilder: _buildItem,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).layout) {
      case LayoutMap.cupertino:
        List<Widget> slivers = [
          CupertinoSliverRefreshControl(onRefresh: widget.onRefresh)
        ];
        if (widget.header != null) {
          slivers.add(SliverToBoxAdapter(child: widget.header));
        }
        slivers.add(_buildSliver(context));

        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text(widget.title)),
          child: SafeArea(
            child: CustomScrollView(
              controller: _controller,
              slivers: slivers,
            ),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: _buildBody(context),
          ),
        );
    }
  }
}
