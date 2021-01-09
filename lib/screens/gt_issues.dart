import 'package:flutter/material.dart';
import 'package:git_touch/generated/l10n.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:provider/provider.dart';

class GtIssuesScreen extends StatelessWidget {
  final String owner;
  final String name;
  final bool isPr;
  GtIssuesScreen(this.owner, this.name, {this.isPr = false});

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteaIssue, int>(
      title:
          AppBarTitle(isPr ? S.of(context).pullRequests : S.of(context).issues),
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
        author: p.user.login,
        avatarUrl: p.user.avatarUrl,
        commentCount: p.comments,
        subtitle: '#' + p.number.toString(),
        title: p.title,
        updatedAt: p.updatedAt,
        url: isPr
            ? p.htmlUrl // TODO: PR endpoints are not complete in Gitea
            : '/gitea/$owner/$name/issues/${p.number}',
        labels: isPr
            ? null
            : p.labels.isEmpty
                ? null
                : Wrap(spacing: 4, runSpacing: 4, children: [
                    for (var label in p.labels)
                      MyLabel(name: label.name, cssColor: label.color)
                  ]),
      ),
    );
  }
}
