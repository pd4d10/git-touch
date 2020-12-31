import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/generated/l10n.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:provider/provider.dart';

class GtStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<String>(
      title: Text(S.of(context).giteaStatus),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final res = await Future.wait([
          auth.fetchGitea('/version'),
          auth.fetchGitea('/settings/attachment'),
          auth.fetchGitea('/settings/api'),
          auth.fetchGitea('/settings/repository'),
          auth.fetchGitea('/settings/ui'),
        ]);
        return JsonEncoder.withIndent('  ').convert({
          ...res[0],
          'attachment': res[1],
          'api': res[2],
          'repository': res[3],
          'ui': res[4],
        });
      },
      bodyBuilder: (jsonStr, _) {
        return BlobView('0.json', text: jsonStr);
      },
    );
  }
}
