import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import 'link.dart';

const repoChunk = '''
owner {
  __typename
  login
  avatarUrl
}
name
description
isPrivate
isFork
stargazers {
  totalCount
}
forks {
  totalCount
}
primaryLanguage {
  color
  name
}
''';

class RepositoryItem extends StatelessWidget {
  final String owner;
  final String avatarUrl;
  final String name;
  final String description;
  final IconData iconData;
  final int starCount;
  final int forkCount;
  final String primaryLanguageName;
  final String primaryLanguageColor;
  final Widget Function(BuildContext context) screenBuilder;
  final bool inRepoScreen;
  final List topics;

  RepositoryItem(payload, {this.inRepoScreen = false})
      : this.owner = payload['owner']['login'],
        this.avatarUrl = payload['owner']['avatarUrl'],
        this.name = payload['name'],
        this.description = payload['description'],
        this.iconData = _buildIconData(payload),
        this.starCount = payload['stargazers']['totalCount'],
        this.forkCount = payload['forks']['totalCount'],
        this.primaryLanguageName = payload['primaryLanguage'] == null
            ? null
            : payload['primaryLanguage']['name'],
        this.primaryLanguageColor = payload['primaryLanguage'] == null
            ? null
            : payload['primaryLanguage']['color'],
        this.screenBuilder = ((_) =>
            RepositoryScreen(payload['owner']['login'], payload['name'])),
        this.topics = payload['repositoryTopics'] == null
            ? []
            : payload['repositoryTopics']['nodes'];

  RepositoryItem.gitlab(payload, {this.inRepoScreen = false})
      : this.owner = payload['namespace']['name'],
        this.avatarUrl = payload['owner']['avatar_url'],
        this.name = payload['name'],
        this.description = payload['description'],
        this.iconData = Octicons.repo,
        this.starCount = payload['star_count'],
        this.forkCount = payload['forks_count'],
        this.primaryLanguageName = null,
        this.primaryLanguageColor = null,
        this.screenBuilder = ((_) =>
            RepositoryScreen(payload['owner']['login'], payload['name'])),
        this.topics = [];

  static IconData _buildIconData(payload) {
    if (payload['isPrivate']) {
      return Octicons.lock;
    }
    if (payload['isFork']) {
      return Octicons.repo_forked;
    }
    return Octicons.repo;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    // TODO: text style
    return Link(
      screenBuilder: inRepoScreen ? null : screenBuilder,
      onLongPress: () async {
        await Provider.of<ThemeModel>(context).showActions(context, [
          ActionItem.user(owner),
          ActionItem.repository(owner, name),
        ]);
      },
      child: Container(
        padding: CommonStyle.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Avatar.small(url: avatarUrl),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: join(SizedBox(height: 8), <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        owner + ' / ',
                        style: TextStyle(
                          fontSize: inRepoScreen ? 18 : 16,
                          color: theme.palette.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: inRepoScreen ? 18 : 16,
                          color: theme.palette.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(iconData,
                          size: 18, color: theme.palette.tertiaryText),
                    ],
                  ),
                  if (description != null && description.isNotEmpty)
                    Text(
                      description,
                      style: TextStyle(
                          color: theme.palette.secondaryText,
                          fontSize: inRepoScreen ? 15 : 14),
                    ),
                  if (inRepoScreen)
                    // TODO: link
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: topics.map((node) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: PrimerColors.blue000,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Text(
                            node['topic']['name'],
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.palette.primary,
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  else
                    DefaultTextStyle(
                      style: TextStyle(
                        color: theme.palette.text,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(children: <Widget>[
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: convertColor(primaryLanguageColor),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(primaryLanguageName ?? 'Unknown'),
                            ]),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Octicons.star,
                                    size: 14, color: theme.palette.text),
                                Text(numberFormat.format(starCount)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Octicons.repo_forked,
                                    size: 14, color: theme.palette.text),
                                Text(numberFormat.format(forkCount)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
