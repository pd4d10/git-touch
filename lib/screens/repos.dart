import 'package:flutter/material.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import '../scaffolds/list.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import '../widgets/repo_item.dart';

/// Repos of user
class ReposScreen extends StatelessWidget {
  final String login;
  final bool star;
  final bool org;

  ReposScreen(this.login, {this.star = false, this.org = false});

  String get scope => org ? 'organization' : 'user';
  String get resource => star ? 'starredRepositories' : 'repositories';
  String get fieldOrderBy {
    if (star) {
      return 'STARRED_AT';
    }
    if (org) {
      return 'PUSHED_AT';
    }
    return 'UPDATED_AT';
  }

  Future<ListPayload> _queryRepos(BuildContext context, [String cursor]) async {
    var cursorChunk = cursor == null ? '' : ', after: "$cursor"';
    // FIXME: organization scope not work due to permissions
    var data = await Provider.of<SettingsModel>(context).query('''
{
  $scope(login: "$login") {
    $resource(first: $pageSize$cursorChunk, orderBy: {field: $fieldOrderBy, direction: DESC}) {
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
    var repo = data[scope][resource];

    return ListPayload(
      cursor: repo["pageInfo"]["endCursor"],
      items: repo["nodes"],
      hasMore: repo['pageInfo']['hasNextPage'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      title: AppBarTitle(star ? 'Stars' : 'Repositories'),
      onRefresh: () => _queryRepos(context),
      onLoadMore: (cursor) => _queryRepos(context, cursor),
      itemBuilder: (payload) => RepoItem(payload),
    );
  }
}
