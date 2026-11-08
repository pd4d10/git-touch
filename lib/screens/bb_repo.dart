import 'dart:convert';

import 'package:antd_mobile/antd_mobile.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class BbRepoScreen extends StatelessWidget {
  const BbRepoScreen(this.owner, this.name, {this.branch});
  final String owner;
  final String name;
  final String? branch;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple3<BbRepo, String?, List<BbBranch>>>(
      title: Text(AppLocalizations.of(context)!.repository),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final r = await auth.fetchBbJson('/repositories/$owner/$name');
        final repo = BbRepo.fromJson(r);
        final res = await auth.fetchBb(
            '/repositories/$owner/$name/src/${repo.mainbranch!.name}/README.md');
        final readme =
            res.statusCode >= 400 ? null : utf8.decode(res.bodyBytes);
        final branches = await auth
            .fetchBbWithPage('/repositories/$owner/$name/refs/branches')
            .then((v) {
          return [for (var branch in v.items) BbBranch.fromJson(branch)];
        });
        return Tuple3(repo, readme, branches);
      },
      bodyBuilder: (t, _) {
        final theme = Provider.of<ThemeModel>(context);
        final p = t.item1;
        final branches = t.item3;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.avatarUrl,
              avatarLink: null,
              owner: p.ownerLogin,
              name: p.slug,
              description: p.description,
              homepageUrl: p.website,
            ),
            CommonStyle.border,
            AntList(
              children: [
                AntListItem(
                  prefix: const Icon(Octicons.code),
                  extra: Text(filesize(p.size)),
                  onClick: () {
                    context.push(
                        '/bitbucket/$owner/$name/src/${branch ?? p.mainbranch!.name}');
                  },
                  child: const Text('Code'),
                ),
                AntListItem(
                  prefix: const Icon(Octicons.issue_opened),
                  child: const Text('Issues'),
                  onClick: () {
                    context.push('/bitbucket/$owner/$name/issues');
                  },
                ),
                AntListItem(
                  prefix: const Icon(Octicons.git_pull_request),
                  child: const Text('Pull requests'),
                  onClick: () {
                    context.push('/bitbucket/$owner/$name/pulls');
                  },
                ),
                AntListItem(
                  prefix: const Icon(Octicons.history),
                  child: const Text('Commits'),
                  onClick: () {
                    context.push(
                        '/bitbucket/$owner/$name/commits/${branch ?? p.mainbranch!.name}');
                  },
                ),
                AntListItem(
                  prefix: const Icon(Octicons.git_branch),
                  extra: Text(
                      '${(branch ?? p.mainbranch!.name)!} • ${branches.length}'),
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
                            context.pushUrl(
                                '/bitbucket/$owner/$name?branch=$ref',
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
            if (t.item2 != null) MarkdownFlutterView(t.item2),
            CommonStyle.verticalGap,
          ],
        );
      },
    );
  }
}
