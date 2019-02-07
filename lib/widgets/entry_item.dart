import 'package:flutter/cupertino.dart';
import 'link.dart';

class EntryItem extends StatelessWidget {
  final int count;
  final String text;
  final WidgetBuilder screenBuilder;

  EntryItem({this.count, this.text, this.screenBuilder});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Link(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              Text(count.toString(), style: TextStyle(fontSize: 18)),
              Text(text, style: TextStyle(fontSize: 13))
            ],
          ),
        ),
        screenBuilder: screenBuilder,
      ),
    );
  }
}
