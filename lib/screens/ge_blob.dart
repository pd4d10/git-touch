import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class GeBlobScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String sha;
  final String path;
  GeBlobScreen(this.owner, this.name, this.sha, this.path);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<String>(
      title: AppBarTitle(S.of(context).file),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final res = await auth.fetchGitee('/repos/$owner/$name/git/blobs/$sha');
        return GiteeBlob.fromJson(res).content;
      },
      action: ActionEntry(iconData: Icons.settings, url: '/choose-code-theme'),
      bodyBuilder: (content, _) {
        return BlobView(path, base64Text: content);
      },
    );
  }
}
