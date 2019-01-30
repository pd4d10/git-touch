import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';

typedef Future<void> Refresh();
typedef Widget BuildWithContent(
    {List<Event> events, ScrollController controller, Refresh refresh});

class NewsProvider extends StatefulWidget {
  final BuildWithContent build;

  NewsProvider(this.build);

  @override
  NewsProviderState createState() => NewsProviderState();
}

class NewsProviderState extends State<NewsProvider> {
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

  @override
  Widget build(context) {
    return widget.build(
      events: _events,
      controller: _controller,
      refresh: _refresh,
    );
  }
}
