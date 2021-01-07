import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/files_item.dart';
import 'package:git_touch/models/auth.dart';
import '../generated/l10n.dart';

class GeFilesScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String pullNumber;
  GeFilesScreen(this.owner, this.name, this.pullNumber);

  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteePullFile, int>(
      title: AppBarTitle(S.of(context).files),
      actionBuilder: () {
        return ActionButton(
          title: 'Actions',
          items: [
            ...ActionItem.getUrlActions(
                'https://gitee.com/$owner/$name/pulls/$pullNumber/files'),
          ],
        );
      },
      fetch: (page) async {
        page = page ?? 1;
        final res = await context
            .read<AuthModel>()
            .fetchGiteeWithPage(
              '/repos/$owner/$name/pulls/$pullNumber/files?page=$page',
            )
            .then((v) {
          return [for (var file in v.data) GiteePullFile.fromJson(file)];
        });
        return ListPayload(
          cursor: page + 1,
          items: res,
          hasMore: res.isNotEmpty,
        );
      },
      itemBuilder: (v) {
        return FilesItem(
          filename: v.filename,
          additions: int.parse(v.additions),
          deletions: int.parse(v.deletions),
          status: v.status,
          patch: v.patch.diff,
        );
      },
    );
  }
}
