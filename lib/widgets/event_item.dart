import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/widgets/action_button.dart';
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

  static const linkStyle = TextStyle(
    color: PrimerColors.blue500,
    fontWeight: FontWeight.w600,
  );

  TextSpan _buildRepo(BuildContext context) {
    final ls = event.repoFullName.split('/');
    assert(ls.length == 2);
    final owner = ls[0];
    final name = ls[1];
    return TextSpan(text: '$owner/$name', style: linkStyle);
  }

  TextSpan _buildIssue(BuildContext context, {@required int number}) {
    // var resource = isPullRequest ? 'pull_request' : 'issue';
    // int number = event.payload['issue']['number'];

    return TextSpan(text: '#$number', style: linkStyle);
  }

  Widget _buildItem({
    @required BuildContext context,
    @required List<InlineSpan> spans,
    String detail,
    Widget detailWidget,
    IconData iconData = Octicons.octoface,
    WidgetBuilder screenBuilder,
    String url,
    List<ActionItem> actionItems,
  }) {
    if (detailWidget == null && detail != null) {
      detailWidget =
          Text(detail.trim(), overflow: TextOverflow.ellipsis, maxLines: 5);
    }

    return Link(
      screenBuilder: screenBuilder,
      url: url,
      onLongPress: () async {
        if (actionItems == null) return;

        final value = await showCupertinoModalPopup<int>(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              title: Text('Actions'),
              actions: actionItems.asMap().entries.map((entry) {
                return CupertinoActionSheetAction(
                  child: Text(entry.value.text),
                  onPressed: () {
                    Navigator.pop(context, entry.key);
                  },
                );
              }).toList(),
              cancelButton: CupertinoActionSheetAction(
                child: const Text('Cancel'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        );

        if (value != null) {
          actionItems[value].onPress(context);
        }
      },
      child: Container(
        padding: CommonStyle.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Link(
                  child: Avatar.medium(url: event.actorAvatarUrl),
                  screenBuilder: (_) => UserScreen(event.actorLogin),
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
                            TextSpan(text: event.actorLogin, style: linkStyle),
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
        final forkeeOwner = event.payload['forkee']['owner']['login'] as String;
        final forkeeName = event.payload['forkee']['name'] as String;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' forked '),
            TextSpan(text: '$forkeeOwner/$forkeeName', style: linkStyle),
            TextSpan(text: ' from '),
            _buildRepo(context),
          ],
          iconData: Octicons.repo_forked,
          screenBuilder: (_) => RepositoryScreen(forkeeOwner, forkeeName),
          actionItems: [
            ActionItem.user(event.actorLogin),
            ActionItem.user(forkeeOwner),
            ActionItem.repository(forkeeOwner, forkeeName),
          ],
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
        final isPullRequest = event.payload['issue']['pull_request'] != null;
        final resource = isPullRequest ? 'pull request' : 'issue';
        final number = event.payload['issue']['number'] as int;
        final ls = event.repoFullName.split('/');
        assert(ls.length == 2);
        final owner = ls[0];
        final name = ls[1];

        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' commented on $resource '),
            _buildIssue(context, number: number),
            TextSpan(text: ' at '),
            _buildRepo(context),
            // TextSpan(text: event.payload['comment']['body'])
          ],
          detail: event.payload['comment']['body'],
          iconData: Octicons.comment_discussion,
          screenBuilder: (_) => IssueScreen(
            owner: owner,
            name: name,
            number: number,
            isPullRequest: isPullRequest,
          ),
          actionItems: [
            ActionItem.user(event.actorLogin),
            ActionItem.user(owner),
            ActionItem.repository(owner, name),
            ActionItem.issue(owner, name, number),
          ],
        );
      case 'IssuesEvent':
        final action = event.payload['action'];
        final number = event.payload['issue']['number'] as int;
        final ls = event.repoFullName.split('/');
        assert(ls.length == 2);
        final owner = ls[0];
        final name = ls[1];

        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' $action issue '),
            _buildIssue(context, number: number),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          iconData: Octicons.issue_opened,
          detail: event.payload['issue']['title'],
          screenBuilder: (_) => IssueScreen(
            owner: owner,
            name: name,
            number: number,
          ),
          actionItems: [
            ActionItem.user(event.actorLogin),
            ActionItem.user(owner),
            ActionItem.repository(owner, name),
            ActionItem.issue(owner, name, number),
          ],
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
        final action = event.payload['action'];
        final number = event.payload['pull_request']['number'] as int;
        final ls = event.repoFullName.split('/');
        assert(ls.length == 2);
        final owner = ls[0];
        final name = ls[1];

        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' $action pull request '),
            _buildIssue(context, number: number),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          iconData: Octicons.git_pull_request,
          detail: event.payload['pull_request']['title'],
          screenBuilder: (_) => IssueScreen(
            owner: owner,
            name: name,
            number: number,
            isPullRequest: true,
          ),
          actionItems: [
            ActionItem.user(event.actorLogin),
            ActionItem.user(owner),
            ActionItem.repository(owner, name),
            ActionItem.issue(owner, name, number),
          ],
        );
      case 'PullRequestReviewEvent':
        // TODO:
        return defaultItem;
      case 'PullRequestReviewCommentEvent':
        final number = event.payload['pull_request']['number'] as int;
        final ls = event.repoFullName.split('/');
        assert(ls.length == 2);
        final owner = ls[0];
        final name = ls[1];

        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' reviewed pull request '),
            _buildIssue(context, number: number),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          detail: event.payload['comment']['body'],
          screenBuilder: (_) => IssueScreen(
            owner: owner,
            name: name,
            number: number,
            isPullRequest: true,
          ),
          actionItems: [
            ActionItem.user(event.actorLogin),
            ActionItem.user(owner),
            ActionItem.repository(owner, name),
            ActionItem.issue(owner, name, number),
          ],
        );
      case 'PushEvent':
        final ref = event.payload['ref'] as String;
        final commits = event.payload['commits'] as List;
        final ls = event.repoFullName.split('/');
        assert(ls.length == 2);
        final owner = ls[0];
        final name = ls[1];

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
          actionItems: [
            ActionItem.user(event.actorLogin),
            ActionItem.user(owner),
            ActionItem.repository(owner, name),
          ],
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
        final ls = event.repoFullName.split('/');
        assert(ls.length == 2);
        final owner = ls[0];
        final name = ls[1];

        return _buildItem(
          context: context,
          spans: [TextSpan(text: ' starred '), _buildRepo(context)],
          iconData: Octicons.star,
          screenBuilder: (_) => RepositoryScreen(owner, name),
          actionItems: [
            ActionItem.user(event.actorLogin),
            ActionItem.user(owner),
            ActionItem.repository(owner, name),
          ],
        );
      default:
        return defaultItem;
    }
  }
}
