import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import '../generated/l10n.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleScaffold(
      title: AppBarTitle(S.of(context).notFoundMessage),
      body: Text(S.of(context).notFoundTextDisplay),
    );
  }
}
