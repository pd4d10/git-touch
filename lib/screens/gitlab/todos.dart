import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/screens/gitlab/issue.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';

class GitlabTodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: Text('Todos'),
      fetchData: () {
        return Provider.of<AuthModel>(context).fetchGitlab('/todos');
      },
      bodyBuilder: (data, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: (data as List).map((item) {
            return Link(
              screenBuilder: (_) => GitlabIssueScreen(
                  item['target']['project_id'], item['target']['iid'],
                  isMr: item['target_type'] == 'MergeRequest'),
              child: Container(
                padding: CommonStyle.padding,
                child: Row(
                  children: <Widget>[
                    Avatar.medium(
                      url: item['author']['avatar_url'],
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: item['author']['name'],
                              style: TextStyle(
                                color: PrimerColors.blue500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' ' +
                                  item['action_name'] +
                                  ' you ' +
                                  item['target_type'] +
                                  ' ' +
                                  item['project']['path_with_namespace'] +
                                  ' ' +
                                  item['target']['iid'].toString(),
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
