import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/gists_item.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import '../generated/l10n.dart';

class GhGistsScreen extends StatelessWidget {
  final String login;
  GhGistsScreen(this.login);

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GithubGistsItem, int>(
      title: AppBarTitle(S.of(context).gists),
      fetch: (page) async {
        page = page ?? 1;
        final res = await context
            .read<AuthModel>()
            .ghClient
            .getJSON<List, List<GithubGistsItem>>(
              '/users/$login/gists?page=$page',
              convert: (vs) => [for (var v in vs) GithubGistsItem.fromJson(v)],
            );
        return ListPayload(
          cursor: page + 1,
          items: res,
          hasMore: res.isNotEmpty,
        );
      },
      itemBuilder: (v) {
        return GistsItem(
          description: v.description,
          login: login,
          files: v.files,
          filenames: v.fileNames,
          language: v.fileNames[0].language,
          avatarUrl: v.owner.avatarUrl,
          updatedAt: v.updatedAt,
          id: v.id,
        );
      },
    );
  }
}
