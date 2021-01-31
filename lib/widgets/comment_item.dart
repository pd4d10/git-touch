import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/graphql/github.data.gql.dart';
import 'package:git_touch/graphql/schema.schema.gql.dart';
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

class EmojiPayload {
  GReactionContent key;
  String text;
  int count;
  bool reacted;
  EmojiPayload({
    @required this.key,
    @required this.text,
    @required this.count,
    @required this.reacted,
  });
}

typedef EmojiUpdateCallaback = void Function(GReactionContent data);

class GhEmojiAction extends StatefulWidget {
  final String id;
  final Iterable<EmojiPayload> items;
  final EmojiUpdateCallaback onReaction;

  GhEmojiAction(this.id, GReactableParts r, this.onReaction)
      : items = [
          EmojiPayload(
            key: GReactionContent.THUMBS_UP,
            text: '👍',
            count: r.THUMBS_UP.totalCount,
            reacted: r.THUMBS_UP.viewerHasReacted,
          ),
          EmojiPayload(
            key: GReactionContent.THUMBS_DOWN,
            text: '👎',
            count: r.THUMBS_DOWN.totalCount,
            reacted: r.THUMBS_DOWN.viewerHasReacted,
          ),
          EmojiPayload(
            key: GReactionContent.LAUGH,
            text: '😄',
            count: r.LAUGH.totalCount,
            reacted: r.LAUGH.viewerHasReacted,
          ),
          EmojiPayload(
            key: GReactionContent.HOORAY,
            text: '🎉',
            count: r.HOORAY.totalCount,
            reacted: r.HOORAY.viewerHasReacted,
          ),
          EmojiPayload(
            key: GReactionContent.CONFUSED,
            text: '😕',
            count: r.CONFUSED.totalCount,
            reacted: r.CONFUSED.viewerHasReacted,
          ),
          EmojiPayload(
            key: GReactionContent.HEART,
            text: '❤️',
            count: r.HEART.totalCount,
            reacted: r.HEART.viewerHasReacted,
          ),
          EmojiPayload(
            key: GReactionContent.ROCKET,
            text: '🚀',
            count: r.ROCKET.totalCount,
            reacted: r.ROCKET.viewerHasReacted,
          ),
          EmojiPayload(
            key: GReactionContent.EYES,
            text: '👀',
            count: r.EYES.totalCount,
            reacted: r.EYES.viewerHasReacted,
          ),
        ];
  @override
  _GhEmojiActionState createState() => _GhEmojiActionState();
}

class _GhEmojiActionState extends State<GhEmojiAction> {
  _onReaction(EmojiPayload item) async {
    final op = item.reacted ? 'remove' : 'add';

    await context.read<AuthModel>().query('''
mutation {
  ${op}Reaction(input: {subjectId: "${widget.id}", content: ${item.key.name}}) {
    clientMutationId
  }
}
    ''');
    setState(() {
      item.reacted = !item.reacted;
      if (item.reacted) {
        item.count++;
      } else {
        item.count--;
      }
    });
    // TODO: should set state from parent widgets
    // widget.onReaction(item.key);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final item in widget.items)
          if (item.count > 0)
            Link(
              onTap: () {
                _onReaction(item);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: item.reacted
                      ? (theme.brightness == Brightness.dark
                          ? PrimerColors.blue900
                          : PrimerColors.blue000)
                      : Colors.transparent,
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Text(item.text, style: TextStyle(fontSize: 18)),
                    SizedBox(width: 4),
                    Text(numberFormat.format(item.count),
                        style: TextStyle(
                            color: theme.palette.primary, fontSize: 14))
                  ],
                ),
              ),
            ),
        Link(
          onTap: () async {
            await theme.showActions(context, [
              for (final item in widget.items)
                ActionItem(
                  text: item.text,
                  onTap: (_) {
                    _onReaction(item);
                  },
                )
            ]);
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

  // p.author could be null (deleted user)
  CommentItem.gql(
      GCommentParts p, GReactableParts r, EmojiUpdateCallaback onReaction)
      : avatar = Avatar(
          url: p.author?.avatarUrl ??
              'https://avatars.githubusercontent.com/u/10137?s=460&u=b1951d34a583cf12ec0d3b0781ba19be97726318&v=4',
          linkUrl: '/github/' + (p.author?.login ?? 'ghost'),
        ),
        login = p.author?.login ?? 'ghost',
        createdAt = p.createdAt,
        body = p.body,
        widgets = [GhEmojiAction(p.id, r, onReaction)],
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
