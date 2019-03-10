import 'package:flutter/material.dart';
import '../scaffolds/list.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';
import '../widgets/link.dart';
import '../screens/user.dart';
import '../widgets/avatar.dart';

class UsersScreen extends StatefulWidget {
  final String login;
  final bool following;
  final bool org;

  UsersScreen({
    @required this.login,
    this.following = false,
    this.org = false,
  });

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  String get login => widget.login;
  String get scope => widget.org ? 'organization' : 'user';
  String get resource {
    if (widget.org) {
      return 'members';
    }
    if (widget.following) {
      return 'following';
    }
    return 'followers';
  }

  Future<ListPayload> _queryUsers([String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';

    var data = await SettingsProvider.of(context).query('''
{
  $scope(login: "$login") {
    $resource(first: $pageSize$cursorChunk) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        login
        avatarUrl
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
            Avatar(url: payload['avatarUrl']),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(payload['login'], style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text('$login\'s $resource'),
      onRefresh: () => _queryUsers(),
      onLoadMore: (cursor) => _queryUsers(cursor),
      itemBuilder: _buildItem,
    );
  }
}
