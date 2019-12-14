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

class GitlabProjectActivity extends StatelessWidget {
  final int id;

  GitlabProjectActivity(this.id);

  Future<ListPayload<GitlabEvent, int>> _query(BuildContext context,
      [int page]) async {
    final auth = Provider.of<AuthModel>(context);
    final vs = await auth.fetchGitlab('/projects/$id/events');
    final events = (vs as List).map((v) => GitlabEvent.fromJson(v)).toList();
    return ListPayload(cursor: page, items: events, hasMore: false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return ListStatefulScaffold<GitlabEvent, int>(
      title: AppBarTitle('Activity'),
      onRefresh: () => _query(context),
      onLoadMore: (int page) => _query(context, page),
      itemBuilder: (data) {
        return Link(
          url: '',
          child: Container(
            padding: CommonStyle.padding,
            child: Row(
              children: <Widget>[
                Avatar.medium(url: data.author.avatarUrl),
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
