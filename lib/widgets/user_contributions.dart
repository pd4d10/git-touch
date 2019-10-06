import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:github_contributions/github_contributions.dart';

class UserContributions extends StatelessWidget {
  final List<ContributionsInfo> contributions;

  UserContributions(this.contributions);

  @override
  Widget build(BuildContext context) {
    final row = Row(
      children: <Widget>[],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
    Column column;

    contributions.asMap().forEach((i, v) {
      var rect = SizedBox(
        width: 10,
        height: 10,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: convertColor(v.color),
          ),
        ),
      );

      if (i % 7 == 0) {
        column = Column(children: <Widget>[rect]);
        row.children.add(column);
        row.children.add(SizedBox(width: 3));
      } else {
        column.children.add(SizedBox(height: 3));
        column.children.add(rect);
      }
    });

    return Container(
      color: Colors.white,
      padding: CommonStyle.padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: row,
      ),
    );
  }
}
