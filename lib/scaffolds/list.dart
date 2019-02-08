import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../providers/settings.dart';
import '../widgets/link.dart';
import '../widgets/loading.dart';

typedef RefreshCallback = Future<void> Function();

// This is a scaffold for infinite scroll screens
class ListScaffold extends StatefulWidget {
  final Widget title;
  final IconData trailingIconData;
  final Function trailingOnTap;
  final Widget header;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final RefreshCallback onRefresh;
  final RefreshCallback onLoadMore;

  ListScaffold({
    @required this.title,
    this.trailingIconData,
    this.trailingOnTap,
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
    print('list scaffold refresh');
    setState(() {
      loading = true;
    });
    try {
      await widget.onRefresh();
    } catch (err) {
      print(err);
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  Future<void> _loadMore() async {
    print('list scaffold load more');
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
    if (index == 2 * widget.itemCount) {
      return Loading(more: true);
    }

    if (index % 2 == 1) {
      return Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
      );
    }

    return widget.itemBuilder(context, index ~/ 2);
  }

  Widget _buildSliver(BuildContext context) {
    if (loading) {
      return SliverToBoxAdapter(child: Loading(more: false));
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          _buildItem,
          childCount: 2 * widget.itemCount + 1,
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
        itemCount: 2 * widget.itemCount + 1,
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
        if (widget.header != null) {
          slivers.add(SliverToBoxAdapter(child: widget.header));
        }
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
            actions: widget.trailingIconData == null
                ? []
                : <Widget>[
                    IconButton(
                      icon: Icon(widget.trailingIconData),
                      onPressed: widget.trailingOnTap,
                    )
                  ],
          ),
          body: RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: _buildBody(context),
          ),
        );
    }
  }
}
