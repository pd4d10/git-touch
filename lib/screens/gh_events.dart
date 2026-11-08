import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/event_item.dart';
import 'package:provider/provider.dart';

class GhEventsScreen extends StatelessWidget {
  const GhEventsScreen(this.login);
  final String login;

  @override
  Widget build(context) {
    return ListStatefulScaffold<GithubEvent, int>(
      title: Text(AppLocalizations.of(context)!.events),
      itemBuilder: (payload) => EventItem(payload),
      fetch: (page) async {
        page = page ?? 1;
        final events = await context.read<AuthModel>().ghClient.getJSON(
            '/users/$login/events?page=$page&per_page=$kPageSize',
            convert: (dynamic vs) =>
                [for (var v in vs) GithubEvent.fromJson(v)]);
        return ListPayload(
          cursor: page + 1,
          hasMore: events.length == kPageSize,
          items: events,
        );
      },
    );
  }
}
