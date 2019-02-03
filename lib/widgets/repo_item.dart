import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../screens/repo.dart';
import 'link.dart';

class RepoItem extends StatelessWidget {
  final Map<String, dynamic> item;

  RepoItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Link(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(item['name'], style: TextStyle(fontWeight: FontWeight.w600)),
            Padding(padding: EdgeInsets.only(top: 4)),
            Text(item['description']),
            Padding(padding: EdgeInsets.only(top: 4)),
            DefaultTextStyle(
              style: TextStyle(color: Colors.black54),
              child: Row(
                children: <Widget>[
                  Icon(Octicons.star, size: 16, color: Colors.black54),
                  Text(item['stargazers']['totalCount'].toString()),
                  Padding(padding: EdgeInsets.only(left: 8)),
                  Icon(Octicons.repo_forked, size: 16, color: Colors.black54),
                  Text(item['forks']['totalCount'].toString()),
                  Padding(padding: EdgeInsets.only(left: 8)),
                  Text(item['primaryLanguage']['name'])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
