import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:primer/primer.dart';

class MarkdownView extends StatelessWidget {
  final String text;

  MarkdownView(this.text);

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: text,
      styleSheet: MarkdownStyleSheet(
        a: TextStyle(fontSize: 16, height: 1.5, color: PrimerColors.blue500),
        p: TextStyle(fontSize: 16, height: 1.5, color: PrimerColors.gray900),
        code: TextStyle(fontSize: 16, color: PrimerColors.gray900),
        h1: TextStyle(
            fontSize: 32,
            color: PrimerColors.gray900,
            fontWeight: FontWeight.w600),
        h2: TextStyle(
            fontSize: 24,
            color: PrimerColors.gray900,
            fontWeight: FontWeight.w600),
        h3: TextStyle(
            fontSize: 20,
            color: PrimerColors.gray900,
            fontWeight: FontWeight.w600),
        h4: TextStyle(
            fontSize: 16,
            color: PrimerColors.gray900,
            fontWeight: FontWeight.w600),
        h5: TextStyle(
            fontSize: 14,
            color: PrimerColors.gray900,
            fontWeight: FontWeight.w600),
        h6: TextStyle(
            fontSize: 13.6,
            color: PrimerColors.gray500,
            fontWeight: FontWeight.w600),
        em: TextStyle(fontStyle: FontStyle.italic),
        strong: TextStyle(fontWeight: FontWeight.w600),
        blockquote: TextStyle(),
        img: TextStyle(),
        blockSpacing: 8.0,
        listIndent: 32.0,
        blockquotePadding: 8.0,
        blockquoteDecoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(2.0)),
        codeblockPadding: 8.0,
        codeblockDecoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(2.0)),
        horizontalRuleDecoration: BoxDecoration(
          border:
              Border(top: BorderSide(width: 5.0, color: Colors.grey.shade300)),
        ),
      ),
      // syntaxHighlighter: , // TODO:
    );
  }
}
