import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/files_item.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/widgets/action_button.dart';
import '../generated/l10n.dart';

class GhComparisonScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String before;
  final String head;
  GhComparisonScreen(this.owner, this.name, this.before, this.head);

  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: AppBarTitle(S.of(context).files),
      fetch: () async {
        final res = await context.read<AuthModel>().ghClient.getJSON(
            '/repos/$owner/$name/compare/$before...$head',
            convert: (vs) => GithubComparisonItem.fromJson(vs));
        return res.files;
      },
      actionBuilder: (v, _) {
        return ActionButton(
          title: S.of(context).actions,
          items: [
            ...ActionItem.getUrlActions(
                'https://github.com/$owner/$name/compare/$before...$head'),
          ],
        );
      },
      bodyBuilder: (v, _) {
        return Wrap(
          children: v
              .map<Widget>((vs) => FilesItem(
                    filename: vs.filename,
                    additions: vs.additions,
                    deletions: vs.deletions,
                    status: vs.status,
                    patch: vs.patch,
                  ))
              .toList(),
        );
      },
    );
  }
}
