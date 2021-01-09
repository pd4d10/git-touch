import 'package:flutter/material.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/comment_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:tuple/tuple.dart';

class GtIssueScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String number;
  final bool isPr;

  GtIssueScreen(this.owner, this.name, this.number, {this.isPr: false});

  List<ActionItem> _buildCommentActionItem(
      BuildContext context, GiteaComment comment) {
    final auth = context.read<AuthModel>();
    final theme = context.read<ThemeModel>();
    return [
      ActionItem(
          iconData: Octicons.pencil,
          text: 'Edit',
          onTap: (_) {
            final uri = Uri(
              path: '/gitea/$owner/$name/issues/$number/comment',
              queryParameters: {
                'body': comment.body,
                'id': comment.id.toString(),
              },
            ).toString();
            theme.push(context, uri);
          }),
      ActionItem(
        iconData: Octicons.trashcan,
        text: 'Delete',
        onTap: (_) async {
          await auth.fetchGitea(
              '/repos/$owner/$name/issues/comments/${comment.id}',
              requestType: 'DELETE');
          await theme.push(context, '/gitea/$owner/$name/issues/$number',
              replace: true);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GiteaIssue, List<GiteaComment>>>(
      title: Text("Issue: #$number"),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final items = await Future.wait([
          auth.fetchGitea('/repos/$owner/$name/issues/$number'),
          auth.fetchGitea('/repos/$owner/$name/issues/$number/comments')
        ]);
        return Tuple2(GiteaIssue.fromJson(items[0]),
            [for (var v in items[1]) GiteaComment.fromJson(v)]);
      },
      actionBuilder: (data, _) => ActionEntry(
        iconData: Octicons.plus,
        url: '/gitea/$owner/$name/issues/$number/comment',
      ),
      bodyBuilder: (data, _) {
        final issue = data.item1;
        final comments = data.item2;
        final theme = context.read<ThemeModel>();
        final auth = context.read<AuthModel>();
        return Column(children: <Widget>[
          Container(
              padding: CommonStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Link(
                    url: '/gitea/$owner/$name',
                    child: Row(
                      children: <Widget>[
                        Avatar(
                          url: issue.user.avatarUrl,
                          size: AvatarSize.extraSmall,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '$owner / $name',
                          style: TextStyle(
                            fontSize: 17,
                            color: theme.palette.secondaryText,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '#$number',
                          style: TextStyle(
                            fontSize: 17,
                            color: theme.palette.tertiaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    issue.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  StateLabel(
                      issue.state == 'open'
                          ? StateLabelStatus.issueOpened
                          : StateLabelStatus.issueClosed,
                      small: true),
                  SizedBox(height: 16),
                  CommonStyle.border,
                ],
              )),
          Column(children: [
            for (var comment in comments) ...[
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CommentItem(
                    avatar: Avatar(
                      url: comment.user.avatarUrl,
                      linkUrl: '/gitea/${comment.user.login}',
                    ),
                    createdAt: comment.createdAt,
                    body: comment.body,
                    login: comment.user.login,
                    prefix: 'gitea',
                    commentActionItemList:
                        _buildCommentActionItem(context, comment),
                  )),
              CommonStyle.border,
              SizedBox(height: 16),
            ],
          ]),
        ]);
      },
    );
  }
}
