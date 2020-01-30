import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
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

class GhEmojiAction extends StatefulWidget {
  final Map<String, dynamic> payload;
  GhEmojiAction(this.payload);
  @override
  _GhEmojiActionState createState() => _GhEmojiActionState();
}

class _GhEmojiActionState extends State<GhEmojiAction> {
  Decoration _getDecorationByKey(String emojiKey) {
    return BoxDecoration(
      color: _hasReacted(emojiKey) ? PrimerColors.blue000 : Colors.transparent,
    );
  }

  get payload => widget.payload;

  onReaction(String emojiKey, bool isRemove) async {
    if (emojiKey == null) return;

    var id = payload['id'] as String;
    var operation = isRemove ? 'remove' : 'add';
    await Provider.of<AuthModel>(context).query('''
mutation {
  ${operation}Reaction(input: {subjectId: "$id", content: $emojiKey}) {
    clientMutationId
  }
}
    ''');
    setState(() {
      payload[emojiKey]['totalCount'] += isRemove ? -1 : 1;
      payload[emojiKey]['viewerHasReacted'] = !isRemove;
    });
  }

  bool _hasReacted(String emojiKey) {
    if (payload[emojiKey] == null) return false;
    return payload[emojiKey]['viewerHasReacted'] as bool;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Wrap(
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
                      style:
                          TextStyle(color: theme.palette.primary, fontSize: 14))
                ],
              ),
            ),
          );
        }),
        Link(
          onTap: () async {
            final result = await theme.showDialogOptions(
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
            padding: EdgeInsets.all(4),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Text('+', style: TextStyle(color: theme.palette.primary)),
                Icon(Octicons.smiley, color: theme.palette.primary, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CommentItem extends StatelessWidget {
  final Avatar avatar;
  final String login;
  final DateTime createdAt;
  final String body;
  final List<Widget> widgets;

  CommentItem.gh(Map<String, dynamic> payload)
      : avatar = Avatar(
          url: payload['author']['avatarUrl'], // TODO: deleted user
          linkUrl: '/' + payload['author']['login'],
        ),
        login = payload['author']['login'],
        createdAt = DateTime.parse(payload['createdAt']),
        body = payload['body'],
        widgets = [GhEmojiAction(payload)];

  CommentItem({
    @required this.avatar,
    @required this.login,
    @required this.createdAt,
    @required this.body,
    this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(children: <Widget>[
          avatar,
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UserName(login),
                SizedBox(height: 2),
                Text(
                  timeago.format(createdAt),
                  style: TextStyle(
                      color: theme.palette.tertiaryText, fontSize: 13),
                ),
              ],
            ),
          ),
        ]),
        SizedBox(height: 12),
        MarkdownView(body), // TODO: link
        SizedBox(height: 12),
        if (widgets != null)
          ...widgets
      ],
    );
  }
}
