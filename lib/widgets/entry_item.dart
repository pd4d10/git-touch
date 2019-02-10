import 'package:flutter/cupertino.dart';
import 'link.dart';

class EntryItem extends StatelessWidget {
  final int count;
  final String text;
  final WidgetBuilder screenBuilder;
  final String url;

  EntryItem({this.count, this.text, this.screenBuilder, this.url});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Link(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              Text(count == null ? '' : count.toString(),
                  style: TextStyle(fontSize: 18)),
              Text(text, style: TextStyle(fontSize: 13))
            ],
          ),
        ),
        screenBuilder: screenBuilder,
        url: url,
      ),
    );
  }
}
