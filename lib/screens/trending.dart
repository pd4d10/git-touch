import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/tab_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:http/http.dart' as http;
import 'package:git_touch/widgets/repository_item.dart';
import 'package:provider/provider.dart';

class TrendingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return TabStatefulScaffold<Iterable>(
      title: AppBarTitle('Trending'),
      tabs: ['Repositories', 'Developers'],
      fetchData: (tabIndex) async {
        final uri = Uri.parse('https://github-trending-api.now.sh')
            .resolve(tabIndex == 1 ? '/developers' : '/');
        final res = await http.get(uri);
        return json.decode(res.body) as List;
      },
      bodyBuilder: (payload, activeTab) {
        final theme = Provider.of<ThemeModel>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: join(
            CommonStyle.border,
            payload.map<Widget>((v) {
              switch (activeTab) {
                case 0:
                  final item = GithubTrendingItem.fromJson(v);
                  return RepositoryItem.gh(
                    owner: item.author,
                    avatarUrl: item.avatar,
                    name: item.name,
                    description: item.description,
                    starCount: item.stars ?? 0,
                    forkCount: item.forks ?? 0,
                    primaryLanguageName: item.language,
                    primaryLanguageColor: item.languageColor,
                    note: '${item.currentPeriodStars} stars today',
                    isPrivate: false,
                    isFork: false, // TODO:
                  );
                case 1:
                  final item = GithubTrendingUser.fromJson(v);
                  return UserItem(
                    login: item.username,
                    name: item.name,
                    avatarUrl: item.avatar,
                    bio: Row(
                      children: <Widget>[
                        Icon(
                          Octicons.repo,
                          size: 15,
                          color: theme.palette.secondaryText,
                        ),
                        SizedBox(width: 2),
                        Text(item.repo.name)
                      ],
                    ),
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
