import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';

class GoOrgsScreen extends StatelessWidget {
  // TODO: implement list of orgs screen when API is available
  const GoOrgsScreen.ofUser(String login, {required this.isViewer})
      : api = isViewer ? '/users/$login/orgs' : '/user/orgs';
  final String api;
  final bool isViewer;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<List<GogsOrg>>(
      title: Text(AppLocalizations.of(context)!.organizations),
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
                bio: Text(org.description ?? org.website ?? org.location!),
              ),
              CommonStyle.border,
            ]
          ],
        );
      },
    );
  }
}
