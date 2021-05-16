import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleScaffold(
      title: AppBarTitle(AppLocalizations.of(context)!.notFoundMessage),
      body: Text(AppLocalizations.of(context)!.notFoundTextDisplay),
    );
  }
}
