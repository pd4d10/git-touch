import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/files_item.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class GhComparisonScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String before;
  final String head;
  GhComparisonScreen(this.owner, this.name, this.before, this.head);

  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: AppBarTitle(AppLocalizations.of(context)!.files),
      fetch: () async {
        final res = await context.read<AuthModel>().ghClient.getJSON(
            '/repos/$owner/$name/compare/$before...$head',
            convert: (dynamic vs) => GithubComparisonItem.fromJson(vs));
        return res.files;
      },
      actionBuilder: (dynamic v, _) {
        return ActionButton(
          title: AppLocalizations.of(context)!.actions,
          items: [
            ...ActionItem.getUrlActions(
                'https://github.com/$owner/$name/compare/$before...$head'),
          ],
        );
      },
      bodyBuilder: (dynamic v, _) {
        return Wrap(
          children: v
              .map<Widget>((vs) => FilesItem(
                    filename: vs.filename,
                    additions: vs.additions,
                    deletions: vs.deletions,
                    status: vs.status,
                    patch: vs.patch ?? "No text to be shown here",
                  ))
              .toList(),
        );
      },
    );
  }
}
