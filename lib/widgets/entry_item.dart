import 'package:flutter/cupertino.dart';
import 'link.dart';

class EntryItem extends StatelessWidget {
  final int count;
  final String text;
  final CupertinoPageRoute route;

  EntryItem({this.count, this.text, this.route});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Link(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              Text(count.toString()),
              Text(text, style: TextStyle(fontSize: 13))
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(route);
        },
      ),
    );
  }
}
