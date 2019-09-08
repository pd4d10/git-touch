import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';
import '../utils/utils.dart';
import '../screens/repo.dart';
import 'link.dart';

class RepoItem extends StatelessWidget {
  final Map<String, dynamic> payload;
  final bool showOwner;
  final bool isLink;

  RepoItem(this.payload, {this.showOwner = true, this.isLink = true});

  IconData _buildIconData() {
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
                Text(
                  (showOwner ? (payload['owner']['login'] + ' / ') : '') +
                      payload['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: PrimerColors.blue500,
                  ),
                ),
                payload['description'] == null ||
                        (payload['description'] as String).isEmpty
                    ? null
                    : Text(
                        payload['description'],
                        style: TextStyle(
                            color: PrimerColors.gray600, fontSize: 14),
                      ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: PrimerColors.gray600,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        child: Row(children: <Widget>[
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: convertColor(
                                  payload['primaryLanguage'] == null
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
                      SizedBox(
                        width: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Octicons.star,
                                size: 14, color: PrimerColors.gray600),
                            Text(
                                payload['stargazers']['totalCount'].toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Octicons.repo_forked,
                                size: 14, color: PrimerColors.gray600),
                            Text(payload['forks']['totalCount'].toString())
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
          Icon(_buildIconData(), size: 18, color: PrimerColors.gray600),
        ],
      ),
    );

    if (isLink) {
      // TODO: text style
      return Link(
        screenBuilder: (_) =>
            RepoScreen(payload['owner']['login'], payload['name']),
        child: widget,
      );
    } else {
      return widget;
    }
  }
}
