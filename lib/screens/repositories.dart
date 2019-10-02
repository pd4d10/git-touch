import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import 'package:git_touch/widgets/repository_item.dart';

class RepositoriesScreen extends StatelessWidget {
  final String title;
  final String scope;
  final String scopeParams;
  final String resource;
  final String extraFilter;
  final String queryChunk;

  RepositoriesScreen(String login)
      : title = 'Repositories',
        scope = 'user',
        scopeParams = 'login: "$login"',
        resource = 'repositories',
        extraFilter = ', orderBy: {field: UPDATED_AT, direction: DESC}',
        queryChunk = repoChunk;
  RepositoriesScreen.stars(String login)
      : title = 'Stars',
        scope = 'user',
        scopeParams = 'login: "$login"',
        resource = 'starredRepositories',
        extraFilter = ', orderBy: {field: STARRED_AT, direction: DESC}',
        queryChunk = repoChunk;
  RepositoriesScreen.ofOrganization(String login)
      : title = 'Repositories',
        scope = 'organization',
        scopeParams = 'login: "$login"',
        resource = 'pinnableItems',
        extraFilter = ', types: [REPOSITORY]',
        queryChunk = '... on Repository { $repoChunk }';
  RepositoriesScreen.forks(String owner, String name)
      : title = 'Forks',
        scope = 'repository',
        scopeParams = 'owner: "$owner", name: "$name"',
        resource = 'forks',
        extraFilter = ', orderBy: {field: CREATED_AT, direction: DESC}',
        queryChunk = repoChunk;

  Future<ListPayload> _queryRepos(BuildContext context, [String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    var data = await Provider.of<AuthModel>(context).query('''
{
  $scope($scopeParams) {
    $resource(first: $pageSize$cursorChunk$extraFilter) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        $queryChunk
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
