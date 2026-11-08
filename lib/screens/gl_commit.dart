import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

// TODO:
class GlCommitScreen extends StatelessWidget {
  const GlCommitScreen(this.id, {this.sha});
  final String id;
  final String? sha;

  Future<List<GitlabDiff>> _query(BuildContext context) async {
    final auth = context.read<AuthModel>();
    final res = await auth
        .fetchGitlabWithPage('/projects/$id/repository/commits/$sha/diff');
    return (res.data as List).map((v) => GitlabDiff.fromJson(v)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final codeProvider = Provider.of<CodeModel>(context);
    final theme = Provider.of<ThemeModel>(context);

    return RefreshStatefulScaffold<List<GitlabDiff>>(
      title: Text(AppLocalizations.of(context)!.commits),
      fetch: () => _query(context),
      bodyBuilder: (items, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (var item in items)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: HighlightView(
                  item.diff!,
                  language: 'diff',
                  theme: themeMap[theme.brightness == Brightness.dark
                      ? codeProvider.themeDark
                      : codeProvider.theme]!,
                  padding: CommonStyle.padding,
                  textStyle: codeProvider.fontStyle,
                ),
              ),
          ],
        );
      },
    );
  }
}
