import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/files_item.dart';
import 'package:provider/provider.dart';

class GhComparisonScreen extends StatelessWidget {
  const GhComparisonScreen(this.owner, this.name, this.before, this.head);
  final String owner;
  final String name;
  final String before;
  final String head;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: Text(AppLocalizations.of(context)!.files),
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
                    patch: vs.patch ?? AppLocalizations.of(context)!.blankDiff,
                  ))
              .toList(),
        );
      },
    );
  }
}
