import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GoUserScreen extends StatelessWidget {
  const GoUserScreen(this.login, {this.isViewer = true});
  final String login;
  final bool isViewer;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<Tuple2<GogsUser, List<GogsRepository>>>(
      title: Text(isViewer ? 'Me' : login),
      fetch: () async {
        final auth = context.read<AuthModel>();
        final res = await Future.wait([
          auth.fetchGogs(isViewer ? '/user' : '/users/$login'),
          auth.fetchGogsWithPage(
              isViewer ? '/user/repos' : '/users/$login/repos',
              limit: 6),
        ]);

        return Tuple2(GogsUser.fromJson(res[0]), [
          for (var repo in (res[1] as DataWithPage).data)
            GogsRepository.fromJson(repo)
        ]);
      },
      action: isViewer
          ? const ActionEntry(
              iconData: Ionicons.cog,
              url: '/settings',
            )
          : null,
      bodyBuilder: (p, _) {
        final user = p.item1;
        final repos = p.item2;
        return Column(
          children: <Widget>[
            UserHeader(
              login: user.username,
              avatarUrl: user.avatarUrl,
              name: user.fullName,
              createdAt:
                  null, // TODO: API response does not have this attribute
              isViewer: isViewer,
              bio: null, // TODO: API response does not have this attribute
            ),
            CommonStyle.border,
            Row(children: [
              EntryItem(
                text: 'Repositories',
                url: '/gogs/$login?tab=repositories&isViewer=$isViewer',
              ),
              EntryItem(
                text: 'Followers',
                url: '/gogs/$login?tab=followers',
              ),
              EntryItem(
                text: 'Following',
                url: '/gogs/$login?tab=following',
              ),
            ]),
            CommonStyle.border,
            AntList(
              children: [
                AntListItem(
                  prefix: const Icon(Octicons.home),
                  child: const Text('Organizations'),
                  onClick: () {
                    context.push(
                        '/gogs/${user.username}?tab=organizations&isViewer=$isViewer');
                  },
                ),
              ],
            ),
            CommonStyle.border,
            Column(
              children: <Widget>[
                for (var v in repos) ...[
                  RepoItem.go(
                    payload: v,
                    name: v.fullName!.split('/')[1],
                    owner: v.owner!.username,
                  ),
                  CommonStyle.border,
                ]
              ],
            ),
          ],
        );
      },
    );
  }
}
