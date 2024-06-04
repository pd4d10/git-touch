import 'package:flutter/widgets.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/hex_color_tag.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:provider/provider.dart';

class GePullsScreen extends StatelessWidget {
  const GePullsScreen(this.owner, this.name, {this.isPr = true});
  final String owner;
  final String name;
  final bool isPr;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GiteePull, int>(
      title: Text(isPr ? 'Pull Requests' : 'Issues'),
      fetch: (page) async {
        final res = await context
            .read<AuthModel>()
            .fetchGiteeWithPage('/repos/$owner/$name/pulls', page: page);
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: [for (var v in res.data) GiteePull.fromJson(v)],
        );
      },
      itemBuilder: (p) => IssueItem(
        author: p.user!.login,
        avatarUrl: p.user!.avatarUrl,
        commentCount: 0, // fix this
        subtitle: '#${p.number}',
        title: p.title,
        updatedAt: DateTime.parse(p.updatedAt!),
        url: '/gitee/$owner/$name/pulls/${p.number}',
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
