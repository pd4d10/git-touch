import 'package:flutter/cupertino.dart';
import 'package:git_flux/utils/utils.dart';
import 'package:git_flux/widgets/news_provider.dart';
import 'package:git_flux/widgets/event_item.dart';

class NewsScreen extends StatefulWidget {
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(context) {
    return NewsProvider(_buildWithData);
  }

  Widget _buildWithData({
    ScrollController controller,
    Refresh refresh,
    List<Event> events,
  }) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('News'),
            // trailing: Icon(Octicons.settings),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: refresh,
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == events.length) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: CupertinoActivityIndicator(radius: 12),
                    );
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
