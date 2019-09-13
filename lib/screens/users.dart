import 'package:flutter/material.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:primer/primer.dart';
import 'package:tuple/tuple.dart';
import '../scaffolds/list.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import '../widgets/link.dart';
import '../screens/user.dart';
import '../widgets/avatar.dart';

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
        url
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

  Widget _buildItem(payload) {
    return Link(
      screenBuilder: (_) => UserScreen(payload['login']),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Avatar(url: payload['avatarUrl'], size: 24),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: join(SizedBox(height: 6), [
                  Text(
                    payload['name'] ?? payload['login'],
                    style: TextStyle(
                      fontSize: 16,
                      color: PrimerColors.blue500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    payload['login'],
                    style: TextStyle(fontSize: 14, color: PrimerColors.gray700),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: AppBarTitle('Users'),
      onRefresh: () => _queryUsers(context),
      onLoadMore: (cursor) => _queryUsers(context, cursor),
      itemBuilder: _buildItem,
    );
  }
}
