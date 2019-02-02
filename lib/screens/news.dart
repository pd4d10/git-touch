import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/settings.dart';
import '../widgets/event_item.dart';
import '../widgets/loading.dart';
import '../utils/utils.dart';

class NewsScreen extends StatefulWidget {
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  int page = 1;
  bool loading = false;
  List<Event> _events = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _refresh();
    _controller.addListener(() {
      if (_controller.offset + 100 > _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange &&
          !loading) {
        _loadMore();
      }
    });
  }

  Future<void> _refresh() async {
    setState(() {
      loading = true;
    });
    page = 1;
    var items = await fetchEvents(page);
    setState(() {
      loading = false;
      _events = items;
    });
  }

  _loadMore() async {
    print('more');
    setState(() {
      loading = true;
    });
    page = page + 1;
    var items = await fetchEvents(page);
    setState(() {
      loading = false;
      _events.addAll(items);
    });
  }

  Widget _buildItems(BuildContext context, int index) {
    // return Loading(more: false);
    if (_events.length == 0) {
      return Loading(more: false);
    }
    if (index == _events.length) {
      return Loading(more: true);
    }
    return EventItem(_events[index]);
  }

  @override
  Widget build(context) {
    switch (SettingsProvider.of(context).layout) {
      case LayoutMap.cupertino:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('News')),
          child: SafeArea(
            child: CustomScrollView(
              controller: _controller,
              slivers: <Widget>[
                CupertinoSliverRefreshControl(onRefresh: _refresh),
                SliverSafeArea(
                  top: false,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(_buildItems,
                        childCount: _events.length + 1),
                  ),
                  // sliver: SliverList(
                  //   delegate:
                  //       SliverChildBuilderDelegate(_buildItems, childCount: 1),
                  // ),
                ),
              ],
            ),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(title: Text('News')),
          body: RefreshIndicator(
            onRefresh: () async {
              await _refresh();
              // Scaffold.of(context).showSnackBar(SnackBar(
              //   content: Container(
              //     child: Text('data'),
              //     padding: EdgeInsets.only(bottom: 10),
              //   )
              // ));
            },
            child: ListView.builder(
              controller: _controller,
              itemCount: _events.length + 1,
              // itemCount: 1,
              itemBuilder: _buildItems,
            ),
          ),
        );
    }
  }
}
