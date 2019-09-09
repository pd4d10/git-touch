import 'package:flutter/material.dart';
import 'package:primer/primer.dart';
import '../scaffolds/list.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
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

    var data = await Provider.of<SettingsModel>(context).query('''
{
  $scope(login: "$login") {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Avatar(url: payload['avatarUrl'], size: 20),
            SizedBox(width: 10),
            DefaultTextStyle(
              style: TextStyle(color: PrimerColors.gray900, fontSize: 13),
              child: Expanded(
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
                    Text(payload['url'], style: TextStyle(fontSize: 14))
                  ]),
                ),
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
      title: Text('$login\'s $resource'),
      onRefresh: () => _queryUsers(),
      onLoadMore: (cursor) => _queryUsers(cursor),
      itemBuilder: _buildItem,
    );
  }
}
