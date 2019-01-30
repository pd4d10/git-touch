import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:git_touch/widgets/widgets.dart';
import 'package:git_touch/utils/utils.dart';

class CommentItem extends StatelessWidget {
  final Map<String, dynamic> item;

  CommentItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Avatar(item['author']['login'], item['author']['avatarUrl']),
        Padding(padding: EdgeInsets.only(left: 10)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UserName(item['author']['login']),
              Text('opened ' + TimeAgo.formatFromString(item['createdAt'])),
            ],
          ),
        ),
      ]),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: MarkdownBody(data: item['body']),
      ),
    ]);
  }
}
