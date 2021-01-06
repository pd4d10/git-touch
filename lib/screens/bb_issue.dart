import 'package:flutter/material.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/comment_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:tuple/tuple.dart';

class BbIssueScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String number;
  final bool isPr;

  BbIssueScreen(this.owner, this.name, this.number, {this.isPr: false});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<BbIssues, List<BbComment>>>(
      title: Text("Issue: #$number"),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final items = await Future.wait([
          auth.fetchBbJson('/repositories/$owner/$name/issues/$number'),
          auth.fetchBbWithPage(
              '/repositories/$owner/$name/issues/$number/comments')
        ]);
        return Tuple2(BbIssues.fromJson(items[0]),
            [for (var v in items[1].data) BbComment.fromJson(v)]);
      },
      actionBuilder: (data, _) => ActionEntry(
        iconData: Octicons.plus,
        url: '/bitbucket/$owner/$name/issues/$number/comment',
      ),
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
                    url: '/bitbucket/$owner/$name',
                    child: Row(
                      children: <Widget>[
                        Avatar(
                          url: issue.reporter.avatarUrl,
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
                  StateLabel(StateLabelStatus.issueOpened),
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
                        linkUrl: '/bitbucket/${comment.user.displayName}',
                      ),
                      createdAt: DateTime.parse(comment.createdOn),
                      body: comment.content.raw,
                      login: comment.user.displayName,
                      prefix: 'bitbucket')),
              CommonStyle.border,
              SizedBox(height: 16),
            ],
          ]),
        ]);
      },
    );
  }
}
