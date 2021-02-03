import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class GoOrgsScreen extends StatelessWidget {
  final String api;
  final bool isViewer;
  // TODO: implement list of orgs screen when API is available
  GoOrgsScreen.ofUser(String login, {this.isViewer})
      : api = isViewer ? '/users/$login/orgs' : '/user/orgs';

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<List<GogsOrg>>(
      title: AppBarTitle(AppLocalizations.of(context).organizations),
      fetch: () async {
        final res = await context.read<AuthModel>().fetchGogs(api);
        return [for (var v in res) GogsOrg.fromJson(v)];
      },
      bodyBuilder: (p, _) {
        return Column(
          children: [
            for (var org in p) ...[
              UserItem.gogs(
                avatarUrl: org.avatarUrl,
                login: org.username,
                name: org.fullName,
                bio: Text(org.description ?? org.website ?? org.location),
              ),
              CommonStyle.border,
            ]
          ],
        );
      },
    );
  }
}
