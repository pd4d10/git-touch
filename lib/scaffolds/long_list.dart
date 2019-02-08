import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../providers/settings.dart';
import '../widgets/loading.dart';
import '../widgets/link.dart';
import '../widgets/error_reload.dart';

class LongListPayload<T, K> {
  T header;
  int totalCount;
  String cursor;
  List<K> leadingItems;
  List<K> trailingItems;

  LongListPayload({
    this.header,
    this.totalCount,
    this.cursor,
    this.leadingItems,
    this.trailingItems,
  });
}

// This is a scaffold for issue and pull request
// Since the list could be very long, and some users may only want to to check trailing items
// We should load leading and trailing items at first fetching, and do load more in the middle
// e.g. https://github.com/reactjs/rfcs/pull/68
class LongListScaffold<T, K> extends StatefulWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget trailing;
  final Widget Function(T headerPayload) headerBuilder;
  final Widget Function(K itemPayload) itemBuilder;
  final Future<LongListPayload<T, K>> Function() onRefresh;
  final Future<LongListPayload<T, K>> Function(String cursor) onLoadMore;

  LongListScaffold({
    @required this.title,
    this.actions,
    this.trailing,
    @required this.headerBuilder,
    @required this.itemBuilder,
    @required this.onRefresh,
    @required this.onLoadMore,
  });

  @override
  _LongListScaffoldState createState() => _LongListScaffoldState();
}

class _LongListScaffoldState<T, K> extends State<LongListScaffold<T, K>> {
  bool loading;
  bool loadingMore = false;
  String error = '';

  LongListPayload<T, K> payload;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    // print('long list scaffold refresh');
    setState(() {
      error = '';
      loading = true;
    });
    try {
      payload = await widget.onRefresh();
    } catch (err) {
      // print(err);
      error = err.toString();
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  Future<void> _loadMore() async {
    // print('long list scaffold load more');
    setState(() {
      loadingMore = true;
    });
    try {
      var _payload = await widget.onLoadMore(payload.cursor);
      payload.totalCount = _payload.totalCount;
      payload.cursor = _payload.cursor;
      payload.leadingItems.addAll(_payload.leadingItems);
    } finally {
      if (mounted) {
        setState(() {
          loadingMore = false;
        });
      }
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index % 2 == 1) {
      return Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
      );
    }

    int realIndex = index ~/ 2;

    if (realIndex < payload.leadingItems.length) {
      return widget.itemBuilder(payload.leadingItems[realIndex]);
    } else if (realIndex == payload.leadingItems.length) {
      var count = payload.totalCount -
          payload.leadingItems.length +
          payload.trailingItems.length;
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('images/progressive-disclosure-line.png',
                scale: 2),
            repeat: ImageRepeat.repeatX,
          ),
        ),
        child: Center(
          child: Link(
            beforeRedirect: _loadMore,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: <Widget>[
                  Text('$count hidden items',
                      style: TextStyle(color: Colors.black87, fontSize: 15)),
                  Padding(padding: EdgeInsets.only(top: 4)),
                  loadingMore
                      ? CupertinoActivityIndicator()
                      : Text(
                          'Load more...',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 16),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return widget.itemBuilder(
          payload.trailingItems[realIndex - payload.leadingItems.length - 1]);
    }
  }

  int get _itemCount {
    int count = payload.leadingItems.length + payload.trailingItems.length;
    if (payload.totalCount > count) {
      count++;
    }
    return 2 * count; // including bottom border
  }

  Widget _buildSliver() {
    if (error.isNotEmpty) {
      return ErrorReload(text: error, reload: _refresh);
    } else if (loading) {
      return SliverToBoxAdapter(child: Loading(more: false));
    } else {
      return SliverList(
        delegate:
            SliverChildBuilderDelegate(_buildItem, childCount: _itemCount),
      );
    }
  }

  Widget _buildBody() {
    if (error.isNotEmpty) {
      return ErrorReload(text: error, reload: _refresh);
    } else if (loading) {
      return Loading(more: false);
    } else {
      return ListView.builder(itemCount: _itemCount, itemBuilder: _buildItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).theme) {
      case ThemeMap.cupertino:
        List<Widget> slivers = [
          CupertinoSliverRefreshControl(onRefresh: widget.onRefresh)
        ];
        if (payload != null) {
          slivers.add(
            SliverToBoxAdapter(child: widget.headerBuilder(payload.header)),
          );
        }
        slivers.add(_buildSliver());

        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: widget.title,
            trailing: widget.trailing,
          ),
          child: SafeArea(
            child: CustomScrollView(slivers: slivers),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(
            title: widget.title,
            actions: widget.actions,
          ),
          body: RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: _buildBody(),
          ),
        );
    }
  }
}
