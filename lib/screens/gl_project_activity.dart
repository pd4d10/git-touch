import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class GlProjectActivityScreen extends StatelessWidget {
  final int id;
  GlProjectActivityScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return ListStatefulScaffold<GitlabEvent, int>(
      title: AppBarTitle(S.of(context).activity),
      fetch: (page) async {
        page = page ?? 1;
        final auth = context.read<AuthModel>();
        final vs = await auth.fetchGitlab('/projects/$id/events');
        final events =
            (vs as List).map((v) => GitlabEvent.fromJson(v)).toList();
        return ListPayload(cursor: page, items: events, hasMore: false);
      },
      itemBuilder: (data) {
        return Link(
          url: '',
          child: Container(
            padding: CommonStyle.padding,
            child: Row(
              children: <Widget>[
                Avatar(url: data.author.avatarUrl),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: data.author.name,
                              style: TextStyle(
                                color: theme.palette.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                                text: ' ' + data.actionName + data.targetType),
                          ],
                        ),
                      ),
                      Text(data.note.body)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
