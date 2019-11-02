import 'package:flutter/material.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/utils/utils.dart';

class TextContainsOrganization extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextOverflow overflow;

  TextContainsOrganization(this.text,
      {this.style, this.overflow = TextOverflow.clip});

  static final _reg = RegExp(r'@[\x00-\x7F]+');

  @override
  Widget build(BuildContext context) {
    final orgs = _reg.allMatches(text).map((m) => m.group(0)).toList();
    final chunks = text.split(_reg);

    List<TextSpan> spans = [];
    for (var index in List.generate(orgs.length, (i) => (i))) {
      if (chunks[index].isNotEmpty) {
        spans.add(TextSpan(text: chunks[index]));
      }
      spans.add(createLinkSpan(
          context, orgs[index], (_) => UserScreen(orgs[index].substring(1))));
    }
    if (chunks.last.isNotEmpty) {
      spans.add(TextSpan(text: chunks.last));
    }

    return RichText(
        text: TextSpan(children: spans, style: style), overflow: overflow);
  }
}
