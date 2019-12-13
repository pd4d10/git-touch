import 'package:flutter/material.dart';
import 'package:git_touch/screens/issue.dart';
import 'package:git_touch/utils/utils.dart';

final pullRouter = RouterScreen(
    '/:owner/:name/pulls/:number',
    (context, params) => PullScreen(params['owner'].first, params['name'].first,
        int.parse(params['number'].first)));

class PullScreen extends StatelessWidget {
  final String owner;
  final String name;
  final int number;

  PullScreen(this.owner, this.name, this.number);

  @override
  Widget build(BuildContext context) {
    return IssueScreen(owner, name, number, isPullRequest: true);
  }
}
