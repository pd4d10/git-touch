import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class BbUserScreen extends StatelessWidget {
  final String login;
  BbUserScreen(this.login);
  bool get isViewer => login == null;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<BbUser, Iterable<BbRepo>>>(
      title: Text(isViewer ? 'Me' : 'User'),
      fetchData: () async {
        final auth = Provider.of<AuthModel>(context);
        final _login = login ?? auth.activeAccount.login;
        final res = await Future.wait([
          auth.fetchBb('/users/$_login'),
          auth.fetchBbWithPage('/repositories/$_login'),
        ]);
        return Tuple2(
          BbUser.fromJson(res[0]),
          [
            for (var v in (res[1] as DataWithPage<List>).data)
              BbRepo.fromJson(v)
          ],
        );
      },
      action: isViewer
          ? ActionEntry(
              iconData: Icons.settings,
              url: '/settings',
            )
          : null,
      bodyBuilder: (data, _) {
        final user = data.item1;
        final repos = data.item2;
        return Column(
          children: <Widget>[
            UserHeader(
              login: user.displayName,
              avatarUrl: user.avatarUrl,
              name: user.nickname,
              createdAt: user.createdOn,
              bio: null,
            ),
            CommonStyle.border,
            Column(
              children: <Widget>[
                for (var v in repos)
                  RepositoryItem(
                    owner: v.owner.displayName,
                    name: v.name,
                    url: '/bitbucket/${v.fullName}',
                    avatarUrl: v.avatarUrl,
                    avatarLink: '/bitbucket/${v.owner.displayName}',
                    note: 'Updated ${timeago.format(v.updatedOn)}',
                    description: v.description,
                    forkCount: 0,
                    starCount: 0,
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
