import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:provider/provider.dart';

class GoIssuesScreen extends StatelessWidget {
  final String owner;
  final String name;
  final bool isPr;
  GoIssuesScreen(this.owner, this.name, {this.isPr = false});

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GogsIssue, int>(
      title: AppBarTitle(isPr
          ? AppLocalizations.of(context)!.pullRequests
          : AppLocalizations.of(context)!.issues),
      fetch: (page) async {
        final type = isPr ? 'pulls' : 'issues';
        final res = await context.read<AuthModel>().fetchGogsWithPage(
            '/repos/$owner/$name/issues?state=open&type=$type',
            page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: (res.data as List).map((v) => GogsIssue.fromJson(v)).toList(),
        );
      },
      actionBuilder: () => ActionEntry(
        iconData: isPr ? null : Octicons.plus,
        url: isPr
            ? '/gogs/$owner/$name/pulls/new' // TODO
            : '/gogs/$owner/$name/issues/new',
      ),
      itemBuilder: (p) => IssueItem(
        author: p.user!.username,
        avatarUrl: p.user!.avatarUrl,
        commentCount: p.comments,
        subtitle: '#' + p.number.toString(),
        title: p.title,
        updatedAt: p.updatedAt,
        url: isPr
            ? 'https://gogs.io' // TODO: PR endpoints are not supported in Gogs, htmlUrl prop non-existent
            : '/gogs/$owner/$name/issues/${p.number}',
        labels: isPr
            ? null
            : p.labels!.isEmpty
                ? null
                : Wrap(spacing: 4, runSpacing: 4, children: [
                    for (var label in p.labels!)
                      MyLabel(name: label.name, cssColor: label.color)
                  ]),
      ),
    );
  }
}
