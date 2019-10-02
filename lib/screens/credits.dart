import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:tuple/tuple.dart';

class CreditsScreen extends StatelessWidget {
  static const projects = [
    Tuple2('flutter', 'flutter/flutter'),
    Tuple2('flutter_vector_icons', 'pd4d10/flutter-vector-icons'),
    Tuple2('flutter_highlight', 'pd4d10/highlight'),
    Tuple2('primer', 'pd4d10/primer-flutter'),
    Tuple2('nanoid', 'pd4d10/nanoid-dart'),
    Tuple2('github_contributions', 'pd4d10/github-contributions'),
    Tuple2('seti', 'pd4d10/seti-flutter'),
    Tuple2('http', 'dart-lang/http'),
    Tuple2('intl', 'dart-lang/intl'),
    Tuple2('url_launcher', 'flutter/plugins'),
    Tuple2('uni_links', 'avioli/uni_links'),
    Tuple2('flutter_markdown', 'flutter/flutter_markdown'),
    Tuple2('shared_preferences', 'flutter/plugins'),
    Tuple2('share', 'flutter/plugins'),
    Tuple2('flutter_svg', 'dnfield/flutter_svg'),
    Tuple2('launch_review', 'purus/launch_review'),
    Tuple2('timeago', 'andresaraujo/timeago.dart'),
    Tuple2('provider', 'rrousselGit/provider'),
    Tuple2('filesize', 'synw/filesize'),
    Tuple2('tuple', 'dart-lang/tuple'),
    Tuple2('uri', 'google/uri.dart'),
  ];

  static const fonts = [
    'Fira Code',
    'Inconsolata',
    'PT Mono',
    'Source Code Pro',
    'Ubuntu Mono'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleScaffold(
      title: Text('Credits'),
      body: Column(
        children: <Widget>[
          verticalGap,
          TableView(
            headerText: 'packages',
            items: projects.map((t) {
              return TableViewItem(
                text: Text(t.item1),
                screenBuilder: (_) => RepositoryScreen.fromFullName(t.item2),
              );
            }),
          ),
          verticalGap,
          TableView(
            headerText: 'fonts',
            items: fonts.map((font) {
              return TableViewItem(
                text: Text(font),
                screenBuilder: (_) =>
                    RepositoryScreen.fromFullName('google/fonts'),
              );
            }),
          ),
        ],
      ),
    );
  }
}
