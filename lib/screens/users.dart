import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class UsersScreen extends StatelessWidget {
  final String scope;
  final String params;
  final String resource;
  final String title;

  UsersScreen.followers(String login)
      : scope = 'user',
        params = 'login: "$login"',
        resource = 'followers',
        title = 'Followers';
  UsersScreen.following(String login)
      : scope = 'user',
        params = 'login: "$login"',
        resource = 'following',
        title = 'Following';
  UsersScreen.stars(String owner, String name)
      : scope = 'repository',
        params = 'owner: "$owner", name: "$name"',
        resource = 'stargazers',
        title = 'Stargazers';
  UsersScreen.watchers(String owner, String name)
      : scope = 'repository',
        params = 'owner: "$owner", name: "$name"',
        resource = 'watchers',
        title = 'Watchers';
  UsersScreen.members(String login)
      : scope = 'organization',
        params = 'login: "$login"',
        resource = 'membersWithRole',
        title = 'Members';

  Future<ListPayload> _queryUsers(BuildContext context, [String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    var data = await Provider.of<SettingsModel>(context).query('''
{
  $scope($params) {
    $resource(first: $pageSize$cursorChunk) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        name
        login
        avatarUrl
        bio
      }
    }
  }
}    
    ''');
    var repo = data[scope][resource];

    return ListPayload(
      cursor: repo["pageInfo"]["endCursor"],
      hasMore: repo['pageInfo']['hasNextPage'],
      items: repo["nodes"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold(
      title: AppBarTitle(title),
      onRefresh: () => _queryUsers(context),
      onLoadMore: (cursor) => _queryUsers(context, cursor),
      itemBuilder: (payload) => UserItem(
        payload['login'],
        name: payload['name'],
        avatarUrl: payload['avatarUrl'],
        bio: payload['bio'],
      ),
    );
  }
}
