import 'package:flutter/material.dart';
import 'package:github_trending/github_trending.dart';
import '../scaffolds/refresh.dart';
import '../widgets/repo_item.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  Future<List<dynamic>> _fetchTrendingRepos() async {
    var items = await getTrendingRepositories();

    return items.map((item) {
      return {
        'owner': {
          'login': item.owner,
        },
        'name': item.name,
        'description': item.description,
        'stargazers': {
          'totalCount': item.starCount,
        },
        'forks': {
          'totalCount': item.forkCount,
        },
        'primaryLanguage': item.primaryLanguage == null
            ? null
            : {
                'name': item.primaryLanguage.name,
                'color': item.primaryLanguage.color,
              },
        'isPrivate': false,
        'isFork': false // TODO:
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: Text('Trending'),
      onRefresh: _fetchTrendingRepos,
      bodyBuilder: (payload) {
        return Column(
          children: payload.map<Widget>((repo) {
            return Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: RepoItem(repo),
            );
          }).toList(),
        );
      },
    );
  }
}
