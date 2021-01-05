import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

// TODO:
class GlCommitScreen extends StatelessWidget {
  final String id;
  final String sha;
  GlCommitScreen(this.id, {this.sha});

  Future<List<GitlabDiff>> _query(BuildContext context, [int page = 1]) async {
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
      title: AppBarTitle(S.of(context).commits),
      fetch: () => _query(context),
      bodyBuilder: (items, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (var item in items)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: HighlightView(
                  item.diff,
                  language: 'diff',
                  theme: themeMap[theme.brightness == Brightness.dark
                      ? codeProvider.themeDark
                      : codeProvider.theme],
                  padding: CommonStyle.padding,
                  textStyle: TextStyle(
                      fontSize: codeProvider.fontSize.toDouble(),
                      fontFamily: codeProvider.fontFamilyUsed),
                ),
              ),
          ],
        );
      },
    );
  }
}
