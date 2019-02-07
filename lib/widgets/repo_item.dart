import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import '../screens/repo.dart';
import 'link.dart';

class RepoItem extends StatelessWidget {
  final Map<String, dynamic> item;

  RepoItem(this.item);

  IconData _buildIconData() {
    if (item['isPrivate']) {
      return Octicons.lock;
    }
    if (item['isFork']) {
      return Octicons.repo_forked;
    }
    return Octicons.repo;
  }

  @override
  Widget build(BuildContext context) {
    return Link(
      screenBuilder: (_) => RepoScreen(item['owner']['login'], item['name']),
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
                    item['name'],
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Padding(padding: EdgeInsets.only(top: 6)),
                  Text(item['description']),
                  Padding(padding: EdgeInsets.only(top: 6)),
                  DefaultTextStyle(
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                    child: Row(
                      children: <Widget>[
                        Icon(Octicons.star, size: 14, color: Colors.black54),
                        Text(item['stargazers']['totalCount'].toString()),
                        Padding(padding: EdgeInsets.only(left: 16)),
                        Icon(Octicons.repo_forked,
                            size: 14, color: Colors.black54),
                        Text(item['forks']['totalCount'].toString()),
                        Padding(padding: EdgeInsets.only(left: 16)),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: new BoxDecoration(
                            color:
                                convertColor(item['primaryLanguage']['color']),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 4)),
                        Text(item['primaryLanguage']['name']),
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
