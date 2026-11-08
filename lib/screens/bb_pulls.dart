import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';

class BbPullsScreen extends StatelessWidget {
  const BbPullsScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return ListStatefulScaffold<BbPulls, String?>(
      title: Text(AppLocalizations.of(context)!.pullRequests),
      fetch: (nextUrl) async {
        final res = await context.read<AuthModel>().fetchBbWithPage(
            nextUrl ?? '/repositories/$owner/$name/pullrequests');
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <BbPulls>[
            for (var v in res.items) BbPulls.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        final pullNumber =
            int.parse(v.pullRequestLink!.replaceFirst(RegExp(r'.*\/'), ''));
        return IssueItem(
          avatarUrl: v.author!.avatarUrl,
          author: v.author!.displayName,
          title: v.title,
          subtitle: '#$pullNumber',
          commentCount: 0,
          updatedAt: v.createdOn,
          url:
              '${auth.activeAccount!.domain}/$owner/$name/pull-requests/$pullNumber',
        );
      },
    );
  }
}
