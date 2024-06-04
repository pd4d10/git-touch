import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/hex_color_tag.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';

class GeIssuesScreen extends StatelessWidget {
  const GeIssuesScreen(this.owner, this.name, {this.isPr = true});
  final String owner;
  final String name;
  final bool isPr;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteeIssue, int>(
      title: Text(isPr ? 'Pull Requests' : 'Issues'),
      fetch: (page) async {
        final res = await context
            .read<AuthModel>()
            .fetchGiteeWithPage('/repos/$owner/$name/issues', page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GiteeIssue.fromJson(v)],
        );
      },
      actionBuilder: () => ActionEntry(
        iconData: Octicons.plus,
        url: '/gitee/$owner/$name/issues/new',
      ),
      itemBuilder: (p) => IssueItem(
        author: p.user!.login,
        avatarUrl: p.user!.avatarUrl,
        commentCount: p.comments,
        subtitle: '#${p.number!}',
        title: p.title,
        updatedAt: DateTime.parse(p.updatedAt!),
        url: '/gitee/$owner/$name/issues/${p.number}',
        labels: p.labels!.isEmpty
            ? null
            : Wrap(spacing: 4, runSpacing: 4, children: [
                for (var label in p.labels!)
                  HexColorTag(name: label.name!, color: label.color!)
              ]),
      ),
    );
  }
}
