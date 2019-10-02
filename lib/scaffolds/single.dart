import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/common.dart';

class SingleScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget trailing;

  SingleScaffold({
    @required this.title,
    @required this.body,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: title,
      body: Scrollbar(child: SingleChildScrollView(child: body)),
      action: trailing,
    );
  }
}
