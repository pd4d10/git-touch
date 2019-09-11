import 'package:flutter/material.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import '../scaffolds/simple.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: AppBarTitle('Not Found'),
      bodyBuilder: () {
        return Text('Woops, This page is not implemented yet');
      },
    );
  }
}
