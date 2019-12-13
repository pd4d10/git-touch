import 'package:flutter/material.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/utils/utils.dart';

final watchersRouter =
    RouterScreen('/:owner/:name/watchers', (context, params) {
  return WatchersScreen(params['owner'].first, params['name'].first);
});

class WatchersScreen extends StatelessWidget {
  final String owner;
  final String name;

  WatchersScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return UsersScreen(owner, UsersScreenType.watch, repoName: name);
  }
}
