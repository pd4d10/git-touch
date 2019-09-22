import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:primer/primer.dart';
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
      child: Link(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: <Widget>[
              Text(
                numberFormat.format(count),
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: PrimerColors.gray700,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        screenBuilder: screenBuilder,
        url: url,
      ),
    );
  }
}
