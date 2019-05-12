import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  (showOwner ? (payload['owner']['login'] + '/') : '') +
                      payload['name'],
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                SizedBox(height: 6),
                Text(payload['description'] ?? 'No description provided yet'),
                SizedBox(height: 6),
                DefaultTextStyle(
                  style: TextStyle(color: Color(0xff586069), fontSize: 12),
                  child: Row(
                    children: <Widget>[
                      Icon(Octicons.star, size: 14, color: Colors.black54),
                      Text(payload['stargazers']['totalCount'].toString()),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Icon(Octicons.repo_forked,
                          size: 14, color: Colors.black54),
                      Text(payload['forks']['totalCount'].toString()),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      payload['primaryLanguage'] == null
                          ? Container()
                          : Row(children: <Widget>[
                              Container(
                                width: 10,
                                height: 10,
                                decoration: new BoxDecoration(
                                  color: convertColor(
                                      payload['primaryLanguage']['color']),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 4)),
                              Text(payload['primaryLanguage']['name']),
                            ]),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 4)),
          Icon(_buildIconData(), size: 20, color: Colors.black54),
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
