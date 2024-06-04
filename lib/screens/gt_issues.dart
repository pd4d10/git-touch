import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/hex_color_tag.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';

class GtIssuesScreen extends StatelessWidget {
  const GtIssuesScreen(this.owner, this.name, {this.isPr = true});
  final String owner;
  final String name;
  final bool isPr;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaIssue, int>(
      title: Text(isPr
          ? AppLocalizations.of(context)!.pullRequests
          : AppLocalizations.of(context)!.issues),
      fetch: (page) async {
        final type = isPr ? 'pulls' : 'issues';
        final res = await context.read<AuthModel>().fetchGiteaWithPage(
            '/repos/$owner/$name/issues?state=open&type=$type',
            page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: (res.data as List).map((v) => GiteaIssue.fromJson(v)).toList(),
        );
      },
      actionBuilder: () => ActionEntry(
        iconData: isPr ? null : Octicons.plus,
        url: isPr
            ? '/gitea/$owner/$name/pulls/new'
            : '/gitea/$owner/$name/issues/new',
      ),
      itemBuilder: (p) => IssueItem(
        author: p.user!.login,
        avatarUrl: p.user!.avatarUrl,
        commentCount: p.comments,
        subtitle: '#${p.number}',
        title: p.title,
        updatedAt: p.updatedAt,
        url: isPr
            ? p.htmlUrl // TODO: PR endpoints are not complete in Gitea
            : '/gitea/$owner/$name/issues/${p.number}',
        labels: isPr
            ? null
            : p.labels!.isEmpty
                ? null
                : Wrap(spacing: 4, runSpacing: 4, children: [
                    for (var label in p.labels!)
                      HexColorTag(name: label.name!, color: label.color!)
                  ]),
      ),
    );
  }
}
