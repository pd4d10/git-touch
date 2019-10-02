import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:primer/primer.dart';
import '../screens/issue.dart';
import '../screens/user.dart';
import 'avatar.dart';
import '../widgets/link.dart';
import '../utils/utils.dart';

class EventPayload {
  String actorLogin;
  String actorAvatarUrl;
  String type;
  String repoFullName;
  Map<String, dynamic> payload;
  DateTime createdAt;

  EventPayload.fromJson(input) {
    actorLogin = input['actor']['login'];
    actorAvatarUrl = input['actor']['avatar_url'];
    type = input['type'];
    payload = input['payload'];
    repoFullName = input['repo']['name'];
    createdAt = DateTime.parse(input['created_at']);
  }
}

class EventItem extends StatelessWidget {
  final EventPayload event;

  EventItem(this.event);

  TextSpan _buildRepo(BuildContext context) {
    String name = event.repoFullName;
    var arr = name.split('/');
    return createRepoLinkSpan(context, arr[0], arr[1]);
  }

  TextSpan _buildIssue(BuildContext context,
      {@required int number, bool isPullRequest = false}) {
    // var resource = isPullRequest ? 'pull_request' : 'issue';
    // int number = event.payload['issue']['number'];

    return createLinkSpan(
      context,
      '#' + number.toString(),
      (_) => IssueScreen.fromFullName(
        number: number,
        fullName: event.repoFullName,
        isPullRequest: isPullRequest,
      ),
    );
  }

  Widget _buildItem({
    @required BuildContext context,
    @required List<InlineSpan> spans,
    String detail,
    Widget detailWidget,
    IconData iconData = Octicons.octoface,
    WidgetBuilder screenBuilder,
    String url,
  }) {
    if (detailWidget == null && detail != null) {
      detailWidget =
          Text(detail.trim(), overflow: TextOverflow.ellipsis, maxLines: 5);
    }

    return Link(
      screenBuilder: screenBuilder,
      url: url,
      child: Container(
        padding: CommonStyle.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Avatar.medium(
                  url: event.actorAvatarUrl,
                  login: event.actorLogin,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: join(SizedBox(height: 8), [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: PrimerColors.gray900,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            createLinkSpan(
                              context,
                              event.actorLogin,
                              (_) => UserScreen(event.actorLogin),
                            ),
                            ...spans,
                          ],
                        ),
                      ),
                      if (detailWidget != null)
                        DefaultTextStyle(
                          style: TextStyle(
                              color: PrimerColors.gray900, fontSize: 14),
                          child: detailWidget,
                        ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(iconData, color: PrimerColors.gray500, size: 14),
                          SizedBox(width: 4),
                          Text(timeago.format(event.createdAt),
                              style: TextStyle(
                                fontSize: 13,
                                color: PrimerColors.gray500,
                              ))
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  build(BuildContext context) {
    var defaultItem = _buildItem(
      context: context,
      spans: [
        TextSpan(
          text: ' ' + event.type,
          style: TextStyle(color: PrimerColors.blue500),
        )
      ],
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
          screenBuilder: (_) => RepositoryScreen(
              event.payload['forkee']['owner']['login'],
              event.payload['forkee']['name']),
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
        bool isPullRequest = event.payload['issue']['pull_request'] != null;
        String resource = isPullRequest ? 'pull request' : 'issue';
        int number = event.payload['issue']['number'];

        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' commented on $resource '),
            _buildIssue(
              context,
              number: number,
              isPullRequest: isPullRequest,
            ),
            TextSpan(text: ' at '),
            _buildRepo(context),
            // TextSpan(text: event.payload['comment']['body'])
          ],
          detail: event.payload['comment']['body'],
          iconData: Octicons.comment_discussion,
          screenBuilder: (_) => IssueScreen.fromFullName(
            number: number,
            fullName: event.repoFullName,
            isPullRequest: isPullRequest,
          ),
        );
      case 'IssuesEvent':
        int number = event.payload['issue']['number'];

        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${event.payload['action']} issue '),
            _buildIssue(context, number: number),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          iconData: Octicons.issue_opened,
          detail: event.payload['issue']['title'],
          screenBuilder: (_) => IssueScreen.fromFullName(
            number: number,
            fullName: event.repoFullName,
          ),
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
            _buildIssue(context,
                number: event.payload['number'], isPullRequest: true),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          iconData: Octicons.git_pull_request,
          detail: event.payload['pull_request']['title'],
          screenBuilder: (_) => IssueScreen.fromFullName(
            number: event.payload['pull_request']['number'],
            fullName: event.repoFullName,
            isPullRequest: true,
          ),
        );
      case 'PullRequestReviewEvent':
        // TODO:
        return defaultItem;
      case 'PullRequestReviewCommentEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' reviewed pull request '),
            _buildIssue(context,
                number: event.payload['pull_request']['number'],
                isPullRequest: true),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          detail: event.payload['comment']['body'],
          screenBuilder: (_) => IssueScreen.fromFullName(
            number: event.payload['pull_request']['number'],
            fullName: event.repoFullName,
            isPullRequest: true,
          ),
        );
      case 'PushEvent':
        var ref = event.payload['ref'] as String;
        var commits = event.payload['commits'] as List;

        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' pushed to '),
            WidgetSpan(
              child: PrimerBranchName(ref.replaceFirst('refs/heads/', '')),
            ),
            TextSpan(text: ' at '),
            _buildRepo(context)
          ],
          iconData: Octicons.repo_push,
          detailWidget: Column(
            children: commits.map((commit) {
              return Row(
                children: <Widget>[
                  Text(
                    (commit['sha'] as String).substring(0, 7),
                    style: TextStyle(
                      color: PrimerColors.blue500,
                      fontSize: 13,
                      fontFamily: CommonStyle.monospace,
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      commit['message'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              );
            }).toList(),
          ),
          url: 'https://github.com/' +
              event.repoFullName +
              '/compare/' +
              event.payload['before'] +
              '...' +
              event.payload['head'],
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
          spans: [TextSpan(text: ' starred '), _buildRepo(context)],
          iconData: Octicons.star,
          screenBuilder: (_) =>
              RepositoryScreen.fromFullName(event.repoFullName),
        );
      default:
        return defaultItem;
    }
  }
}
