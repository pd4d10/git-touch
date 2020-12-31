import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/tab_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:github_trending/github_trending.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class GhTrendingScreen extends StatelessWidget {
  static final trending = GithubTrending(prefix: 'https://gtrend.yapie.me');

  Widget build(BuildContext context) {
    return TabStatefulScaffold<List>(
      title: AppBarTitle(S.of(context).trending),
      tabs: [S.of(context).repositories, S.of(context).developers],
      fetchData: (tabIndex) async {
        if (tabIndex == 0) {
          return trending.getTrendingRepositories();
        } else {
          return trending.getTrendingDevelopers();
        }
      },
      bodyBuilder: (payload, activeTab) {
        final theme = Provider.of<ThemeModel>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: join(
            CommonStyle.border,
            activeTab == 0
                ? [
                    for (var v in payload.cast<GithubTrendingRepository>())
                      RepositoryItem.gh(
                        owner: v.author,
                        avatarUrl: v.avatar,
                        name: v.name,
                        description: v.description,
                        starCount: v.stars ?? 0,
                        forkCount: v.forks ?? 0,
                        primaryLanguageName: v.language,
                        primaryLanguageColor: v.languageColor,
                        note: '${v.currentPeriodStars} stars today',
                        isPrivate: false,
                        isFork: false, // TODO:
                      )
                  ]
                : [
                    for (var v in payload.cast<GithubTrendingDeveloper>())
                      UserItem.github(
                        login: v.username,
                        name: v.name,
                        avatarUrl: v.avatar,
                        bio: v.repo == null
                            ? null
                            : Link(
                                url: '/github/${v.username}/${v.repo.name}',
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Octicons.repo,
                                      size: 17,
                                      color: theme.palette.secondaryText,
                                    ),
                                    SizedBox(width: 4),
                                    Expanded(
                                        child: Text(
                                      '${v.username} / ${v.repo.name}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: theme.palette.secondaryText,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                                  ],
                                ),
                              ),
                      )
                  ],
          ),
        );
      },
    );
  }
}
