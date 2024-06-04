import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/comment_item.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GePullScreen extends StatelessWidget {
  const GePullScreen(this.owner, this.name, this.number, {this.isPr = true});
  final String owner;
  final String name;
  final String number;
  final bool isPr;

  List<ActionItem> _buildCommentActionItem(
      BuildContext context, GiteeComment comment) {
    final auth = context.read<AuthModel>();
    return [
      ActionItem(
        text: 'Edit',
        onTap: (_) {
          final uri = Uri(
            path: '/gitee/$owner/$name/pulls/$number/comment',
            queryParameters: {
              'body': comment.body,
              'id': comment.id.toString(),
            },
          ).toString();
          context.pushUrl(uri);
        },
      ),
      ActionItem(
        text: 'Delete',
        onTap: (_) async {
          await auth.fetchGitee(
              '/repos/$owner/$name/pulls/comments/${comment.id}',
              requestType: 'DELETE');
          await context.pushUrl('/gitee/$owner/$name/pulls/$number',
              replace: true);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple4<GiteePull, List<GiteeComment>, List<GiteePullFile>,
            List<GiteeCommit>>>(
      title: Text('Pull Request: #$number'),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final items = await Future.wait([
          auth.fetchGitee('/repos/$owner/$name/pulls/$number'),
          auth.fetchGitee('/repos/$owner/$name/pulls/$number/comments'),
          auth.fetchGitee('/repos/$owner/$name/pulls/$number/files'),
          auth.fetchGitee('/repos/$owner/$name/pulls/$number/commits'),
        ]);
        return Tuple4(
            GiteePull.fromJson(items[0]),
            [for (var v in items[1]) GiteeComment.fromJson(v)],
            [for (var v in items[2]) GiteePullFile.fromJson(v)],
            [for (var v in items[3]) GiteeCommit.fromJson(v)]);
      },
      actionBuilder: (data, _) => ActionEntry(
        iconData: Octicons.plus,
        url: '/gitee/$owner/$name/pulls/$number/comment',
      ),
      bodyBuilder: (data, _) {
        final pull = data.item1;
        final comments = data.item2;
        final files = data.item3;
        final commits = data.item4;
        var additions = 0;
        var deletions = 0;
        for (final file in files) {
          additions += int.parse(file.additions!);
          deletions += int.parse(file.deletions!);
        }
        return Column(
          children: <Widget>[
            Container(
                padding: CommonStyle.padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LinkWidget(
                      url: '/gitee/$owner/$name',
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LinkWidget(
                              url: '/gitee/$owner/$name',
                              child: Row(
                                children: <Widget>[
                                  Avatar(
                                    url: pull.user!.avatarUrl,
                                    size: AvatarSize.extraSmall,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$owner / $name',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: AntTheme.of(context)
                                          .colorTextSecondary,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '#$number',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: AntTheme.of(context).colorWeak,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              pull.title!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            StateLabel(
                                pull.state == 'open'
                                    ? StateLabelStatus.pullOpened
                                    : StateLabelStatus.pullClosed,
                                small: true),
                            const SizedBox(height: 16),
                            CommonStyle.border,
                            CommonStyle.border,
                            LinkWidget(
                              url: '/gitee/$owner/$name/pulls/$number/files',
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '${files.length} files changed',
                                      style: TextStyle(
                                        color: AntTheme.of(context)
                                            .colorTextSecondary,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '+$additions',
                                          style: TextStyle(
                                            color: AntTheme.of(context)
                                                .colorSuccess,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          '-$deletions',
                                          style: TextStyle(
                                            color: AntTheme.of(context)
                                                .colorDanger,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Ionicons.chevron_forward,
                                          color:
                                              AntTheme.of(context).colorBorder,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            CommonStyle.border,
                            Column(
                              // title: Text(
                              //   'Commits',
                              //   style: TextStyle(
                              //     color: AntTheme.of(context).colorPrimary,
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),
                              children: [
                                for (var commit in commits) ...[
                                  LinkWidget(
                                    url:
                                        '/gitee/$owner/$name/commits/${commit.sha}',
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            commit.sha!.substring(0, 7),
                                            style: TextStyle(
                                              color: AntTheme.of(context)
                                                  .colorPrimary,
                                              fontSize: 17,
                                              fontFamily: CommonStyle.monospace,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    CommonStyle.border,
                  ],
                )),
            Column(
              children: [
                for (var comment in comments) ...[
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CommentItem(
                        avatar: Avatar(
                          url: comment.user!.avatarUrl,
                          linkUrl: '/gitee/${comment.user!.login}',
                        ),
                        createdAt: DateTime.parse(comment.createdAt!),
                        body: comment.body,
                        login: comment.user!.login,
                        prefix: 'gitee',
                        commentActionItemList:
                            _buildCommentActionItem(context, comment),
                      )),
                  CommonStyle.border,
                  const SizedBox(height: 16),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
