import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class BorderView extends StatelessWidget {
  final double height;
  final double leftPadding;

  BorderView({
    this.height = 1,
    this.leftPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return Row(
      children: <Widget>[
        SizedBox(
          width: leftPadding,
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(color: theme.palette.background),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: height,
            child: DecoratedBox(
              decoration: BoxDecoration(color: theme.palette.border),
            ),
          ),
        ),
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
