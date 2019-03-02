import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import '../screens/repo.dart';
import 'link.dart';

class RepoItem extends StatelessWidget {
  final Map<String, dynamic> payload;

  RepoItem(this.payload);

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
    return Link(
      screenBuilder: (_) =>
          RepoScreen(payload['owner']['login'], payload['name']),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    payload['owner']['login'] + '/' + payload['name'],
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Padding(padding: EdgeInsets.only(top: 6)),
                  Text(payload['description'] ?? 'No description provided yet'),
                  Padding(padding: EdgeInsets.only(top: 6)),
                  DefaultTextStyle(
                    style: TextStyle(color: Colors.black54, fontSize: 13),
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
      ),
    );
  }
}
