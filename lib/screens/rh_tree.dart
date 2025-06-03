import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/rhodecode.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/object_tree.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class RhTreeScreen extends StatelessWidget {
  const RhTreeScreen(this.id, this.branch, this.revision, {this.path});
  final int id;
  final String branch;
  final String revision;
  final String? path;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);

    return RefreshStatefulScaffold<List<RhodecodeTreeItem>>(
      title: Text(path ?? AppLocalizations.of(context)!.files),
      fetch: () async {
        final parameters = {
          'repoid': id,
          'revision': revision,
          'root_path': path ?? '/',
          'details': 'basic',
          'max_file_bytes': 5000
        };
        final res =
            await auth.fetchRhodecode('get_repo_nodes', body: parameters);
        final response = RhRepoNodesResponse.fromJson(res);
        final itemList = response.result!;
        return itemList;
      },
      bodyBuilder: (data, _) {
        return AntList(
          children: [
            for (var item in data)
              createObjectTreeItem(
                type: item.type,
                name: item.name,
                size: item.size,
                //downloadUrl: '', // TODO:
                url: item.type == 'dir'
                    ? '/rhodecode/repository/$id/tree/$branch?path=${item.name.urlencode}'
                    : item.type == 'file'
                        ? '/rhodecode/repository/$id/blob/$revision?path=${item.name.urlencode}'
                        : '',
              )
          ],
        );
      },
    );
  }
}
