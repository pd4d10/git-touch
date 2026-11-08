import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:provider/provider.dart';

class GeBlobScreen extends StatelessWidget {
  const GeBlobScreen(this.owner, this.name, this.sha, this.path);
  final String owner;
  final String name;
  final String sha;
  final String path;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<String?>(
      title: Text(AppLocalizations.of(context)!.file),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final res = await auth.fetchGitee('/repos/$owner/$name/git/blobs/$sha');
        return GiteeBlob.fromJson(res).content;
      },
      action:
          const ActionEntry(iconData: Ionicons.cog, url: '/choose-code-theme'),
      bodyBuilder: (content, _) {
        return BlobView(path, base64Text: content);
      },
    );
  }
}
