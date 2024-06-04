import 'package:flutter/widgets.dart';
import 'package:git_touch/utils/utils.dart';

class TextWithAt extends StatelessWidget {
  const TextWithAt({
    required this.text,
    required this.linkFactory,
    this.style,
    this.oneLine = true,
  });
  final String text;
  final String Function(String text) linkFactory;
  final TextStyle? style;
  final bool oneLine;

  static final _reg = RegExp(r'@[A-Za-z-]+');

  @override
  Widget build(BuildContext context) {
    final matches = _reg.allMatches(text).map((m) => m.group(0)).toList();
    final chunks = text.split(_reg);

    final spans = <TextSpan>[];
    for (final index in List.generate(matches.length, (i) => (i))) {
      if (chunks[index].isNotEmpty) {
        spans.add(TextSpan(text: chunks[index]));
      }
      spans.add(createLinkSpan(
          context, matches[index], linkFactory(matches[index] ?? '')));
    }
    if (chunks.last.isNotEmpty) {
      spans.add(TextSpan(text: chunks.last));
    }

    return Text.rich(
      TextSpan(children: spans, style: style),
      overflow: oneLine ? TextOverflow.ellipsis : TextOverflow.clip,
      maxLines: oneLine ? 1 : null,
    );
  }
}
