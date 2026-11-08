import 'dart:convert';

import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GoRepoScreen extends StatelessWidget {
  const GoRepoScreen(this.owner, this.name, {this.branch});
  final String owner;
  final String name;
  final String? branch;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<
        Tuple3<GogsRepository, MarkdownViewData, List<GogsBranch>>>(
      title: Text(AppLocalizations.of(context)!.repository),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final repo = await auth.fetchGogs('/repos/$owner/$name').then((v) {
          return GogsRepository.fromJson(v);
        });

        md() =>
            auth.fetchGogs('/repos/$owner/$name/contents/README.md').then((v) {
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
        final branches =
            await auth.fetchGogs('/repos/$owner/$name/branches').then((v) {
          return [
            for (var branch in (v is List ? v : [])) GogsBranch.fromJson(branch)
          ]; // Valid API Response only returned if repo contains >= 2 branches
        });

        return Tuple3(repo, readmeData, branches);
      },
      bodyBuilder: (t, _) {
        final p = t.item1;
        final branches = t.item3;
        final theme = context.read<ThemeModel>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.owner!.avatarUrl,
              avatarLink: '/gogs/${p.owner!.username}',
              owner: p.owner!.username,
              name: p.fullName!.split('/')[1],
              description: p.description,
              homepageUrl: p.website,
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                // TODO: when API is available
                EntryItem(
                  count: p.watchersCount!,
                  text: 'Watchers',
                ),
                EntryItem(
                  count: p.starsCount!,
                  text: 'Stars',
                ),
                EntryItem(
                  count: p.forksCount!,
                  text: 'Forks',
                ),
              ],
            ),
            CommonStyle.border,
            AntList(
              children: [
                AntListItem(
                  prefix: const Icon(Octicons.code),
                  child: const Text('Code'),
                  onClick: () {
                    context.push(
                        '/gogs/$owner/$name/blob?ref=${branch ?? 'master'}');
                  },
                ),
                AntListItem(
                  prefix: const Icon(Octicons.issue_opened),
                  child: const Text('Issues'),
                  onClick: () {
                    context.push('/gogs/$owner/$name/issues');
                  },
                ),
                const AntListItem(
                  prefix: Icon(Octicons.git_pull_request),
                  child: Text(
                      'Pull requests'), // TODO: when API endpoint is available
                ),
                AntListItem(
                  prefix: const Icon(Octicons.history),
                  child: const Text('Commits'),
                  onClick: () {
                    context.push(
                        '/gogs/$owner/$name/commits?ref=${branch ?? 'master'}');
                  },
                ),
                AntListItem(
                  prefix: const Icon(Octicons.git_branch),
                  extra: Text(
                      '${branch ?? 'master'} • ${branches.length.toString()}'),
                  onClick: () async {
                    await theme.showPicker(
                      context,
                      PickerGroupItem(
                        value: branch,
                        items: branches
                            .map((b) => PickerItem(b.name, text: b.name))
                            .toList(),
                        onClose: (ref) {
                          if (ref != branch) {
                            context.pushUrl('/gogs/$owner/$name?branch=$ref',
                                replace: true);
                          }
                        },
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.branches),
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
