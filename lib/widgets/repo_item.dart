import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';
import '../utils/utils.dart';
import '../screens/repo.dart';
import 'link.dart';

class RepoItem extends StatelessWidget {
  final Map<String, dynamic> payload;
  final bool inRepoScreen;

  RepoItem(this.payload, {this.inRepoScreen = false});

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

  @override
  Widget build(BuildContext context) {
    var widget = Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Avatar(url: payload['owner']['avatarUrl'], size: 12),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: join(SizedBox(height: 8), <Widget>[
                Row(
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
                if (!inRepoScreen) _buildStatus(),
              ]),
            ),
          ),
          Icon(_buildIconData(), size: 18, color: PrimerColors.gray600),
        ],
      ),
    );

    if (inRepoScreen) {
      return widget;
    } else {
      // TODO: text style
      return Link(
        screenBuilder: (_) =>
            RepoScreen(payload['owner']['login'], payload['name']),
        child: widget,
      );
    }
  }
}
