import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';

class BlobView extends StatelessWidget {
  final String name;
  // final String text;
  final String base64Text;
  final String networkUrl;
  BlobView(
    this.name, {
    // this.text,
    @required this.base64Text,
    this.networkUrl,
  });

  @override
  Widget build(BuildContext context) {
    final codeProvider = Provider.of<CodeModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    switch (name.ext) {
      // TODO: All image types
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
      case 'webp':
        // return PhotoView(
        //   imageProvider: MemoryImage(Uint8List.fromList(bits)),
        //   backgroundDecoration: BoxDecoration(color: theme.palette.background),
        // );
        return base64Text == null
            ? Image.network(networkUrl)
            : Image.memory(base64.decode(base64Text));
      case 'md':
      case 'markdown':
        return Padding(
          padding: CommonStyle.padding,
          child: MarkdownView(base64Text.base64ToUtf8), // TODO: basePath
        );
      default:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: HighlightView(
            base64Text.base64ToUtf8,
            language: name.ext ?? 'plaintext',
            theme: themeMap[theme.brightness == Brightness.dark
                ? codeProvider.themeDark
                : codeProvider.theme],
            padding: CommonStyle.padding,
            textStyle: TextStyle(
                fontSize: codeProvider.fontSize.toDouble(),
                fontFamily: codeProvider.fontFamilyUsed),
          ),
        );
    }
  }
}
