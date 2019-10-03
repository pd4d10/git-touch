import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/screens/organization.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';
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
  final Map<String, dynamic> payload;
  final bool inRepoScreen;

  RepositoryItem(this.payload, {this.inRepoScreen = false});

  IconData _buildIconData() {
    if (payload['isPrivate']) {
      return Octicons.lock;
    }
    if (payload['isFork']) {
      return Octicons.repo_forked;
    }
    return Octicons.repo;
  }

  Widget _buildStatus() {
    return DefaultTextStyle(
      style: TextStyle(
        color: PrimerColors.gray800,
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
                  color: convertColor(payload['primaryLanguage'] == null
                      ? null
                      : payload['primaryLanguage']['color']),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 4),
              Text(payload['primaryLanguage'] == null
                  ? 'Unknown'
                  : payload['primaryLanguage']['name']),
            ]),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Octicons.star, size: 14, color: PrimerColors.gray600),
                Text(numberFormat.format(payload['stargazers']['totalCount'])),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Octicons.repo_forked,
                    size: 14, color: PrimerColors.gray600),
                Text(numberFormat.format(payload['forks']['totalCount'])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopics() {
    // TODO: link
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: (payload['repositoryTopics']['nodes'] as List).map((node) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: PrimerColors.blue000,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Text(
            node['topic']['name'],
            style: TextStyle(
              fontSize: 12,
              color: PrimerColors.blue500,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: text style
    return Link(
      screenBuilder: inRepoScreen
          ? null
          : (_) => RepositoryScreen(payload['owner']['login'], payload['name']),
      child: Container(
        padding: CommonStyle.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Link(
              child: Avatar.small(url: payload['owner']['avatarUrl']),
              screenBuilder: (_) =>
                  payload['owner']['__typename'] == 'Organization'
                      ? OrganizationScreen(payload['owner']['login'])
                      : UserScreen(payload['owner']['login']),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: join(SizedBox(height: 8), <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        payload['owner']['login'] + ' / ',
                        style: TextStyle(
                          fontSize: inRepoScreen ? 18 : 16,
                          color: PrimerColors.blue500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        payload['name'],
                        style: TextStyle(
                          fontSize: inRepoScreen ? 18 : 16,
                          color: PrimerColors.blue500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(_buildIconData(),
                          size: 18, color: PrimerColors.gray600),
                    ],
                  ),
                  if (payload['description'] != null &&
                      (payload['description'] as String).isNotEmpty)
                    Text(
                      payload['description'],
                      style: TextStyle(
                          color: PrimerColors.gray700,
                          fontSize: inRepoScreen ? 15 : 14),
                    ),
                  if (inRepoScreen) _buildTopics() else _buildStatus(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
