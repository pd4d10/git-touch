import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:provider/provider.dart';

class RhBlobScreen extends StatelessWidget {
  const RhBlobScreen(this.id, this.ref, {required this.path});
  final int id;
  final String ref;
  final String path;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<String>(
      title: Text(path),
      fetch: () async {
        final auth = context.read<AuthModel>();

        final params = <String, dynamic>{
          'repoid': id,
          'commit_id': ref,
          'file_path': path.urlencode,
          'details': 'full',
          'cache': false,
          'max_file_bytes': 50000
        };
        return auth
            .fetchRhodecode('get_repo_file', body: params)
            .onError<Error>(
          (e, s) {
            return null;
          },
        ).then((v) {
          return (v?['result']['content'] as String?) ?? '';
        });
      },
      action:
          const ActionEntry(iconData: Ionicons.cog, url: '/choose-code-theme'),
      bodyBuilder: (data, _) {
        return BlobView(path, text: data);
      },
    );
  }
}
