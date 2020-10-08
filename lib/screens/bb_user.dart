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

class BbUserScreen extends StatelessWidget {
  final String login;
  final bool isTeam;
  BbUserScreen(this.login, {this.isTeam = false});
  bool get isViewer => login == null;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final _accountId = auth.activeAccount.accountId;
    final _login = login ?? auth.activeAccount.login;
    return RefreshStatefulScaffold<Tuple2<BbUser, Iterable<BbRepo>>>(
      title: Text(isViewer
          ? 'Me'
          : isTeam
              ? 'Team'
              : 'User'),
      fetch: () async {
        final res = await Future.wait([
          auth.fetchBbJson('/${isTeam ? 'teams' : 'users'}/$_accountId'),
          auth.fetchBbWithPage('/repositories/$_login'),
        ]);
        return Tuple2(
          BbUser.fromJson(res[0]),
          [
            for (var v in (res[1] as BbPagePayload<List>).data)
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
              login: _login,
              avatarUrl: user.avatarUrl,
              name: user.displayName,
              createdAt: user.createdOn,
              isViewer: isViewer,
              bio: null,
            ),
            CommonStyle.border,
            Column(
              children: <Widget>[
                for (var v in repos) RepositoryItem.bb(payload: v)
              ],
            )
          ],
        );
      },
    );
  }
}
