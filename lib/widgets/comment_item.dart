import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/action_button.dart';
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
  get payload => widget.payload;

  onReaction(String emojiKey) async {
    if (emojiKey == null) return;

    final isRemove = _hasReacted(emojiKey);
    var id = payload['id'] as String;
    var operation = isRemove ? 'remove' : 'add';

    try {
      await context.read<AuthModel>().query('''
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
    } catch (e) {
      context.read<ThemeModel>().showWarning(context, e);
    }
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
              onReaction(emojiKey);
            },
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _hasReacted(emojiKey)
                    ? (theme.brightness == Brightness.dark
                        ? PrimerColors.blue900
                        : PrimerColors.blue000)
                    : Colors.transparent,
              ),
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
            await theme.showActions(
              context,
              emojiMap.entries.map((entry) {
                final emojiKey = entry.key;
                return ActionItem(
                  text: emojiKey + ' ' + entry.value,
                  onTap: (_) {
                    onReaction(emojiKey);
                  },
                );
              }).toList(),
            );
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
  final String prefix;
  final List<Widget> widgets;
  final List<ActionItem> commentActionItemList;

  CommentItem.gh(Map<String, dynamic> payload)
      : avatar = Avatar(
          url: payload['author']['avatarUrl'], // TODO: deleted user
          linkUrl: '/github/' + payload['author']['login'],
        ),
        login = payload['author']['login'],
        createdAt = DateTime.parse(payload['createdAt']),
        body = payload['body'],
        widgets = [GhEmojiAction(payload)],
        prefix = 'github',
        commentActionItemList = []; // TODO

  CommentItem({
    @required this.avatar,
    @required this.login,
    @required this.createdAt,
    @required this.body,
    @required this.prefix,
    this.widgets,
    this.commentActionItemList,
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
                UserName(login, prefix),
                SizedBox(height: 2),
                Text(
                  timeago.format(createdAt),
                  style: TextStyle(
                      color: theme.palette.tertiaryText, fontSize: 13),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: ActionButton(
                iconData: Octicons.kebab_horizontal,
                title: 'Comment Actions',
                items: [
                  if (commentActionItemList != null) ...commentActionItemList
                ],
              )),
        ]),
        SizedBox(height: 12),
        MarkdownFlutterView(body, padding: EdgeInsets.zero), // TODO: link
        SizedBox(height: 12),
        if (widgets != null) ...widgets
      ],
    );
  }
}
