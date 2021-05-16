import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/entry_item.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:git_touch/widgets/user_header.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class GoUserScreen extends StatelessWidget {
  final String login;
  final bool isViewer;
  GoUserScreen(this.login, {this.isViewer = false});

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

        return Tuple2(GogsUser.fromJson(res[0]),
            [for (var repo in res[1].data) GogsRepository.fromJson(repo)]);
      },
      action: isViewer
          ? ActionEntry(
              iconData: Ionicons.cog,
              url: '/settings',
            )
          : null,
      bodyBuilder: (p, _) {
        final user = p.item1;
        final repos = p.item2;
        if (p.item1 != null) {
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
              TableView(
                hasIcon: true,
                items: [
                  TableViewItem(
                    leftIconData: Octicons.home,
                    text: Text('Organizations'),
                    url:
                        '/gogs/${user.username}?tab=organizations&isViewer=$isViewer',
                  ),
                ],
              ),
              CommonStyle.border,
              Column(
                children: <Widget>[
                  for (var v in repos) ...[
                    RepositoryItem.go(
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
        } else {
          return Text('404'); // TODO:
        }
      },
    );
  }
}
