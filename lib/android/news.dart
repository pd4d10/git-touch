import 'package:flutter/material.dart';
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

  Widget _buildWithData(
      {ScrollController controller, Refresh refresh, List<Event> events}) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: RefreshIndicator(
        onRefresh: () async {
          await refresh();
          // Scaffold.of(context).showSnackBar(SnackBar(
          //   content: Container(
          //     child: Text('data'),
          //     padding: EdgeInsets.only(bottom: 10),
          //   )
          // ));
        },
        child: ListView.builder(
          controller: controller,
          itemCount: events.length + 1,
          itemBuilder: (context, index) {
            if (index == events.length) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: CircularProgressIndicator(),
              );
            } else {
              return EventItem(events[index]);
            }
          },
        ),
      ),
    );
  }
}
