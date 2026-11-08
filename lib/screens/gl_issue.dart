import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/comment_item.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GlIssueScreen extends StatelessWidget {
  const GlIssueScreen(this.projectId, this.iid, {this.isMr = false});
  final int projectId;
  final int iid;
  final bool isMr;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple3<GitlabTodoTarget, Iterable<GitlabIssueNote>, List?>>(
      title: Text('${AppLocalizations.of(context)!.issue}#$iid'),
      fetch: () async {
        final type = isMr ? 'merge_requests' : 'issues';
        final auth = context.read<AuthModel>();
        final items = await Future.wait([
          auth.fetchGitlab('/projects/$projectId/$type/$iid'),
          auth.fetchGitlab('/projects/$projectId/$type/$iid/notes?sort=asc'),
          auth.fetchGitlab('/projects/$projectId/$type/$iid/award_emoji'),
        ]);
        return Tuple3(
          GitlabTodoTarget.fromJson(items[0]),
          (items[1] as List).map((v) => GitlabIssueNote.fromJson(v)),
          items[2] as List?,
        );
      },
      bodyBuilder: (data, _) {
        final issue = data.item1;
        final notes = data.item2;
        // final emoji = data.item3;

        return Column(
          children: <Widget>[
            Container(
              padding: CommonStyle.padding,
              child: CommentItem(
                avatar: Avatar(
                  url: issue.author!.avatarUrl,
                  linkUrl: '/gitlab/user/${issue.author!.id}',
                ),
                createdAt: issue.createdAt,
                body: issue.description,
                login: issue.author!.username,
                prefix: 'gitlab',
              ),
            ),
            CommonStyle.border,
            Column(
              children: <Widget>[
                for (var note in notes)
                  if (note.system!)
                    Container(
                      padding: CommonStyle.padding,
                      child: Text.rich(
                        TextSpan(children: [
                          WidgetSpan(
                              child: Avatar(url: note.author!.avatarUrl)),
                          TextSpan(text: note.author!.name),
                          TextSpan(text: note.body),
                        ]),
                      ),
                    )
                  else
                    Container(
                      padding: CommonStyle.padding,
                      child: CommentItem(
                        avatar: Avatar(
                          url: note.author!.avatarUrl,
                          linkUrl: '/gitlab/user/${note.author!.id}',
                        ),
                        createdAt: note.createdAt,
                        body: note.body,
                        login: note.author!.username,
                        prefix: 'gitlab',
                      ),
                    )
              ],
            )
          ],
        );
      },
    );
  }
}
