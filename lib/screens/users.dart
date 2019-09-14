import 'package:flutter/material.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:tuple/tuple.dart';
import '../scaffolds/list.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

enum UsersScreenType {
  userFollowing,
  userFollowers,
  repoStars,
  repoWatchers,
  orgs,
}

class UsersScreen extends StatelessWidget {
  final UsersScreenType type;
  final String login;
  final String name;

  UsersScreen({
    @required this.type,
    @required this.login,
    this.name,
  });

  Tuple3<String, String, String> get queryKeys {
    switch (type) {
      case UsersScreenType.userFollowing:
        return Tuple3('user', 'login: "$login"', 'following');
      case UsersScreenType.userFollowers:
        return Tuple3('user', 'login: "$login"', 'followers');
      case UsersScreenType.repoStars:
        return Tuple3(
            'repository', 'owner: "$login", name: "$name"', 'stargazers');
      case UsersScreenType.repoWatchers:
        return Tuple3(
            'repository', 'owner: "$login", name: "$name"', 'watchers');
      case UsersScreenType.orgs:
        return Tuple3('', '', ''); // FIXME:
      default:
        throw 'Should not be here';
    }
  }

  Future<ListPayload> _queryUsers(BuildContext context, [String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    var scope = queryKeys.item1;
    var params = queryKeys.item2;
    var resource = queryKeys.item3;
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
    return ListScaffold(
      title: AppBarTitle('Users'),
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
