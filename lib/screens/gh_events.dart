import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/event_item.dart';
import 'package:git_touch/models/auth.dart';
import '../generated/l10n.dart';

class GhEventsScreen extends StatelessWidget {
  final String login;
  GhEventsScreen(this.login);

  @override
  Widget build(context) {
    return ListStatefulScaffold<GithubEvent, int>(
      title: AppBarTitle(S.of(context).events),
      itemBuilder: (payload) => EventItem(payload),
      fetch: (page) async {
        page = page ?? 1;
        final events = await context.read<AuthModel>().ghClient.getJSON(
            '/users/$login/events?page=$page&per_page=$pageSize',
            convert: (vs) => [for (var v in vs) GithubEvent.fromJson(v)]);
        return ListPayload(
          cursor: page + 1,
          hasMore: events.length == pageSize,
          items: events,
        );
      },
    );
  }
}
