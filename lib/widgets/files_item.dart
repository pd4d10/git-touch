import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class FilesItem extends StatelessWidget {
  const FilesItem({
    required this.filename,
    required this.status,
    required this.deletions,
    required this.additions,
    required this.patch,
  });
  final String? filename;
  final String? status;
  final int? additions;
  final int? deletions;
  final String? patch;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final codeProvider = Provider.of<CodeModel>(context);
    return AntCollapse(
      activeKey: {}, // removed const to fix 'Cannot change an unmodifiable set'
      onChange: (_) {
        // TODO: set active
      },
      panels: [
        AntCollapsePanel(
          key: '',
          title: Text(
            filename!,
            style: TextStyle(
              color: AntTheme.of(context).colorPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: HighlightView(
              patch!,
              language: 'diff',
              padding: CommonStyle.padding,
              theme: themeMap[theme.brightness == Brightness.dark
                  ? codeProvider.themeDark
                  : codeProvider.theme]!,
              textStyle: codeProvider.fontStyle,
            ),
          ),
        ),
      ],
    );
  }
}
