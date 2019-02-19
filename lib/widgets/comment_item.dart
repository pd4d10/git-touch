import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../utils/utils.dart';
import 'avatar.dart';
import 'user_name.dart';

class CommentItem extends StatelessWidget {
  final Map<String, dynamic> payload;

  CommentItem(this.payload);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Avatar(
          login: payload['author']['login'],
          url: payload['author']['avatarUrl'],
          size: 16,
        ),
        Padding(padding: EdgeInsets.only(left: 6)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UserName(payload['author']['login']),
              Padding(padding: EdgeInsets.only(bottom: 2)),
              Text(
                TimeAgo.formatFromString(payload['createdAt']),
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
        ),
      ]),
      Padding(
        padding: const EdgeInsets.only(left: 36, top: 8),
        child: MarkdownBody(
          data: payload['body'],
          // styleSheet: MarkdownStyleSheet(code: TextStyle(fontSize: 14)),
        ),
      ),
    ]);
  }
}
