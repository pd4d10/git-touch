import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/widgets/issue_icon.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/widgets/link.dart';

class NotificationItem extends StatefulWidget {
  final GithubNotificationItem payload;
  final Function markAsRead;

  NotificationItem({
    Key key,
    @required this.payload,
    @required this.markAsRead,
  }) : super(key: key);

  @override
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  GithubNotificationItem get payload => widget.payload;
  bool loading = false;

  Widget _buildIcon(IconData data, [Color color = Colors.black54]) {
    return Icon(data, color: color, size: 20);
  }

  Widget _buildIconData() {
    switch (payload.subject.type) {
      case 'Issue':
        switch (payload.state) {
          case 'OPEN':
            return IssueIcon(IssueIconState.open, size: 20);
          case 'CLOSED':
            return IssueIcon(IssueIconState.closed, size: 20);
          default:
            return _buildIcon(Octicons.person);
        }
        break;
      case 'PullRequest':
        switch (payload.state) {
          case 'OPEN':
            return IssueIcon(IssueIconState.prOpen, size: 20);
          case 'CLOSED':
            return IssueIcon(IssueIconState.prClosed, size: 20);
          case 'MERGED':
            return IssueIcon(IssueIconState.prMerged, size: 20);
          default:
            return _buildIcon(Octicons.person);
        }
        break;
      // color: Color.fromRGBO(0x6f, 0x42, 0xc1, 1),
      case 'Release':
        return _buildIcon(Octicons.tag);
      case 'Commit':
        return _buildIcon(Octicons.git_commit);
      default:
        Fimber.d('Unhandled notification type: ${payload.subject.type}');
        return _buildIcon(Octicons.octoface);
    }
  }

  Widget _buildCheckIcon() {
    return Icon(
      payload.unread ? Octicons.check : Octicons.primitive_dot,
      color: loading ? Colors.black12 : Colors.black45,
      size: 24,
    );
  }

  void _markAsRead() async {
    if (payload.unread && !loading) {
      setState(() {
        loading = true;
      });
      try {
        await Provider.of<AuthModel>(context)
            .patchWithCredentials('/notifications/threads/${payload.id}');
        widget.markAsRead();
      } finally {
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
      }
    }
  }

  String get _url {
    switch (payload.subject.type) {
      case 'Issue':
        return '/${payload.repository.owner}/${payload.repository.name}/issues/${payload.subject.number}';
      case 'PullRequest':
        return '/${payload.repository.owner}/${payload.repository.name}/pulls/${payload.subject.number}';
      case 'Release':
      // TODO: title
      // return 'https://github.com/${payload.repository.owner}/${payload.repository.name}/releases/tag/${payload.title}';
      case 'Commit':
        return '';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Link(
      url: _url,
      onTap: _markAsRead,
      child: Opacity(
        opacity: payload.unread ? 1 : 0.5,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 8),
                child: _buildIconData(),
              ),
              Expanded(
                child: Text(
                  payload.subject.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Link(child: _buildCheckIcon(), onTap: _markAsRead),
            ],
          ),
        ),
      ),
    );
  }
}
