import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/issue.dart';
import '../screens/pull_request.dart';
import '../screens/user.dart';
import 'link.dart';
import 'avatar.dart';
import '../utils/utils.dart';

class EventItem extends StatelessWidget {
  final Event event;
  EventItem(this.event);

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

  Widget _buildItem({
    @required BuildContext context,
    @required List<TextSpan> spans,
    String detail,
    IconData iconData = Octicons.octoface,
  }) {
    var _spans = [
      createLinkSpan(
          context, event.actor.login, () => UserScreen(event.actor.login))
    ];
    _spans.addAll(spans);

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
                        color: Colors.black, height: 1.3, fontSize: 15),
                    children: _spans,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Icon(iconData, color: Colors.black45, size: 22),
            ],
          ),
          detail == null
              ? Container()
              : Container(
                  padding: EdgeInsets.only(left: 46, top: 6),
                  child: Text(
                    detail,
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

  @override
  build(BuildContext context) {
    var defaultItem = _buildItem(
      context: context,
      spans: [TextSpan(text: ' This is a ' + event.type)],
      iconData: Octicons.octoface,
      detail: 'Woops, ${event.type} not implemented yet',
    );

    // all events types here:
    // https://developer.github.com/v3/activity/events/types/#event-types--payloads
    switch (event.type) {
      case 'CheckRunEvent':
      case 'CheckSuiteEvent':
      case 'CommitCommentEvent':
      case 'ContentReferenceEvent':
      case 'CreateEvent':
      case 'DeleteEvent':
      case 'DeploymentEvent':
      case 'DeploymentStatusEvent':
      case 'DownloadEvent':
      case 'FollowEvent':
        // TODO:
        return defaultItem;
      case 'ForkEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' forked '),
            createRepoLinkSpan(
                context,
                event.payload['forkee']['owner']['login'],
                event.payload['forkee']['name']),
            TextSpan(text: ' from '),
            _buildRepo(context),
          ],
          iconData: Octicons.repo_forked,
        );
      case 'ForkApplyEvent':
      case 'GitHubAppAuthorizationEvent':
      case 'GistEvent':
      case 'GollumEvent':
      case 'InstallationEvent':
      case 'InstallationRepositoriesEvent':
        // TODO:
        return defaultItem;
      case 'IssueCommentEvent':
        bool isIssue = event.payload['issue']['pull_request'] == null;
        String resource = isIssue ? 'issue' : 'pull request';
        TextSpan link = isIssue
            ? _buildIssue(context)
            : _buildPullRequest(context, event.payload['issue']['number']);

        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' commented on $resource '),
            link,
            TextSpan(text: ' at '),
            _buildRepo(context),
            // TextSpan(text: event.payload['comment']['body'])
          ],
          detail: event.payload['comment']['body'],
          iconData: Octicons.comment_discussion,
        );
      case 'IssuesEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${event.payload['action']} issue '),
            _buildIssue(context),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          iconData: Octicons.issue_opened,
          detail: event.payload['issue']['title'],
        );
      case 'LabelEvent':
      case 'MarketplacePurchaseEvent':
      case 'MemberEvent':
      case 'MembershipEvent':
      case 'MilestoneEvent':
      case 'OrganizationEvent':
      case 'OrgBlockEvent':
      case 'PageBuildEvent':
      case 'ProjectCardEvent':
      case 'ProjectColumnEvent':
      case 'ProjectEvent':
      case 'PublicEvent':
        // TODO:
        return defaultItem;
      case 'PullRequestEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${event.payload['action']} pull request '),
            _buildPullRequest(context, event.payload['pull_request']['number']),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          iconData: Octicons.git_pull_request,
          detail: event.payload['pull_request']['title'],
        );
      case 'PullRequestReviewEvent':
        // TODO:
        return defaultItem;
      case 'PullRequestReviewCommentEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' reviewed pull request '),
            _buildPullRequest(context, event.payload['pull_request']['number']),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          detail: event.payload['comment']['body'],
        );
      case 'PushEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' pushed to '),
            TextSpan(
              text: event.payload['ref'],
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
            TextSpan(text: ' at '),
            _buildRepo(context),
            TextSpan(text: '')
          ],
          iconData: Octicons.repo_push,
        );
      case 'ReleaseEvent':
      case 'RepositoryEvent':
      case 'RepositoryImportEvent':
      case 'RepositoryVulnerabilityAlertEvent':
      case 'SecurityAdvisoryEvent':
      case 'StatusEvent':
      case 'TeamEvent':
      case 'TeamAddEvent':
        // TODO:
        return defaultItem;
      case 'WatchEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${event.payload['action']} '),
            _buildRepo(context)
          ],
          iconData: Octicons.star,
        );
      default:
        return defaultItem;
    }
  }
}
