import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';

class TextContainsOrganization extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool oneLine;

  TextContainsOrganization(this.text, {this.style, this.oneLine = false});

  static final _reg = RegExp(r'@[A-Za-z-]+');

  @override
  Widget build(BuildContext context) {
    final orgs = _reg.allMatches(text).map((m) => m.group(0)).toList();
    final chunks = text.split(_reg);

    List<TextSpan> spans = [];
    for (var index in List.generate(orgs.length, (i) => (i))) {
      if (chunks[index].isNotEmpty) {
        spans.add(TextSpan(text: chunks[index]));
      }
      spans.add(
          createLinkSpan(context, orgs[index], '/' + orgs[index].substring(1)));
    }
    if (chunks.last.isNotEmpty) {
      spans.add(TextSpan(text: chunks.last));
    }

    return RichText(
      text: TextSpan(children: spans, style: style),
      overflow: oneLine ? TextOverflow.ellipsis : null,
      maxLines: oneLine ? 1 : null,
    );
  }
}
