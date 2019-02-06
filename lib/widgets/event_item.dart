import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/screens.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

/// Events types:
///
/// https://developer.github.com/v3/activity/events/types/#event-types--payloads
class EventItem extends StatelessWidget {
  final Event event;
  EventItem(this.event);

  TextSpan _buildEvent(BuildContext context) {
    switch (event.type) {
      case 'IssuesEvent':
        return TextSpan(children: [
          TextSpan(text: ' ${event.payload['action']} issue '),
          _buildIssue(context),
          TextSpan(text: ' at '),
          _buildRepo(context),
        ]);
      case 'PushEvent':
        return TextSpan(children: [
          TextSpan(text: ' pushed to '),
          TextSpan(
            text: event.payload['ref'],
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
          TextSpan(text: ' at '),
          _buildRepo(context),
          TextSpan(text: '')
        ]);
      case 'PullRequestEvent':
        return TextSpan(children: [
          TextSpan(text: ' ${event.payload['action']} pull request '),
          _buildPullRequest(context, event.payload['pull_request']['number']),
          TextSpan(text: ' at '),
          _buildRepo(context),
        ]);
      case 'PullRequestReviewCommentEvent':
        return TextSpan(children: [
          TextSpan(text: ' reviewed pull request '),
          _buildPullRequest(context, event.payload['pull_request']['number']),
          TextSpan(text: ' at '),
          _buildRepo(context),
        ]);
      case 'WatchEvent':
        return TextSpan(children: [
          TextSpan(text: ' ${event.payload['action']} '),
          _buildRepo(context)
        ]);
      case 'IssueCommentEvent':
        bool isIssue = event.payload['issue']['pull_request'] == null;
        String resource = isIssue ? 'issue' : 'pull request';
        TextSpan link = isIssue
            ? _buildIssue(context)
            : _buildPullRequest(context, event.payload['issue']['number']);

        return TextSpan(children: [
          TextSpan(text: ' commented on $resource '),
          link,
          TextSpan(text: ' at '),
          _buildRepo(context),
          // TextSpan(text: event.payload['comment']['body'])
        ]);
      case 'ForkEvent':
        return TextSpan(children: [
          TextSpan(text: ' forked '),
          createRepoLinkSpan(context, event.payload['forkee']['owner']['login'],
              event.payload['forkee']['name']),
          TextSpan(text: ' from '),
          _buildRepo(context),
        ]);
      default:
        return TextSpan(
          text: 'Type ${event.type} Not implement yet',
          style: TextStyle(color: CupertinoColors.destructiveRed),
        );
    }
  }

  String _buildDetail() {
    switch (event.type) {
      case 'IssueCommentEvent':
        return event.payload['comment']['body'];
      case 'IssuesEvent':
        return event.payload['issue']['title'];
      case 'PullRequestEvent':
        return event.payload['pull_request']['title'];
      case 'PullRequestReviewCommentEvent':
        return event.payload['comment']['body'];
      default:
        return '';
    }
  }

  TextSpan _buildRepo(BuildContext context) {
    String name = event.repo.name;
    var arr = name.split('/');
    return createRepoLinkSpan(context, arr[0], arr[1]);
  }

  TextSpan _buildIssue(BuildContext context) {
    int id = event.payload['issue']['number'];
    String name = event.repo.name;
    var arr = name.split('/');
    return createLinkSpan(
        context, '#' + id.toString(), () => IssueScreen(id, arr[0], arr[1]));
  }

  TextSpan _buildPullRequest(BuildContext context, int id) {
    String name = event.repo.name;
    var arr = name.split('/');
    return createLinkSpan(context, '#' + id.toString(),
        () => PullRequestScreen(id, arr[0], arr[1]));
  }

  IconData _buildIconData(BuildContext context) {
    switch (event.type) {
      case 'IssueCommentEvent':
        return Octicons.comment_discussion;
      case 'IssuesEvent':
        return Octicons.issue_opened;
      case 'PullRequestEvent':
        return Octicons.git_pull_request;
      case 'PushEvent':
        return Octicons.repo_push;
      case 'WatchEvent':
        return Octicons.star;
      case 'ForkEvent':
        return Octicons.repo_forked;
      default:
        return Octicons.octoface;
    }
  }

  @override
  build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Avatar(login: event.actor.login, url: event.actor.avatarUrl),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      height: 1.3,
                      fontSize: 15,
                    ),
                    children: <TextSpan>[
                      createLinkSpan(context, event.actor.login,
                          () => UserScreen(event.actor.login)),
                      _buildEvent(context),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Icon(
                _buildIconData(context),
                color: CupertinoColors.inactiveGray,
                size: 22,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 46, top: 6),
            child: Text(
              _buildDetail(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.2,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
