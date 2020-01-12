import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';

class Label extends StatelessWidget {
  final String name;
  final String cssColor;

  Label({this.name, this.cssColor});

  @override
  Widget build(BuildContext context) {
    final color = convertColor(cssColor);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 12,
          color: getFontColorByBrightness(color),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
