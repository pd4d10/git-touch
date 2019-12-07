import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/models/github_trending.dart';
import 'package:git_touch/scaffolds/tab_stateful.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:http/http.dart' as http;
import 'package:git_touch/widgets/repository_item.dart';

class TrendingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return TabStatefulScaffold<Iterable<GithubTrendingItem>>(
      title: AppBarTitle('Trending'),
      tabs: ['Repositories', 'Users'],
      fetchData: (tabIndex) async {
        var uri = Uri.parse('https://github-trending-api.now.sh')
            .resolve(tabIndex == 1 ? '/developers' : '/');
        var res = await http.get(uri);
        return (json.decode(res.body) as List)
            .map((v) => GithubTrendingItem.fromJson(v));
      },
      bodyBuilder: (payload, activeTab) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: join(
            CommonStyle.border,
            payload.map<Widget>((item) {
              switch (activeTab) {
                case 0:
                  return RepositoryItem.raw(
                    item.author,
                    item.avatar,
                    item.name,
                    item.description,
                    Octicons.repo,
                    item.stars,
                    item.forks,
                    item.language,
                    item.languageColor,
                    (_) => RepositoryScreen(item.author, item.name),
                    [],
                  );
                case 1:
                  return UserItem(
                    login: item.author,
                    name: item.name,
                    avatarUrl: item.avatar,
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
