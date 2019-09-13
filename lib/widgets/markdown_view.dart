import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:primer/primer.dart';

class MarkdownView extends StatelessWidget {
  final String text;

  MarkdownView(this.text);

  static const _basicStyle =
      TextStyle(fontSize: 16, color: PrimerColors.gray900, height: 1.5);

  static final _hStyle =
      _basicStyle.copyWith(fontWeight: FontWeight.w600, height: 1.25);

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: text,
      styleSheet: MarkdownStyleSheet(
        a: _basicStyle.copyWith(color: PrimerColors.blue500),
        p: _basicStyle,
        code: _basicStyle.copyWith(
          fontSize: 16 * 0.85,
          height: 1.45,
          fontFamily: 'monospace', // FIXME:
        ),
        h1: _hStyle.copyWith(fontSize: 32),
        h2: _hStyle.copyWith(fontSize: 24),
        h3: _hStyle.copyWith(fontSize: 20),
        h4: _hStyle,
        h5: _hStyle.copyWith(fontSize: 14),
        h6: _hStyle.copyWith(fontSize: 16 * 0.85, color: PrimerColors.gray500),
        em: _basicStyle.copyWith(fontStyle: FontStyle.italic),
        strong: _basicStyle.copyWith(fontWeight: FontWeight.w600),
        blockquote: _basicStyle.copyWith(color: PrimerColors.gray500),
        img: _basicStyle,
        blockSpacing: 16,
        listIndent: 32,
        blockquotePadding: 16, // FIXME: only horizontal
        blockquoteDecoration: BoxDecoration(
          border: Border(left: BorderSide(color: Color(0xffdfe2e5), width: 4)),
        ),
        codeblockPadding: 16,
        codeblockDecoration: BoxDecoration(
          color: PrimerColors.gray100,
          borderRadius: BorderRadius.circular(3),
        ),
        horizontalRuleDecoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 4, color: PrimerColors.gray200),
          ),
        ),
      ),
      // syntaxHighlighter: , // TODO:
    );
  }
}
