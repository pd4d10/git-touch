import 'dart:math';

import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class ContributionDay {
  String hexColor;
  int count;
  Color color;
  ContributionDay({this.hexColor, this.count, this.color})
      : assert(hexColor != null || count != null || color != null);
}

class ContributionWidget extends StatelessWidget {
  final Iterable<Iterable<ContributionDay>> weeks;
  ContributionWidget({@required this.weeks}) {
    int maxCount;
    for (var week in weeks) {
      for (var day in week) {
        if (day.count != null) {
          if (maxCount == null) {
            for (var week in weeks) {
              for (var day in week) {
                maxCount = max(day.count, maxCount ?? 0);
              }
            }
          }
          if (day.count == 0) {
            day.hexColor = emptyColor;
          } else {
            final level = (day.count * 4) ~/ (maxCount + 1);
            day.hexColor = colors[level];
          }
        }
        if (day.hexColor != null) {
          day.color = convertColor(day.hexColor);
        }
      }
    }
  }

  static const emptyColor = '#ebedf0';
  static const colors = ['#9be9a8', '#40c463', '#30a14e', '#216e39'];

  static Color _revert(Color color) {
    return Color.fromRGBO(
        0xff - color.red, 0xff - color.green, 0xff - color.blue, 1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeModel>();
    return Container(
      alignment: Alignment.center,
      padding: CommonStyle.padding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Wrap(
          spacing: 3,
          children: [
            for (final week in weeks)
              Wrap(
                direction: Axis.vertical,
                spacing: 3,
                children: [
                  for (final day in week)
                    SizedBox(
                      width: 10,
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: theme.brightness == Brightness.dark
                                ? _revert(day.color)
                                : day.color),
                      ),
                    )
                ],
              )
          ],
        ),
      ),
    );
  }
}
