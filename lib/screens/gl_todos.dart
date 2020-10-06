import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

class GlTodosScreen extends StatelessWidget {
  InlineSpan _buildActor(BuildContext context, GitlabTodo p) {
    final theme = Provider.of<ThemeModel>(context);
    return TextSpan(
      text: p.author.name,
      style: TextStyle(color: theme.palette.primary),
    );
  }

  InlineSpan _buildIssue(BuildContext context, GitlabTodo p) {
    final theme = Provider.of<ThemeModel>(context);
    return TextSpan(
      text: '${p.project.pathWithNamespace}!${p.target.iid}',
      style: TextStyle(color: theme.palette.primary),
    );
  }

  Iterable<InlineSpan> _buildItem(BuildContext context, GitlabTodo p) {
    switch (p.actionName) {
      case 'mentioned':
        return [
          _buildActor(context, p),
          TextSpan(text: ' mentioned you on ${p.targetType} '),
          _buildIssue(context, p),
        ];
      case 'build_failed':
        return [
          TextSpan(text: ' the build failed for ${p.targetType} '),
          _buildIssue(context, p),
        ];
      case 'directly_addressed':
        return [
          _buildActor(context, p),
          TextSpan(text: ' directly addressed you ${p.targetType} '),
          _buildIssue(context, p),
        ];
      case 'assigned':
        return [
          _buildActor(context, p),
          TextSpan(text: ' directly addressed you ${p.targetType} '),
          _buildIssue(context, p),
        ];
      default:
        return [
          TextSpan(text: ' action type ${p.actionName} not implemented yet')
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return RefreshStatefulScaffold<Iterable<GitlabTodo>>(
      title: Text('Todos'),
      fetch: () async {
        final vs = await context.read<AuthModel>().fetchGitlab('/todos');
        return (vs as List).map((v) => GitlabTodo.fromJson(v));
      },
      bodyBuilder: (data, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: data.map((item) {
            return Link(
              url:
                  '/projects/${item.target.projectId}/${item.targetType == 'MergeRequest' ? 'merge_requests' : 'issue'}/${item.target.iid}',
              child: Container(
                padding: CommonStyle.padding,
                child: Row(
                  children: <Widget>[
                    GitlabAvatar(
                        url: item.author.avatarUrl, id: item.author.id),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                              color: theme.palette.text, fontSize: 17),
                          children: [
                            ..._buildItem(context, item),
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
