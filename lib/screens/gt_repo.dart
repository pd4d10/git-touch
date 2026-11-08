import 'dart:convert';

import 'package:antd_mobile/antd_mobile.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GtRepoScreen extends StatelessWidget {
  const GtRepoScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GiteaRepository, MarkdownViewData>>(
      title: Text(AppLocalizations.of(context)!.repository),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final repo = await auth.fetchGitea('/repos/$owner/$name').then((v) {
          return GiteaRepository.fromJson(v);
        });

        md() =>
            auth.fetchGitea('/repos/$owner/$name/contents/README.md').then((v) {
              return (v['content'] as String?)?.base64ToUtf8 ?? '';
            });
        html() => md().then((v) async {
              final res = await http.post(
                Uri.parse('${auth.activeAccount!.domain}/api/v1/markdown/raw'),
                headers: {'Authorization': 'token ${auth.token}'},
                body: v,
              );
              return utf8.decode(res.bodyBytes).normalizedHtml;
            });
        final readmeData = MarkdownViewData(context, md: md, html: html);

        return Tuple2(repo, readmeData);
      },
      bodyBuilder: (t, _) {
        final p = t.item1;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.owner!.avatarUrl,
              avatarLink: '/gitea/${p.owner!.login}',
              owner: p.owner!.login,
              name: p.name,
              description: p.description,
              homepageUrl: p.website,
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                EntryItem(
                  count: 0, // TODO:
                  text: 'Watchers',
                  url: '/gitea/$owner/$name/watchers',
                ),
                EntryItem(
                  count: p.starsCount!,
                  text: 'Stars',
                  url: '/gitea/$owner/$name/stargazers',
                ),
                EntryItem(
                  count: p.forksCount!,
                  text: 'Forks',
                  url: '/gitea/$owner/$name/forks',
                ),
              ],
            ),
            CommonStyle.border,
            AntList(
              children: [
                AntListItem(
                  prefix: const Icon(Octicons.code),
                  extra: Text(filesize(p.size! * 1000)),
                  onClick: () {
                    context.push('/gitea/$owner/$name/blob');
                  },
                  child: const Text('Code'),
                ),
                AntListItem(
                  prefix: const Icon(Octicons.issue_opened),
                  extra: Text(numberFormat.format(p.openIssuesCount)),
                  onClick: () {
                    context.push('/gitea/$owner/$name/issues');
                  },
                  child: const Text('Issues'),
                ),
                AntListItem(
                  prefix: const Icon(Octicons.git_pull_request),
                  extra: Text(numberFormat.format(p.openPrCounter)),
                  onClick: () {
                    context.push('/gitea/$owner/$name/pulls');
                  },
                  child: const Text('Pull requests'),
                ),
                AntListItem(
                  prefix: const Icon(Octicons.history),
                  child: const Text('Commits'),
                  onClick: () {
                    context.push('/gitea/$owner/$name/commits');
                  },
                ),
              ],
            ),
            CommonStyle.verticalGap,
            MarkdownView(t.item2),
          ],
        );
      },
    );
  }
}
