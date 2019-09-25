import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import 'package:git_touch/widgets/repository_item.dart';

class RepositoriesScreen extends StatelessWidget {
  final String login;
  final String title;
  final String scope;
  final String resource;
  final String extra0;
  final String extra1;
  final String extra2;

  RepositoriesScreen(this.login)
      : title = 'Repositories',
        scope = 'user',
        resource = 'repositories',
        extra0 = 'orderBy: {field: UPDATED_AT, direction: DESC}',
        extra1 = '',
        extra2 = '';
  RepositoriesScreen.stars(this.login)
      : title = 'Stars',
        scope = 'user',
        resource = 'starredRepositories',
        extra0 = 'orderBy: {field: STARRED_AT, direction: DESC}',
        extra1 = '',
        extra2 = '';
  RepositoriesScreen.ofOrganization(this.login)
      : title = 'Repositories',
        scope = 'organization',
        resource = 'pinnableItems',
        extra0 = 'types: [REPOSITORY]',
        extra1 = '... on Repository {',
        extra2 = '}';

  Future<ListPayload> _queryRepos(BuildContext context, [String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    var data = await Provider.of<SettingsModel>(context).query('''
{
  $scope(login: "$login") {
    $resource(first: $pageSize$cursorChunk, $extra0) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        $extra1
        $repoChunk
        $extra2
      }
    }
  }
}    
    ''');
    var repo = data[scope][resource];

    return ListPayload(
      cursor: repo["pageInfo"]["endCursor"],
      items: repo["nodes"],
      hasMore: repo['pageInfo']['hasNextPage'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold(
      title: AppBarTitle(title),
      onRefresh: () => _queryRepos(context),
      onLoadMore: (cursor) => _queryRepos(context, cursor),
      itemBuilder: (payload) => RepositoryItem(payload),
    );
  }
}
