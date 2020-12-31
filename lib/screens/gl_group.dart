import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../generated/l10n.dart';

class GlGroupScreen extends StatelessWidget {
  final int id;
  GlGroupScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GitlabGroup, int>>(
      title: Text(S.of(context).group),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final res = await Future.wait([
          auth.fetchGitlab('/groups/$id'),
          auth.fetchGitlabWithPage('/groups/$id/members?per_page=1')
        ]);
        return Tuple2(
          GitlabGroup.fromJson(res[0]),
          (res[1] as DataWithPage).total,
        );
      },
      bodyBuilder: (data, _) {
        final p = data.item1;
        return Column(
          children: <Widget>[
            UserHeader(
              login: p.path,
              avatarUrl: p.avatarUrl,
              name: p.name,
              createdAt: null,
              bio: p.description,
            ),
            CommonStyle.border,
            Row(children: [
              EntryItem(
                count: data.item2,
                text: 'Members',
                url: '/gitlab/groups/$id/members',
              ),
            ]),
            CommonStyle.border,
            Column(
              children: <Widget>[
                for (var v in p.projects)
                  RepositoryItem.gl(
                    payload: v,
                    note: 'Updated ${timeago.format(v.lastActivityAt)}',
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
