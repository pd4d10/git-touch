import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:primer/primer.dart';
import '../utils/utils.dart';
import 'avatar.dart';
import 'link.dart';
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
  final Function(String emojiKey, bool isRemove) onReaction;

  CommentItem(this.payload, {@required this.onReaction});

  bool _hasReacted(String emojiKey) {
    if (payload[emojiKey] == null) return false;
    return payload[emojiKey]['viewerHasReacted'] as bool;
  }

  Decoration _getDecorationByKey(String emojiKey) {
    return BoxDecoration(
        color:
            _hasReacted(emojiKey) ? PrimerColors.blue000 : Colors.transparent);
  }

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
              .where((entry) => payload[entry.key]['totalCount'] as int != 0)
              .map<Widget>((entry) {
            var emojiKey = entry.key;
            var emoji = entry.value;
            var count = payload[entry.key]['totalCount'] as int;

            return Link(
              onTap: () {
                onReaction(emojiKey, _hasReacted(emojiKey));
              },
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: _getDecorationByKey(emojiKey),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(text: emoji),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: count.toString(),
                        style: TextStyle(color: PrimerColors.blue500),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList()
                ..add(
                  Link(
                    onTap: () async {
                      var result = await showDialogOptions(
                        context,
                        emojiMap.entries.map((entry) {
                          var emojiKey = entry.key;
                          return DialogOption(
                            value: emojiKey,
                            widget: Container(
                              decoration: _getDecorationByKey(emojiKey),
                              child: Text(emojiKey + ' ' + entry.value),
                            ),
                          );
                        }).toList(),
                      );
                      onReaction(result, _hasReacted(result));
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Octicons.smiley,
                        color: PrimerColors.blue500,
                        size: 16,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
