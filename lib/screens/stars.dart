import 'package:flutter/material.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/utils/utils.dart';

final starsRouter = RouterScreen('/:owner/:name/watchers', (context, params) {
  return StarsScreen(params['owner'].first, params['name'].first);
});

class StarsScreen extends StatelessWidget {
  final String owner;
  final String login;

  StarsScreen(this.owner, this.login);

  @override
  Widget build(BuildContext context) {
    return UsersScreen(login, UsersScreenType.watch, repoName: owner);
  }
}
