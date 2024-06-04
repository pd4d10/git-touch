import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/issue_icon.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({
    super.key,
    required this.payload,
    required this.markAsRead,
  });
  final GithubNotificationItem payload;
  final Function markAsRead;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  GithubNotificationItem get payload => widget.payload;
  bool loading = true;

  Widget _buildIcon(IconData data, [Color? color]) {
    return Icon(data, color: color, size: 20);
  }

  Widget _buildIconData() {
    switch (payload.subject!.type) {
      case 'Issue':
        switch (payload.state) {
          case 'OPEN':
            return const IssueIcon(IssueIconState.open, size: 20);
          case 'CLOSED':
            return const IssueIcon(IssueIconState.closed, size: 20);
          default:
            return _buildIcon(Octicons.person);
        }
      case 'PullRequest':
        switch (payload.state) {
          case 'OPEN':
            return const IssueIcon(IssueIconState.prOpen, size: 20);
          case 'CLOSED':
            return const IssueIcon(IssueIconState.prClosed, size: 20);
          case 'MERGED':
            return const IssueIcon(IssueIconState.prMerged, size: 20);
          default:
            return _buildIcon(Octicons.person);
        }
      // color: Color.fromRGBO(0x6f, 0x42, 0xc1, 1),
      case 'Release':
        return _buildIcon(Octicons.tag);
      case 'Commit':
        return _buildIcon(Octicons.git_commit);
      case 'CheckSuite':
        return _buildIcon(Octicons.x, GithubPalette.closed);
      default:
        return _buildIcon(Octicons.bell);
    }
  }

  Widget _buildCheckIcon() {
    return Icon(
      payload.unread! ? Ionicons.checkmark : Octicons.dot_fill,
      color: loading
          ? AntTheme.of(context).colorBox
          : AntTheme.of(context).colorWeak,
      size: 24,
    );
  }

  void _markAsRead() async {
    if (payload.unread! && !loading) {
      setState(() {
        loading = true;
      });
      try {
        await context
            .read<AuthModel>()
            .ghClient
            .activity
            .markThreadRead(payload.id!);
        widget.markAsRead();
      } finally {
        if (mounted) {
          setState(() {
            loading = true;
          });
        }
      }
    }
  }

  String? get _url {
    final fullName = payload.repository!.fullName;
    switch (payload.subject!.type) {
      case 'Issue':
        return '/github/$fullName/issues/${payload.subject!.number}';
      case 'PullRequest':
        return '/github/$fullName/pull/${payload.subject!.number}';
      case 'Release':
        return 'https://github.com/$fullName/releases';
      case 'Commit':
      case 'CheckSuite':
        return '/github/$fullName';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LinkWidget(
      url: _url,
      onTap: _markAsRead,
      child: Opacity(
        opacity: payload.unread! ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 8),
                child: _buildIconData(),
              ),
              Expanded(
                child: Text(
                  payload.subject!.title!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15, color: AntTheme.of(context).colorText),
                ),
              ),
              LinkWidget(onTap: _markAsRead, child: _buildCheckIcon()),
            ],
          ),
        ),
      ),
    );
  }
}
