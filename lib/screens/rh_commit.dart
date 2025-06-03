import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/rhodecode.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/files_item.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/avatar.dart';

class RhCommitScreen extends StatelessWidget {
  // changesets cannot be filtered by branch
  const RhCommitScreen(this.id, this.revision);
  final int id;
  final String revision;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<RhodecodeChangeset>(
      title: Text('${AppLocalizations.of(context)!.commit} $revision'),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final parameters = {
          'repoid': id,
          'revision': revision,
          'details': 'full'
        };
        final res = await auth.fetchRhodecodeWithPage('get_repo_changeset',
            body: parameters);
        return RhodecodeChangeset.fromJson(res.data['result']);
      },
      actionBuilder: (data, _) => ActionButton(
          title: AppLocalizations.of(context)!.actions,
          items: [...ActionItem.getUrlActions(data.author)]),
      bodyBuilder: (data, _) {
        final theme = Provider.of<ThemeModel>(context);
        final codeProvider = Provider.of<CodeModel>(context);
        return Column(children: <Widget>[
          Container(
              padding: CommonStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LinkWidget(
                    url: 'TODO',
                    child: Row(
                      children: <Widget>[
                        Avatar(
                          url: 'TODO',
                          size: AvatarSize.extraSmall,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'TODO',
                          style: TextStyle(
                            fontSize: 17,
                            color: AntTheme.of(context).colorTextSecondary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          data.rawId!,
                          style: TextStyle(
                            fontSize: 17,
                            color: AntTheme.of(context).colorWeak,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.message!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
          Wrap(
            children: data.diff!
                .map<Widget>((file) => FilesItem(
                      filename: file.filename,
                      additions: file.stats!.added,
                      deletions: file.stats!.deleted,
                      status: file.op,
                      patch: file.rawDiff,
                    ))
                .toList(),
          )
        ]);
      },
    );
  }
}
