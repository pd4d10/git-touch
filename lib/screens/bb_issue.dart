import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/comment_item.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class BbIssueScreen extends StatelessWidget {
  const BbIssueScreen(this.owner, this.name, this.number, {this.isPr = true});
  final String owner;
  final String name;
  final String number;
  final bool isPr;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<BbIssues, Iterable<BbComment>>>(
      title: Text('Issue: #$number'),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final res = await Future.wait([
          auth
              .fetchBbJson('/repositories/$owner/$name/issues/$number')
              .then((value) => BbIssues.fromJson(value)),
          auth
              .fetchBbWithPage(
                  '/repositories/$owner/$name/issues/$number/comments')
              .then(
                  (value) => [for (var v in value.items) BbComment.fromJson(v)])
        ]);
        return Tuple2(res[0] as BbIssues, res[1] as Iterable<BbComment>);
      },
      actionBuilder: (data, _) => ActionEntry(
        iconData: Octicons.plus,
        url: '/bitbucket/$owner/$name/issues/$number/comment',
      ),
      bodyBuilder: (data, _) {
        final issue = data.item1;
        final comments = data.item2;
        return Column(children: <Widget>[
          Container(
              padding: CommonStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LinkWidget(
                    url: '/bitbucket/$owner/$name',
                    child: Row(
                      children: <Widget>[
                        Avatar(
                          url: issue.reporter!.avatarUrl,
                          size: AvatarSize.extraSmall,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$owner / $name',
                          style: TextStyle(
                            fontSize: 17,
                            color: AntTheme.of(context).colorTextSecondary,
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
                    issue.title!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  StateLabel(StateLabelStatus.issueOpened),
                  const SizedBox(height: 16),
                  CommonStyle.border,
                ],
              )),
          Column(children: [
            for (var comment in comments) ...[
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CommentItem(
                      avatar: Avatar(
                        url: comment.user!.avatarUrl,
                        linkUrl: '/bitbucket/${comment.user!.displayName}',
                      ),
                      createdAt: DateTime.parse(comment.createdOn!),
                      body: comment.content!.raw,
                      login: comment.user!.displayName,
                      prefix: 'bitbucket')),
              CommonStyle.border,
              const SizedBox(height: 16),
            ],
          ]),
        ]);
      },
    );
  }
}
