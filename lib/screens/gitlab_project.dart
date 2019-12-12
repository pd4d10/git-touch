import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/action_button.dart';

class GitlabProjectScreen extends StatelessWidget {
  final int id;
  final String branch;

  GitlabProjectScreen(this.id, {this.branch});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GitlabProject>(
      title: AppBarTitle('Project'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);
        final json = await auth.fetchGitlab('/projects/$id');
        final project = GitlabProject.fromJson(json);
        if (project.readmeUrl != null) {
          project.readme = await auth.fetchWithGitlabToken(
              project.readmeUrl.replaceFirst(r'/blob/', '/raw/'));
        }
        final l = await auth.fetchGitlab('/projects/$id/languages');
        project.languages = Map<String, double>.from(l);
        return project;
      },
      actionBuilder: (data, setState) {
        if (data == null)
          return ActionButton(title: 'Project Actions', items: []);

        return ActionButton(
          title: 'Project Actions',
          items: [
            ActionItem.share(data.webUrl),
            ActionItem.launch(data.webUrl),
          ],
        );
      },
      bodyBuilder: (data, _) {
        final langWidth = MediaQuery.of(context).size.width -
            CommonStyle.padding.left -
            CommonStyle.padding.right -
            data.languages.length +
            1;

        final theme = Provider.of<ThemeModel>(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepositoryItem.raw(
                data.namespace.name,
                data.avatarUrl,
                data.name,
                data.description,
                Octicons.repo, // TODO:
                data.starCount,
                data.forksCount,
                data.languages.keys.first,
                null,
                [],
                inRepoScreen: true),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  count: data.starCount,
                  text: 'Stars',
                ),
                EntryItem(
                  count: data.forksCount,
                  text: 'Forks', // TODO:
                ),
              ],
            ),
            CommonStyle.verticalGap,
            if (data.languages.isNotEmpty)
              Container(
                color: theme.palette.background,
                padding: CommonStyle.padding.copyWith(top: 8, bottom: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: SizedBox(
                    height: 10,
                    child: Row(
                      children: join(
                        SizedBox(width: 1),
                        data.languages.entries
                            .map((e) => Container(
                                color: convertColor('#ff0'),
                                width: langWidth *
                                    e.value /
                                    data.languages.length))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            TableView(
              hasIcon: true,
              items: [
                TableViewItem(
                  leftIconData: Octicons.code,
                  text: Text('Code'),
                  url: '/tree/$id',
                ),
                if (data.issuesEnabled)
                  TableViewItem(
                    leftIconData: Octicons.issue_opened,
                    text: Text('Issues'),
                    rightWidget:
                        Text(numberFormat.format(data.openIssuesCount)),
                  ),
                if (data.mergeRequestsEnabled)
                  TableViewItem(
                    leftIconData: Octicons.git_pull_request,
                    text: Text('Merge requests'),
                  ),
              ],
            ),
            CommonStyle.verticalGap,
            if (data.readme != null)
              Container(
                padding: CommonStyle.padding,
                color: theme.palette.background,
                child: MarkdownView(data.readme),
              ),
            CommonStyle.verticalGap,
          ],
        );
      },
    );
  }
}
