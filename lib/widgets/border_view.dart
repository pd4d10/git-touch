import 'package:flutter/material.dart';
import 'package:primer/primer.dart';

class BorderView extends StatelessWidget {
  final double height;
  final Color color;
  final double leftPadding;

  const BorderView({
    this.height = 1,
    this.color = PrimerColors.gray100,
    this.leftPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    final b = SizedBox(
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(color: color),
      ),
    );
    if (leftPadding == 0) {
      return b;
    }

    return Row(
      children: <Widget>[
        SizedBox(
          width: leftPadding,
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(color: PrimerColors.white),
          ),
        ),
        Expanded(child: b),
      ],
    );

    // Physical pixel
    // return Container(
    //   margin: EdgeInsets.only(left: leftPadding),
    //   decoration: BoxDecoration(
    //     border: Border(
    //       top: BorderSide(color: color, width: height),
    //     ),
    //   ),
    // );
  }
}
