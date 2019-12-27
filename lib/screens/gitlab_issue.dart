import 'package:flutter/material.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:tuple/tuple.dart';

final gitlabIssueRouter = RouterScreen(
    '/projects/:id/issues/:iid',
    (context, params) => GitlabIssueScreen(
        int.parse(['id'].first), int.parse(params['iid'].first)));

class GitlabIssueScreen extends StatelessWidget {
  final int projectId;
  final int iid;
  final bool isMr;

  GitlabIssueScreen(this.projectId, this.iid, {this.isMr});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple3<GitlabIssue, Iterable<GitlabIssueNote>, List>>(
      title: Text('Issue #$iid'),
      fetchData: () async {
        final type = isMr ? 'merge_requests' : 'issues';
        final items = await Future.wait([
          Provider.of<AuthModel>(context)
              .fetchGitlab('/projects/$projectId/$type/$iid'),
          Provider.of<AuthModel>(context)
              .fetchGitlab('/projects/$projectId/$type/$iid/notes'),
          Provider.of<AuthModel>(context)
              .fetchGitlab('/projects/$projectId/$type/$iid/award_emoji'),
        ]);
        return Tuple3(
          GitlabIssue.fromJson(items[0]),
          (items[1] as List).map((v) => GitlabIssueNote.fromJson(v)),
          items[2] as List,
        );
      },
      bodyBuilder: (data, _) {
        final issue = data.item1;
        final notes = data.item2;
        final emoji = data.item3;

        return Column(
          children: <Widget>[
            Container(
              padding: CommonStyle.padding,
              child: Column(
                children: <Widget>[
                  Text(issue.title),
                  Row(
                    children: <Widget>[
                      Avatar(
                        url: issue.author.avatarUrl,
                        linkUrl: '/user/${issue.author}',
                      ),
                      Expanded(
                        child: Text(issue.description),
                      ),
                    ],
                  ),
                  Text(timeago.format(DateTime.parse(issue.createdAt)))
                ],
              ),
            ),
            CommonStyle.border,
            Column(
              children: notes.map((note) {
                return Container(
                  padding: CommonStyle.padding,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Avatar(url: note.author.avatarUrl),
                          Expanded(
                            child: Column(
                              children: <Widget>[Text(note.author.name)],
                            ),
                          )
                        ],
                      ),
                      MarkdownView(note.body),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        );
      },
    );
  }
}
