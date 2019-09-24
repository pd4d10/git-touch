import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/tab.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:http/http.dart' as http;
import 'package:git_touch/widgets/repository_item.dart';

class TrendingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return TabScaffold(
      title: AppBarTitle('Trending'),
      tabs: ['Repositories', 'Users'],
      onRefresh: (tabIndex) async {
        var uri = Uri.parse('https://github-trending-api.now.sh')
            .resolve(tabIndex == 1 ? '/developers' : '/');
        var res = await http.get(uri);
        var items = json.decode(res.body) as List;
        return items;
      },
      bodyBuilder: (payload, activeTab) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: join(
            borderView,
            payload.map<Widget>((item) {
              switch (activeTab) {
                case 0:
                  return RepositoryItem({
                    'owner': {
                      'login': item['author'],
                      'avatarUrl': item['avatar']
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
                  });
                case 1:
                  return UserItem(
                    item['username'],
                    name: item['name'],
                    avatarUrl: item['avatar'],
                    bio: '',
                  );
                default:
                  throw '';
              }
            }).toList(),
          ),
        );
      },
    );
  }
}
