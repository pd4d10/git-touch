import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/models/notification.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/event_item.dart';
import 'package:provider/provider.dart';

class GhNewsScreen extends StatefulWidget {
  @override
  GhNewsScreenState createState() => GhNewsScreenState();
}

class GhNewsScreenState extends State<GhNewsScreen> {
  @override
  initState() {
    super.initState();
    Future.microtask(() async {
      // Check if there are unread notification items.
      // 1 item is enough since count is not displayed for now.
      final items = await context
          .read<AuthModel>()
          .ghClient
          .getJSON('/notifications?per_page=1');

      if (items is List && items.isNotEmpty) {
        context.read<NotificationModel>().setCount(1);
      }
    });
  }

  @override
  Widget build(context) {
    return ListStatefulScaffold<GithubEvent, int>(
      title: Text(AppLocalizations.of(context)!.news),
      itemBuilder: (payload) => EventItem(payload),
      fetch: (page) async {
        page = page ?? 1;
        final auth = context.read<AuthModel>();
        final login = auth.activeAccount!.login;

        final events = await auth.ghClient.getJSON(
          '/users/$login/received_events?page=$page&per_page=$kPageSize',
          convert: (dynamic vs) => [for (var v in vs) GithubEvent.fromJson(v)],
        );
        return ListPayload(
          cursor: page + 1,
          hasMore: events.length == kPageSize,
          items: events,
        );
      },
    );
  }
}
