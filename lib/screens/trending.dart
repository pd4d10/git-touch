import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../scaffolds/refresh.dart';
import '../widgets/repo_item.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  Future<List<dynamic>> _fetchTrendingRepos() async {
    var res = await http.get('https://github-trending-api.now.sh');
    var items = json.decode(res.body);

    return items.map((item) {
      return {
        'owner': {
          'login': item['author'],
        },
        'name': item['name'],
        'description': item['description'],
        'stargazers': {
          'totalCount': item['stars'],
        },
        'forks': {
          'totalCount': item['forks'],
        },
        'primaryLanguage': item['language'] == null
            ? null
            : {
                'name': item['language'],
                'color': item['languageColor'],
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
