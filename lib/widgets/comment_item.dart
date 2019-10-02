import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
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
          Avatar.medium(
            url: payload['author']['avatarUrl'],
            login: payload['author']['login'],
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UserName(payload['author']['login']),
                SizedBox(height: 2),
                Text(
                  timeago.format(DateTime.parse(payload['createdAt'])),
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
        ]),
        SizedBox(height: 12),
        MarkdownView(payload['body'] as String),
        SizedBox(height: 12),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ...emojiMap.entries
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
                  padding: EdgeInsets.all(4),
                  decoration: _getDecorationByKey(emojiKey),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(emoji, style: TextStyle(fontSize: 18)),
                      SizedBox(width: 4),
                      Text(numberFormat.format(count),
                          style: TextStyle(
                              color: PrimerColors.blue500, fontSize: 14))
                    ],
                  ),
                ),
              );
            }),
            Link(
              onTap: () async {
                var result =
                    await Provider.of<ThemeModel>(context).showDialogOptions(
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
                        }).toList());
                onReaction(result, _hasReacted(result));
              },
              child: Container(
                padding: EdgeInsets.all(4),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Text('+', style: TextStyle(color: PrimerColors.blue500)),
                    Icon(Octicons.smiley,
                        color: PrimerColors.blue500, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
