import 'package:flutter/material.dart';
import 'package:git_touch/screens/users.dart';
import 'package:git_touch/utils/utils.dart';

final stargazersRouter =
    RouterScreen('/:owner/:name/stargazers', (context, params) {
  return StargazersScreen(params['owner'].first, params['name'].first);
});

class StargazersScreen extends StatelessWidget {
  final String owner;
  final String name;

  StargazersScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return UsersScreen(owner, UsersScreenType.star, repoName: name);
  }
}
