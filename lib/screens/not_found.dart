import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/widgets/app_bar_title.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleScaffold(
      title: AppBarTitle('Not Found'),
      body: Text('Woops, This page is not implemented yet'),
    );
  }
}
