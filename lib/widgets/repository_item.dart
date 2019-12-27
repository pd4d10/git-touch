import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/github_repository.dart';
import 'package:git_touch/graphql/github_user.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/theme.dart';
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
  final bool inRepoScreen;
  final Iterable<GithubRepositoryRepositoryTopic> topics;

  RepositoryItem.raw(
      this.owner,
      this.avatarUrl,
      this.name,
      this.description,
      this.iconData,
      this.starCount,
      this.forkCount,
      this.primaryLanguageName,
      this.primaryLanguageColor,
      this.topics,
      {this.inRepoScreen = false});

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
        this.topics = [];

  RepositoryItem.github(GithubUserRepository payload,
      {this.inRepoScreen = false})
      : this.owner = payload.owner.login,
        this.avatarUrl = payload.owner.avatarUrl,
        this.name = payload.name,
        this.description = payload.description,
        this.iconData = Octicons.repo, // TODO:
        this.starCount = payload.stargazers.totalCount,
        this.forkCount = payload.forks.totalCount,
        this.primaryLanguageName = payload.primaryLanguage?.name,
        this.primaryLanguageColor = payload.primaryLanguage?.color,
        this.topics = []; // TODO:
  // this.topics = payload['repositoryTopics'] == null
  // ? []
  // : payload['repositoryTopics']['nodes'];

  static _getGitlabIcon(String visibility) {
    switch (visibility) {
      case 'internal':
        return FontAwesome.shield;
      case 'public':
        return FontAwesome.globe;
      case 'private':
        return FontAwesome.lock;
      default:
        return Octicons.repo;
    }
  }

  RepositoryItem.gitlab(GitlabUserProject payload, {this.inRepoScreen = false})
      : this.owner = payload.owner.name,
        this.avatarUrl = payload.owner.avatarUrl,
        this.name = payload.name,
        this.description = payload.description,
        this.iconData = _getGitlabIcon(payload.visibility),
        this.starCount = payload.starCount,
        this.forkCount = payload.forksCount,
        this.primaryLanguageName = null,
        this.primaryLanguageColor = null,
        this.topics = [];

  RepositoryItem.gitea(GiteaRepository payload, {this.inRepoScreen = false})
      : this.owner = payload.owner.login,
        this.avatarUrl = payload.owner.avatarUrl,
        this.name = payload.name,
        this.description = payload.description,
        this.iconData = Octicons.repo,
        this.starCount = payload.starsCount,
        this.forkCount = payload.forksCount,
        this.primaryLanguageName = null,
        this.primaryLanguageColor = null,
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

    // TODO: text style inRepoScreen
    final widget = Container(
      padding: CommonStyle.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Avatar(url: avatarUrl, size: AvatarSize.small, linkUrl: '/$owner'),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: join(SizedBox(height: 8), <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Text(
                            owner + ' / ',
                            style: TextStyle(
                              fontSize: 17,
                              color: theme.palette.primary,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              name,
                              style: TextStyle(
                                fontSize: 17,
                                color: theme.palette.primary,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(iconData, size: 17, color: theme.palette.tertiaryText),
                  ],
                ),
                if (description != null && description.isNotEmpty)
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: theme.palette.secondaryText,
                      fontSize: 15,
                    ),
                  ),
                if (topics != null && topics.isNotEmpty)
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
                          node.topic.name,
                          style: TextStyle(
                            fontSize: 14,
                            color: theme.palette.primary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                if (!inRepoScreen)
                  DefaultTextStyle(
                    style: TextStyle(color: theme.palette.text, fontSize: 13),
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
                            Expanded(
                              child: Text(
                                primaryLanguageName ?? 'Unknown',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
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
    );
    if (inRepoScreen) {
      // return Material(child: InkWell(child: widget));
      return widget;
    } else {
      return Link(
        url: '/$owner/$name',
        child: widget,
      );
    }
  }
}
