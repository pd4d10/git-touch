import 'package:flutter/material.dart';
import '../scaffolds/list.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';
import '../widgets/repo_item.dart';

/// Repos of user
class ReposScreen extends StatefulWidget {
  final String login;
  final bool star;

  ReposScreen({this.login, this.star = false});

  @override
  _ReposScreenState createState() => _ReposScreenState();
}

class _ReposScreenState extends State<ReposScreen> {
  get login => widget.login;

  Future<ListPayload> _queryRepos([String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    var resouce = widget.star ? 'starredRepositories' : 'repositories';
    var fieldOrderBy = widget.star ? 'STARRED_AT' : 'UPDATED_AT';

    var data = await SettingsProvider.of(context).query('''
{
  user(login: "$login") {
    $resouce(first: $pageSize$cursorChunk, orderBy: {field: $fieldOrderBy, direction: DESC}) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        $repoChunk
      }
    }
  }
}    
    ''');
    var repo = data["user"][resouce];

    return ListPayload(
      cursor: repo["pageInfo"]["endCursor"],
      items: repo["nodes"],
      end: repo['pageInfo']['hasNextPage'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: Text('$login\'s repositories'),
      onRefresh: () => _queryRepos(),
      onLoadMore: (cursor) => _queryRepos(cursor),
      itemBuilder: (payload) => RepoItem(payload),
    );
  }
}
