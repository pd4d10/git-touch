import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/html_view.dart';
import 'package:git_touch/widgets/language_bar.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:tuple/tuple.dart';

class GlProjectScreen extends StatelessWidget {
  final int id;
  GlProjectScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple4<GitlabProject, Future<Map<String, double>>, Future<int>,
            Future<String>>>(
      title: AppBarTitle('Project'),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final p =
            await auth.fetchGitlab('/projects/$id?statistics=1').then((res) {
          return GitlabProject.fromJson(res);
        });

        final langFuture =
            auth.fetchGitlab('/projects/$id/languages').then((v) {
          return Map<String, double>.from(v);
        });
        // auth.fetchGitlab('/projects/$id/badges') // badges
        final memberCountFuture = auth
            .fetchGitlabWithPage('/projects/$id/members?per_page=1')
            .then((v) => v.total);
        final readmeFuture = p.readmeUrl == null
            ? Future.sync(() => null)
            : auth
                .fetchWithGitlabToken(
                    p.readmeUrl.replaceFirst(r'/blob/', '/raw/'))
                .then((md) async {
                // we should get the markdown content, then render it
                // https://gitlab.com/gitlab-org/gitlab/-/issues/16335
                final res = await auth.fetchGitlab('/markdown',
                    isPost: true,
                    body: {
                      'text': md,
                      'gfm': true,
                      'project': '${p.namespace.name}/${p.name}'
                    });
                return (res['html'] as String).normalizedHtml;
              });

        return Tuple4(p, langFuture, memberCountFuture, readmeFuture);
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
        final p = t.item1;
        final langFuture = t.item2;
        final memberCountFuture = t.item3;
        final readmeFuture = t.item4;

        final theme = Provider.of<ThemeModel>(context);
        final auth = Provider.of<AuthModel>(context);
        final prefix =
            '${auth.activeAccount.domain}/${p.namespace.path}/${p.name}'
                .urlencode;
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
              // trailings: <Widget>[
              //   if (badges.isNotEmpty)
              //     Wrap(spacing: 4, runSpacing: 4, children: [
              //       for (var label in badges)
              //         SvgPicture.network(label.renderedImageUrl, height: 20),
              //     ])
              // ],
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                FutureBuilder<int>(
                  future: memberCountFuture,
                  builder: (context, snapshot) {
                    return EntryItem(
                      count: snapshot.data,
                      text: 'Members',
                      url: '/gitlab/projects/$id/members',
                    );
                  },
                ),
                EntryItem(
                  count: p.starCount,
                  text: 'Stars',
                  url: '/gitlab/projects/$id/starrers',
                ),
                EntryItem(
                  count: p.forksCount,
                  text: 'Forks', // TODO:
                ),
              ],
            ),
            CommonStyle.border,
            FutureBuilder<Map<String, double>>(
              future: langFuture,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return LanguageBar([
                    LanguageBarItem(name: '', ratio: 1),
                  ]);
                } else {
                  return LanguageBar([
                    for (var e in snapshot.data?.entries ?? [])
                      LanguageBarItem(name: e.key, ratio: e.value / 100)
                  ]);
                }
              },
            ),
            CommonStyle.border,
            TableView(
              hasIcon: true,
              items: [
                TableViewItem(
                  leftIconData: Octicons.code,
                  text: FutureBuilder<Map<String, double>>(
                    future: langFuture,
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Text('');
                      } else {
                        final langs = snapshot.data.keys;
                        return Text(langs.isEmpty ? 'Code' : langs.first);
                      }
                    },
                  ),
                  rightWidget: p.statistics == null
                      ? null
                      : Text(filesize(p.statistics.repositorySize)),
                  url: '/gitlab/projects/$id/tree/${p.defaultBranch}',
                ),
                if (p.issuesEnabled)
                  TableViewItem(
                    leftIconData: Octicons.issue_opened,
                    text: Text('Issues'),
                    rightWidget: Text(numberFormat.format(p.openIssuesCount)),
                    url: '/gitlab/projects/$id/issues?prefix=$prefix',
                  ),
                if (p.mergeRequestsEnabled)
                  TableViewItem(
                    leftIconData: Octicons.git_pull_request,
                    text: Text('Merge requests'),
                    url: '/gitlab/projects/$id/merge_requests?prefix=$prefix',
                  ),
                TableViewItem(
                  leftIconData: Octicons.history,
                  text: Text('Commits'),
                  rightWidget: p.statistics == null
                      ? null
                      : Text(p.statistics.commitCount.toString()),
                  url: '/gitlab/projects/$id/commits?prefix=$prefix',
                ),
              ],
            ),
            CommonStyle.verticalGap,
            FutureBuilder<String>(
              future: readmeFuture,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container();
                } else {
                  return MarkdownHtmlView(snapshot.data);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
