import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/tab_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:http/http.dart' as http;
import 'package:git_touch/widgets/repository_item.dart';

class TrendingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return TabStatefulScaffold<Iterable>(
      title: AppBarTitle('Trending'),
      tabs: ['Repositories', 'Users'],
      fetchData: (tabIndex) async {
        final uri = Uri.parse('https://github-trending-api.now.sh')
            .resolve(tabIndex == 1 ? '/developers' : '/');
        final res = await http.get(uri);
        return json.decode(res.body) as List;
      },
      bodyBuilder: (payload, activeTab) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: join(
            CommonStyle.border,
            payload.map<Widget>((v) {
              switch (activeTab) {
                case 0:
                  final item = GithubTrendingItem.fromJson(v);
                  return RepositoryItem.raw(
                    item.author,
                    item.avatar,
                    item.name,
                    item.description,
                    Octicons.repo,
                    item.stars ?? 0,
                    item.forks ?? 0,
                    item.language,
                    item.languageColor,
                    [],
                  );
                case 1:
                  final item = GithubTrendingUser.fromJson(v);
                  return UserItem(
                    login: item.username,
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
