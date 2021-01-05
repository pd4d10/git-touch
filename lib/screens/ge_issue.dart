import 'package:flutter/material.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/comment_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:tuple/tuple.dart';
import 'package:git_touch/widgets/action_button.dart';

class GeIssueScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String number;
  final bool isPr;

  GeIssueScreen(this.owner, this.name, this.number, {this.isPr: false});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GiteeIssue, List<GiteeComment>>>(
      title: Text("Issue: #$number"),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final items = await Future.wait([
          auth.fetchGitee('/repos/$owner/$name/issues/$number'),
          auth.fetchGitee('/repos/$owner/$name/issues/$number/comments')
        ]);
        return Tuple2(GiteeIssue.fromJson(items[0]),
            [for (var v in items[1]) GiteeComment.fromJson(v)]);
      },
      actionBuilder: (data, _) {
        return ActionButton(
          title: 'Actions',
          items: [
            ...ActionItem.getUrlActions(
                'https://gitee.com/$owner/$name/issues/$number'),
          ],
        );
      },
      bodyBuilder: (data, _) {
        final issue = data.item1;
        final comments = data.item2;
        final theme = context.read<ThemeModel>();
        return Column(children: <Widget>[
          Container(
              padding: CommonStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Link(
                    url: '/gitee/$owner/$name',
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
                        linkUrl: '/gitee/${comment.user.login}',
                      ),
                      createdAt: DateTime.parse(comment.createdAt),
                      body: comment.body,
                      login: comment.user.login,
                      prefix: 'gitee')),
              CommonStyle.border,
              SizedBox(height: 16),
            ],
          ]),
        ]);
      },
    );
    // return Container(child: Text("Hello"));
  }
}
