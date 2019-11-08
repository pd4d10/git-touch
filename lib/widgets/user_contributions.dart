import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:github_contributions/github_contributions.dart';
import 'package:provider/provider.dart';

class UserContributions extends StatelessWidget {
  final List<ContributionsInfo> contributions;

  UserContributions(this.contributions);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    final row = Row(
      children: <Widget>[],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
    Column column;

    contributions.asMap().forEach((i, v) {
      var color = convertColor(v.color);
      if (theme.brightness == Brightness.dark) {
        color = Color.fromRGBO(
            0xff - color.red, 0xff - color.green, 0xff - color.blue, 1);
      }
      final rect = SizedBox(
        width: 10,
        height: 10,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color),
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
      color: theme.palette.background,
      padding: CommonStyle.padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: row,
      ),
    );
  }
}
