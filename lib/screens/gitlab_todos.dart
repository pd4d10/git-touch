import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/screens/gitlab_issue.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

class GitlabTodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return RefreshStatefulScaffold<Iterable<GitlabTodo>>(
      title: Text('Todos'),
      fetchData: () async {
        final vs = await Provider.of<AuthModel>(context).fetchGitlab('/todos');
        return (vs as List).map((v) => GitlabTodo.fromJson(v));
      },
      bodyBuilder: (data, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: data.map((item) {
            return Link(
              screenBuilder: (_) => GitlabIssueScreen(
                  item.target.projectId, item.target.iid,
                  isMr: item.targetType == 'MergeRequest'),
              child: Container(
                padding: CommonStyle.padding,
                child: Row(
                  children: <Widget>[
                    Avatar.medium(url: item.author.avatarUrl),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: item.author.name,
                              style: TextStyle(
                                color: theme.palette.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' ' +
                                  item.actionName +
                                  ' you ' +
                                  item.targetType +
                                  ' ' +
                                  item.project.pathWithNamespace +
                                  ' ' +
                                  item.target.iid.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
