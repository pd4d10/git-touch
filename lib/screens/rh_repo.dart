import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/repo_header.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/rhodecode.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:tuple/tuple.dart';

class RhRepoScreen extends StatelessWidget {
  RhRepoScreen(this.id, {this.branch = 'master'});
  final int id;
  final String branch;
  String? latestBranchCommit;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple3<RhRepo, String?, List<RhBranch>>>(
      title: Text(AppLocalizations.of(context)!.repository),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final parameters = {'repoid': id};
        final repo =
            await auth.fetchRhodecode('get_repo', body: parameters).then((v) {
          return RhRepoResponse.fromJson(v).result;
        });

        final rhBranchList = await auth
            .fetchRhodecode('get_repo_refs', body: parameters)
            .then((v) {
          final branches = RhRepoRefsResponse.fromJson(v).result?.branches;
          final branchList = <RhBranch>[];
          (branches! is List ? {} : branches).forEach((key, value) {
            branchList.add(RhBranch(key, value));
            key == branch ? latestBranchCommit = value : '';
          });

          return branchList;
        });

        md() {
          final params = <String, dynamic>{
            'repoid': id,
            'commit_id': latestBranchCommit,
            'file_path': 'README.md',
            'details': 'full',
            'cache': false,
            'max_file_bytes': 50000
          };

          return auth
              .fetchRhodecode('get_repo_file', body: params)
              .onError<Error>(
            (e, s) {
              return null;
            },
          ).then((v) {
            return (v?['result']['content'] as String?) ?? '';
          });
        }

        return Tuple3(repo!, await md(), rhBranchList);
      },
      bodyBuilder: (t, _) {
        final p = t.item1;
        final branches = t.item3;
        final theme = context.read<ThemeModel>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoHeader(
              avatarUrl: p.owner!, // TODO
              avatarLink: 'TODO', // TODO
              owner: p.owner,
              name: p.repoName,
              description: p.description,
              homepageUrl: p.url,
            ),
            CommonStyle.border,
            Row(
              children: <Widget>[
                // TODO
                // EntryItem(
                //   count: p.watchersCount!,
                //   text: 'Watchers',
                // ),
                // EntryItem(
                //   count: p.starsCount!,
                //   text: 'Stars',
                // ),
                // EntryItem(
                //   count: p.forksCount!,
                //   text: 'Forks',
                // ),
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
                        '/rhodecode/repository/$id/tree/$branch?revision=$latestBranchCommit');
                  },
                ),
				// TODO
                // const AntListItem(
                //   prefix: Icon(Octicons.git_pull_request),
                //   child: Text(
                //       'Pull requests'),
                // ),
                AntListItem(
                  prefix: const Icon(Octicons.history),
                  child: const Text('Commits'),
                  onClick: () {
                    context.push(
                        '/rhodecode/repository/$id/commits?branch=$branch');
                  },
                ),
                AntListItem(
                  prefix: const Icon(Octicons.git_branch),
                  extra: Text('$branch • ${branches.length.toString()}'),
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
                            context.pushUrl(
                                '/rhodecode/repository/$id?branch=$ref',
                                replace: false);
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
            MarkdownFlutterView(t.item2),
          ],
        );
      },
    );
  }
}
