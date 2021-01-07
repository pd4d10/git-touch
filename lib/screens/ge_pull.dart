import 'package:flutter/material.dart';
import 'package:git_touch/models/gitee.dart';
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

class GePullScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String number;
  final bool isPr;

  GePullScreen(this.owner, this.name, this.number, {this.isPr: false});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple3<GiteePull, List<GiteeComment>, List<GiteeFile>>>(
      title: Text("Pull Request: #$number"),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final items = await Future.wait([
          auth.fetchGitee('/repos/$owner/$name/pulls/$number'),
          auth.fetchGitee('/repos/$owner/$name/pulls/$number/comments'),
          auth.fetchGitee('/repos/$owner/$name/pulls/$number/files')
        ]);
        return Tuple3(
            GiteePull.fromJson(items[0]),
            [for (var v in items[1]) GiteeComment.fromJson(v)],
            [for (var v in items[2]) GiteeFile.fromJson(v)]);
      },
      actionBuilder: (data, _) => ActionEntry(
        iconData: Octicons.plus,
        url: '/gitee/$owner/$name/pulls/$number/comment',
      ),
      bodyBuilder: (data, _) {
        final pull = data.item1;
        final comments = data.item2;
        final files = data.item3;
        final theme = context.read<ThemeModel>();
        var additions = 0;
        var deletions = 0;
        for (var file in files) {
          additions += int.parse(file.additions);
          deletions += int.parse(file.deletions);
        }
        return Column(children: <Widget>[
          Container(
              padding: CommonStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Link(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Link(
                              url: '/gitee/$owner/$name',
                              child: Row(
                                children: <Widget>[
                                  Avatar(
                                    url: pull.user.avatarUrl,
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
                              pull.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            StateLabel(
                                pull.state == 'open'
                                    ? StateLabelStatus.pullOpened
                                    : StateLabelStatus.pullClosed,
                                small: true),
                            SizedBox(height: 16),
                            CommonStyle.border,
                            CommonStyle.border,
                            Link(
                              url: '/gitee/$owner/$name/pulls/$number/files',
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '${files.length} files changed',
                                      style: TextStyle(
                                        color: theme.palette.secondaryText,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '+$additions',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          '-$deletions',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: theme.palette.border,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                    // url: '/gitee/$owner/$name/pull/$number/files',
                    url: '/gitee/$owner/$name',
                  ),
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
  }
}
