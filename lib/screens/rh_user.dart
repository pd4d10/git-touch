import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/rhodecode.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:timeago/timeago.dart' as timeago;

class RhUserScreen extends StatelessWidget {
  const RhUserScreen(this.id);
  final int? id;
  bool get isViewer => id == null;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<RhodecodeUser, Iterable<RhRepo>>>(
      title: Text(isViewer
          ? AppLocalizations.of(context)!.me
          : AppLocalizations.of(context)!.user),
      fetch: () async {
        final auth = context.read<AuthModel>();

        final res = await Future.wait([
          auth.fetchRhodecode(
              'get_user'),
          auth.fetchRhodecodeWithPage(
              'get_repos'),
        ]);

        return Tuple2(
          GetUserResponse.fromJson(res[0]).result!,
          [for (var v in res[1].data['result']) RhRepo.fromJson(v)],
        );
      },
      action: isViewer
          ? const ActionEntry(
              iconData: Ionicons.cog,
              url: '/settings',
            )
          : null,
      bodyBuilder: (data, _) {
        final user = data.item1;
        final projects = data.item2;

        return Column(
          children: <Widget>[
            UserHeader(
              login: user.username,
              avatarUrl: 'TODO', 
              name: '${user.firstName} ${user.lastName}',
              createdAt: DateTime.now(), // TODO
              bio: user.description,
              isViewer: isViewer,
            ),
            CommonStyle.border,
            Column(
              children: <Widget>[
                for (var v in projects)
                  RepoItem.rh(
                    payload: v,
                    note: 'Updated ${timeago.format(v.lastChangeset!.date!)}',
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
