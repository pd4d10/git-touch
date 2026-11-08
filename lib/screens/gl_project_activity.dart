import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

class GlProjectActivityScreen extends StatelessWidget {
  const GlProjectActivityScreen(this.id);
  final int id;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabEvent, int>(
      title: Text(AppLocalizations.of(context)!.activity),
      fetch: (page) async {
        page = page ?? 1;
        final auth = context.read<AuthModel>();
        final vs = await auth.fetchGitlab('/projects/$id/events');
        final events =
            (vs as List).map((v) => GitlabEvent.fromJson(v)).toList();
        return ListPayload(cursor: page, items: events, hasMore: false);
      },
      itemBuilder: (data) {
        return LinkWidget(
          url: '',
          child: Container(
            padding: CommonStyle.padding,
            child: Row(
              children: <Widget>[
                Avatar(url: data.author!.avatarUrl),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: data.author!.name,
                              style: TextStyle(
                                color: AntTheme.of(context).colorPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                                text:
                                    ' ${data.actionName!}${data.targetType!}'),
                          ],
                        ),
                      ),
                      Text(data.note!.body!)
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
