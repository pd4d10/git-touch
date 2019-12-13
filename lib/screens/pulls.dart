import 'package:flutter/material.dart';
import 'package:git_touch/screens/issues.dart';
import 'package:git_touch/utils/utils.dart';

final pullsRouter = RouterScreen(
    '/:owner/:name/pulls',
    (context, params) =>
        PullsScreen(params['owner'].first, params['name'].first));

class PullsScreen extends StatelessWidget {
  final String owner;
  final String name;

  PullsScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return IssuesScreen(owner, name, isPullRequest: true);
  }
}
