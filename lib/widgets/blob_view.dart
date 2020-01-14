import 'package:path/path.dart' as p;
import 'package:flutter/cupertino.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';

class BlobView extends StatelessWidget {
  final String path;
  final String payload;

  BlobView(this.path, this.payload);

  String get _extname {
    var dotext = p.extension(path);
    if (dotext.isEmpty) return '';
    return dotext.substring(1);
  }

  String get _language => _extname.isEmpty ? 'plaintext' : _extname;

  @override
  Widget build(BuildContext context) {
    final codeProvider = Provider.of<CodeModel>(context);
    final theme = Provider.of<ThemeModel>(context);

    switch (_extname) {
      // TODO: All image types
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
      case 'webp':
        return PhotoView(
          imageProvider: NetworkImage(payload),
          backgroundDecoration:
              BoxDecoration(color: theme.paletteOf(context).background),
        );
      case 'md':
      case 'markdown':
        return Padding(
          padding: CommonStyle.padding,
          child: MarkdownView(payload), // TODO: basePath
        );
      case 'svg':
        return SvgPicture.network(payload);
      default:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: HighlightView(
            payload,
            language: _language,
            theme: themeMap[codeProvider.theme],
            padding: CommonStyle.padding,
            textStyle: TextStyle(
                fontSize: codeProvider.fontSize.toDouble(),
                fontFamily: codeProvider.fontFamilyUsed),
          ),
        );
    }
  }
}
