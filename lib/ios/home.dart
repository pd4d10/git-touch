import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_flux/utils/utils.dart';
import 'package:git_flux/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     GlobalKey<RefreshIndicatorState>();
  int page = 1;
  bool loading = false;
  List<Event> events = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // FIXME: context hack
    // Future.delayed(Duration(seconds: 0)).then((_) {
    //   EventProvider.of(context).update.add(true);
    // });
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
      events = items;
    });
  }

  Future<void> _loadMore() async {
    print('more');
    setState(() {
      loading = true;
    });
    page = page + 1;
    var items = await fetchEvents(page);
    setState(() {
      loading = false;
      events.addAll(items);
    });
  }

  Widget _buildBottomIndicator() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: CupertinoActivityIndicator(radius: 12));
  }

  @override
  Widget build(context) {
    // Navigator.of(context).pushNamed('/user');
    // final eventBloc = EventProvider.of(context);

    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('News'),
            trailing: Icon(Octicons.settings),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: _refresh,
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == events.length) {
                    return _buildBottomIndicator();
                  } else {
                    return EventItem(events[index]);
                  }
                },
                childCount: events.length + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
