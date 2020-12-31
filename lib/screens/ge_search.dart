import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import '../generated/l10n.dart';

class GeSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<String>(
      title: AppBarTitle(S.of(context).search),
      fetch: () async {
        return '';
      },
      bodyBuilder: (content, _) {
        return Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('Coming soon...'),
          ),
        );
      },
    );
  }
}
