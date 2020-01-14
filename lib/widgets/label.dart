import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';

class Label extends StatelessWidget {
  final String name;
  final Color color;
  final String cssColor;

  Label({
    @required this.name,
    this.color,
    this.cssColor,
  });

  @override
  Widget build(BuildContext context) {
    final _color = color ?? convertColor(cssColor);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 13,
          color: getFontColorByBrightness(_color),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
