import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:tuple/tuple.dart';

final gitlabProjectRouter = RouterScreen('/gitlab/projects/:id',
    (context, params) => GitlabProjectScreen(int.parse(params['id'].first)));

class GitlabProjectScreen extends StatelessWidget {
  final int id;

  GitlabProjectScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple5<GitlabProject, Map<String, double>, List<GitlabProjectBadge>,
            int, String>>(
      title: AppBarTitle('Project'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);
        final res = await Future.wait([
          auth.fetchGitlab('/projects/$id?statistics=1'),
          auth.fetchGitlab('/projects/$id/languages'),
          auth.fetchGitlab('/projects/$id/badges'),
          auth.fetchGitlabWithPage('/projects/$id/members?per_page=1')
        ]);
        final p = GitlabProject.fromJson(res[0]);
        String readme;
        if (p.readmeUrl != null) {
          readme = await auth.fetchWithGitlabToken(
              p.readmeUrl.replaceFirst(r'/blob/', '/raw/'));
        }
        return Tuple5(
          p,
          Map<String, double>.from(res[1]),
          (res[2] as List).map((v) => GitlabProjectBadge.fromJson(v)).toList(),
          (res[3] as DataWithPage).total,
          readme,
        );
      },
      actionBuilder: (t, setState) {
        return ActionButton(
          title: 'Project Actions',
          items: [
            ...ActionItem.getUrlActions(t.item1.webUrl),
          ],
        );
      },
      bodyBuilder: (t, _) {
        // final langWidth = MediaQuery.of(context).size.width -
        //     CommonStyle.padding.left -
        //     CommonStyle.padding.right -
        //     data.languages.length +
        //     1;
        final p = t.item1;
        final langs = t.item2;
        final badges = t.item3;
        final theme = Provider.of<ThemeModel>(context);
        // final auth = Provider.of<AuthModel>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.avatarUrl,
              avatarLink: p.namespace.kind == 'group'
                  ? '/gitlab/group/${p.namespace.id}'
                  : '/gitlab/user/${p.namespace.id}',
              owner: p.namespace.name,
              name: p.name,
              description: p.description,
              trailings: <Widget>[
                if (badges.isNotEmpty)
                  Wrap(spacing: 4, runSpacing: 4, children: [
                    for (var label in badges)
                      SvgPicture.network(label.renderedImageUrl, height: 20),
                  ])
              ],
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  count: t.item4,
                  text: 'Members',
                ),
                EntryItem(
                  count: p.starCount,
                  text: 'Stars',
                ),
                EntryItem(
                  count: p.forksCount,
                  text: 'Forks', // TODO:
                ),
              ],
            ),
            CommonStyle.border,
            TableView(
              hasIcon: true,
              items: [
                TableViewItem(
                  leftIconData: Octicons.code,
                  text: Text(langs.keys.isEmpty ? 'Code' : langs.keys.first),
                  rightWidget: Text(filesize(p.statistics.repositorySize)),
                  url: '/gitlab/projects/$id/tree',
                ),
                if (p.issuesEnabled)
                  TableViewItem(
                    leftIconData: Octicons.issue_opened,
                    text: Text('Issues'),
                    rightWidget: Text(numberFormat.format(p.openIssuesCount)),
                    url: '/gitlab/projects/$id/issues',
                  ),
                if (p.mergeRequestsEnabled)
                  TableViewItem(
                    leftIconData: Octicons.git_pull_request,
                    text: Text('Merge requests'),
                    url: '/gitlab/projects/$id/merge_requests',
                  ),
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  rightWidget: Text(p.statistics.commitCount.toString()),
                  url: '/gitlab/projects/$id/commits',
                ),
              ],
            ),
            CommonStyle.verticalGap,
            if (t.item5 != null)
              Container(
                padding: CommonStyle.padding,
                color: theme.palette.background,
                child: MarkdownView(t.item5),
              ),
            CommonStyle.verticalGap,
          ],
        );
      },
    );
  }
}
