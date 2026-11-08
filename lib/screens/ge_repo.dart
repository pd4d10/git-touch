import 'dart:convert';
import 'dart:io';

import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/mutation_button.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class StatusPayload {
  StatusPayload(this.isWatching, this.isStarred);
  bool isWatching;
  bool isStarred;
}

class GeRepoScreen extends StatelessWidget {
  const GeRepoScreen(this.owner, this.name, {this.branch});
  final String owner;
  final String name;
  final String? branch;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple4<GiteeRepo, MarkdownViewData, List<GiteeBranch>, StatusPayload>>(
      title: Text(AppLocalizations.of(context)!.repository),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final repo = await auth.fetchGitee('/repos/$owner/$name').then((v) {
          return GiteeRepo.fromJson(v);
        });

        md() => auth.fetchGitee('/repos/$owner/$name/readme').then((v) {
              return (v['content'] as String?)?.base64ToUtf8 ?? '';
            });
        html() => md().then((v) async {
              final res = await http.post(
                Uri.parse('${auth.activeAccount!.domain}/api/v5/markdown'),
                headers: {'Authorization': 'token ${auth.token}'},
                body: {'text': v},
              );
              return utf8.decode(res.bodyBytes).normalizedHtml;
            });
        final readmeData = MarkdownViewData(context, md: md, html: html);
        final branches =
            await auth.fetchGitee('/repos/$owner/$name/branches').then((v) {
          return [for (var branch in v) GiteeBranch.fromJson(branch)];
        });
        final isStarred = await auth
            .fetchGitee('/user/starred/$owner/$name', requestType: 'NO CONTENT')
            .then((v) => v.statusCode == HttpStatus.noContent);
        final isWatching = await auth
            .fetchGitee('/user/subscriptions/$owner/$name',
                requestType: 'NO CONTENT')
            .then((v) => v.statusCode == HttpStatus.noContent);
        final statusPayload = StatusPayload(isWatching, isStarred);
        return Tuple4(repo, readmeData, branches, statusPayload);
      },
      bodyBuilder: (t, setData) {
        final p = t.item1;
        final branches = t.item3;
        final theme = context.read<ThemeModel>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
                avatarUrl: p.owner!.avatarUrl,
                avatarLink: '/gitee/${p.namespace!.path}',
                owner: p.namespace!.path,
                name: p.path,
                description: p.description,
                homepageUrl: p.homepage,
                actions: [
                  Row(children: <Widget>[
                    MutationButton(
                      active: t.item4.isWatching,
                      text: t.item4.isWatching ? 'Ignore' : 'Watch',
                      onTap: () async {
                        final watchType =
                            t.item4.isWatching ? 'ignoring' : 'watching';
                        await context.read<AuthModel>().fetchGitee(
                            '/user/subscriptions/$owner/$name?watch_type=$watchType',
                            requestType: t.item4.isWatching ? 'DELETE' : 'PUT');

                        t.item4.isWatching = !t.item4.isWatching;
                        setData(t);
                      },
                    ),
                    const SizedBox(width: 8),
                    MutationButton(
                      active: t.item4.isStarred,
                      text: t.item4.isStarred ? 'Unstar' : 'Star',
                      onTap: () async {
                        await context.read<AuthModel>().fetchGitee(
                            '/user/starred/$owner/$name',
                            requestType: t.item4.isStarred ? 'DELETE' : 'PUT');

                        t.item4.isStarred = !t.item4.isStarred;
                        setData(t);
                      },
                    )
                  ])
                ]),
            Row(
              children: <Widget>[
                EntryItem(
                  count: p.watchersCount!,
                  text: 'Watchers',
                  url: '/gitee/$owner/$name/watchers',
                ),
                EntryItem(
                  count: p.stargazersCount!,
                  text: 'Stars',
                  url: '/gitee/$owner/$name/stargazers',
                ),
                EntryItem(
                  count: p.forksCount!,
                  text: 'Forks',
                  url: '/gitee/$owner/$name/forks',
                ),
              ],
            ),
            CommonStyle.border,
            AntList(
              children: [
                AntListItem(
                  prefix: const Icon(Octicons.code),
                  extra: Text(p.license ?? ''),
                  onClick: () {
                    context.push(
                        '/gitee/$owner/$name/tree/${branch ?? p.defaultBranch}');
                  },
                  child: const Text('Code'),
                ),
                AntListItem(
                  prefix: const Icon(Octicons.issue_opened),
                  extra: Text(numberFormat.format(p.openIssuesCount)),
                  onClick: () {
                    context.push('/gitee/$owner/$name/issues');
                  },
                  child: const Text('Issues'),
                ),
                if (p.pullRequestsEnabled!)
                  AntListItem(
                    prefix: const Icon(Octicons.git_pull_request),
                    child: const Text('Pull requests'),
                    onClick: () {
                      context.push('/gitee/$owner/$name/pulls');
                    },
                  ),
                AntListItem(
                  prefix: const Icon(Octicons.history),
                  child: const Text('Commits'),
                  onClick: () {
                    context.push(
                        '/gitee/$owner/$name/commits?branch=${branch ?? p.defaultBranch}');
                  },
                ),
                AntListItem(
                  prefix: const Icon(Octicons.git_branch),
                  extra: Text(
                      '${(branch ?? p.defaultBranch)!} • ${branches.length}'),
                  onClick: () async {
                    if (branches.length < 2) return;

                    await theme.showPicker(
                      context,
                      PickerGroupItem(
                        value: branch,
                        items: branches
                            .map((b) => PickerItem(b.name, text: b.name))
                            .toList(),
                        onClose: (ref) {
                          if (ref != branch) {
                            context.pushUrl('/gitee/$owner/$name?branch=$ref',
                                replace: true);
                          }
                        },
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.branches),
                ),
                AntListItem(
                  prefix: const Icon(Octicons.organization),
                  child: const Text('Contributors'),
                  onClick: () {
                    context.push('/gitee/$owner/$name/contributors');
                  },
                ),
              ],
            ),
            CommonStyle.verticalGap,
            MarkdownView(t.item2)
          ],
        );
      },
    );
  }
}
