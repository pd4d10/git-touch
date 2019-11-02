import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import 'package:timeago/timeago.dart' as timeago;

class GitlabIssueScreen extends StatelessWidget {
  final int projectId;
  final int issueIid;
  final bool isMr;

  GitlabIssueScreen(this.projectId, this.issueIid, {this.isMr});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: Text('Issue #$issueIid'),
      fetchData: () async {
        final type = isMr ? 'merge_requests' : 'issues';
        final items = await Future.wait([
          Provider.of<AuthModel>(context)
              .fetchGitlab('/projects/$projectId/$type/$issueIid'),
          Provider.of<AuthModel>(context)
              .fetchGitlab('/projects/$projectId/$type/$issueIid/notes'),
          Provider.of<AuthModel>(context)
              .fetchGitlab('/projects/$projectId/$type/$issueIid/award_emoji'),
        ]);
        return items;
      },
      bodyBuilder: (data, _) {
        final issue = data[0];
        final notes = data[1] as List;
        final emoji = data[2];

        return Column(
          children: <Widget>[
            Container(
              padding: CommonStyle.padding,
              child: Column(
                children: <Widget>[
                  Text(issue['title']),
                  Row(
                    children: <Widget>[
                      Avatar.medium(url: issue['author']['avatar_url']),
                      Expanded(
                        child: Text(issue['description']),
                      ),
                    ],
                  ),
                  Text(timeago.format(DateTime.parse(issue['created_at'])))
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
                          Avatar.medium(url: note['author']['avatar_url']),
                          Expanded(
                            child: Column(
                              children: <Widget>[Text(note['author']['name'])],
                            ),
                          )
                        ],
                      ),
                      MarkdownView(note['body']),
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
