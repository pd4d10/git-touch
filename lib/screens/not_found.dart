import 'package:flutter/material.dart';
import '../scaffolds/simple.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: Text('Not Found'),
      bodyBuilder: () {
        return Text('Woops, This page is not implemented yet');
      },
    );
  }
}
