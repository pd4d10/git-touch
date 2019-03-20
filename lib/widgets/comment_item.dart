import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../utils/utils.dart';
import 'avatar.dart';
import 'user_name.dart';

final emojiMap = {
  'THUMBS_UP': '👍',
  'THUMBS_DOWN': '👎',
  'LAUGH': '😄',
  'HOORAY': '🎉',
  'CONFUSED': '😕',
  'HEART': '❤️',
  'ROCKET': '🚀',
  'EYES': '👀'
};

class CommentItem extends StatelessWidget {
  final Map<String, dynamic> payload;

  CommentItem(this.payload);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(children: <Widget>[
          Avatar(
            url: payload['author']['avatarUrl'],
            size: 16,
            login: payload['author']['login'],
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
          padding: const EdgeInsets.only(top: 12),
          child: MarkdownBody(
            data: payload['body'],
            // styleSheet: MarkdownStyleSheet(code: TextStyle(fontSize: 14)),
          ),
        ),
        Wrap(
          children: emojiMap.entries
              .where((entry) => payload[entry.key]['totalCount'] != 0)
              .map((entry) {
            var emoji = entry.value;
            int count = payload[entry.key]['totalCount'];

            return Container(
              padding: EdgeInsets.all(6),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16),
                  children: [
                    TextSpan(text: emoji),
                    TextSpan(text: ' '),
                    TextSpan(
                      text: count.toString(),
                      style: TextStyle(color: Palette.link),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
