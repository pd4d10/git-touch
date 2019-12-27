import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/issue_icon.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'avatar.dart';
import '../widgets/link.dart';
import '../utils/utils.dart';

class EventItem extends StatelessWidget {
  final GithubEvent e;

  EventItem(this.e);

  InlineSpan _buildLinkSpan(BuildContext context, String text, String url) {
    final theme = Provider.of<ThemeModel>(context);
    return TextSpan(
      text: text,
      style: TextStyle(color: theme.palette.primary),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          theme.push(context, url);
        },
    );
  }

  InlineSpan _buildRepo(BuildContext context, [String fullName]) {
    final name = fullName ?? e.repo.name;
    return _buildLinkSpan(context, name, '/$name');
  }

  InlineSpan _buildIssue(BuildContext context, int number,
      {bool isPullRequest = false}) {
    return _buildLinkSpan(context, '#$number',
        '/${e.repoOwner}/${e.repoName}/${isPullRequest ? 'pulls' : 'issues'}/$number');
  }

  Widget _buildItem({
    @required BuildContext context,
    @required List<InlineSpan> spans,
    Widget card,
  }) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      padding: CommonStyle.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Avatar(url: e.actor.avatarUrl, linkUrl: '/' + e.actor.login),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: join(SizedBox(height: 6), [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 17,
                          color: theme.palette.text,
                        ),
                        children: [
                          _buildLinkSpan(
                              context, e.actor.login, '/${e.actor.login}'),
                          ...spans,
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(timeago.format(e.createdAt),
                            style: TextStyle(
                              fontSize: 14,
                              color: theme.palette.tertiaryText,
                            )),
                      ],
                    ),
                    if (card != null) card
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultItem(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return _buildItem(
      context: context,
      spans: [
        TextSpan(
          text: ' ' + e.type,
          style: TextStyle(color: theme.palette.primary),
        )
      ],
      card: Text('Woops, ${e.type} not implemented yet'),
    );
  }

  Widget _buildCommitsCard(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Link(
      url:
          'https://github.com/${e.repoOwner}/${e.repoName}/compare/${e.payload.before}...${e.payload.head}',
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.palette.grayBackground,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(color: theme.palette.text, fontSize: 15),
                children: [
                  TextSpan(
                      text:
                          e.payload.commits.length.toString() + ' commits to '),
                  WidgetSpan(
                    child: PrimerBranchName(
                        e.payload.ref.replaceFirst('refs/heads/', '')),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            ...e.payload.commits.map((commit) {
              return Row(
                children: <Widget>[
                  Text(
                    commit.sha.substring(0, 7),
                    style: TextStyle(
                      color: theme.palette.primary,
                      fontSize: 15,
                      fontFamily: CommonStyle.monospace,
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      commit.message,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: theme.palette.text, fontSize: 15),
                    ),
                  )
                ],
              );
            }).toList()
          ],
        ),
      ),
    );
  }

  Widget _buildIssueCard(
      BuildContext context, GithubEventIssue issue, String body,
      {isPullRequest = false}) {
    final theme = Provider.of<ThemeModel>(context);
    IssueIconState state;
    if (isPullRequest) {
      if (issue.merged == true) {
        state = IssueIconState.prMerged;
      } else if (issue.state == 'open') {
        state = IssueIconState.prOpen;
      } else {
        state = IssueIconState.prClosed;
      }
    } else {
      if (issue.state == 'open') {
        state = IssueIconState.open;
      } else {
        state = IssueIconState.closed;
      }
    }

    return Link(
      url:
          '/${e.repoOwner}/${e.repoName}/${isPullRequest ? 'pulls' : 'issues'}/${issue.number}',
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.palette.grayBackground,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: join(SizedBox(height: 6), [
            Row(
              children: <Widget>[
                IssueIcon(state, size: 20),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '#' + issue.number.toString() + ' ' + issue.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: theme.palette.text,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (body != null && body.isNotEmpty)
              Text(
                body,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style:
                    TextStyle(color: theme.palette.secondaryText, fontSize: 15),
              ),
            Row(
              children: <Widget>[
                Avatar(url: issue.user.avatarUrl, size: AvatarSize.extraSmall),
                SizedBox(width: 8),
                Text(issue.user.login,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.palette.tertiaryText,
                    )),
                Expanded(child: Container()),
                if (issue.comments != null) ...[
                  Icon(
                    Octicons.comment,
                    size: 14,
                    color: theme.palette.tertiaryText,
                  ),
                  SizedBox(width: 4),
                  Text(issue.comments.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.palette.tertiaryText,
                      )),
                ]
              ],
            )
          ]),
        ),
      ),
    );
  }

  @override
  build(BuildContext context) {
    // all events types here:
    // https://developer.github.com/v3/activity/events/types/#event-types--payloads
    switch (e.type) {
      case 'CheckRunEvent':
      case 'CheckSuiteEvent':
      case 'CommitCommentEvent':
      case 'ContentReferenceEvent':
      case 'CreateEvent':
        return _buildItem(
          context: context,
          spans: <InlineSpan>[
            TextSpan(
                text: ' created ${e.payload.refType} ${e.payload.ref} at '),
            _buildRepo(context),
          ],
        );
      case 'DeleteEvent':
      case 'DeploymentEvent':
      case 'DeploymentStatusEvent':
      case 'DownloadEvent':
      case 'FollowEvent':
        // TODO:
        return _buildDefaultItem(context);
      case 'ForkEvent':
        final forkeeOwner = e.payload.forkee['owner']['login'] as String;
        final forkeeName = e.payload.forkee['name'] as String;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' forked '),
            _buildRepo(context, '$forkeeOwner/$forkeeName'),
            TextSpan(text: ' from '),
            _buildRepo(context),
          ],
        );
      case 'ForkApplyEvent':
      case 'GitHubAppAuthorizationEvent':
      case 'GistEvent':
      case 'GollumEvent':
      case 'InstallationEvent':
      case 'InstallationRepositoriesEvent':
        // TODO:
        return _buildDefaultItem(context);
      case 'IssueCommentEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' commented on ${e.payload.issue.isPullRequestComment ? 'pull request' : 'issue'} '),
            _buildIssue(context, e.payload.issue.number),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          card: _buildIssueCard(
            context,
            e.payload.issue,
            e.payload.comment.body,
            isPullRequest: e.payload.issue.isPullRequestComment,
          ),
        );
      case 'IssuesEvent':
        final issue = e.payload.issue;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${e.payload.action} issue '),
            _buildIssue(context, issue.number),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          card: _buildIssueCard(context, issue, issue.body),
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
        return _buildDefaultItem(context);
      case 'PullRequestEvent':
        final pr = e.payload.pullRequest;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${e.payload.action} pull request '),
            _buildIssue(context, pr.number, isPullRequest: true),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          card: _buildIssueCard(context, pr, pr.body, isPullRequest: true),
        );
      case 'PullRequestReviewEvent':
        // TODO:
        return _buildDefaultItem(context);
      case 'PullRequestReviewCommentEvent':
        final pr = e.payload.pullRequest;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' reviewed pull request '),
            _buildIssue(context, pr.number, isPullRequest: true),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          card: _buildIssueCard(context, pr, e.payload.comment.body,
              isPullRequest: true),
        );
      case 'PushEvent':
        return _buildItem(
          context: context,
          spans: [TextSpan(text: ' pushed to '), _buildRepo(context)],
          card: _buildCommitsCard(context),
        );
      case 'ReleaseEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' released '),
            _buildLinkSpan(
                context, e.payload.release.tagName, e.payload.release.htmlUrl),
            TextSpan(text: ' at '),
            _buildRepo(context)
          ],
        );
      case 'RepositoryEvent':
      case 'RepositoryImportEvent':
      case 'RepositoryVulnerabilityAlertEvent':
      case 'SecurityAdvisoryEvent':
      case 'StatusEvent':
      case 'TeamEvent':
      case 'TeamAddEvent':
        // TODO:
        return _buildDefaultItem(context);
      case 'WatchEvent':
        return _buildItem(
          context: context,
          spans: [TextSpan(text: ' starred '), _buildRepo(context)],
        );
      default:
        return _buildDefaultItem(context);
    }
  }
}
