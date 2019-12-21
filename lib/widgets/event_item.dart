import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/issue_icon.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'avatar.dart';
import '../widgets/link.dart';
import '../utils/utils.dart';

class EventItem extends StatelessWidget {
  final GithubEvent e;

  EventItem(this.e);

  TextSpan _buildLinkSpan(ThemeModel theme, String text) {
    return TextSpan(
      text: text,
      style: TextStyle(color: theme.palette.primary),
    );
  }

  TextSpan _buildRepo(ThemeModel theme) => _buildLinkSpan(theme, e.repo.name);

  Iterable<ActionItem> _getUserActions(List<String> users) {
    // Remove duplicates
    return users.toSet().map((user) {
      return ActionItem.user(user);
    });
  }

  Widget _buildItem({
    @required BuildContext context,
    @required List<InlineSpan> spans,
    String detail,
    Widget card,
    String url,
    List<ActionItem> actionItems,
  }) {
    final theme = Provider.of<ThemeModel>(context);

    if (card == null && detail != null) {
      card = Text(detail.trim(), overflow: TextOverflow.ellipsis, maxLines: 5);
    }

    return Container(
      padding: CommonStyle.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Link(
                url: '/' + e.actor.login,
                child: Avatar.medium(url: e.actor.avatarUrl),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: join(SizedBox(height: 8), [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 17,
                          color: theme.palette.text,
                        ),
                        children: [
                          _buildLinkSpan(theme, e.actor.login),
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
                        // Expanded(child: Container()),
                        // GestureDetector(
                        //   child: Icon(Icons.more_horiz),
                        //   onTap: () {
                        //     theme.showActions(context, actionItems);
                        //   },
                        // ),
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
      detail: 'Woops, ${e.type} not implemented yet',
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
          children: join(SizedBox(height: 8), [
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
                Avatar.extraSmall(url: issue.user.avatarUrl),
                SizedBox(width: 8),
                Text(issue.user.login,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.palette.tertiaryText,
                    )),
                Expanded(child: Container()),
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
              ],
            )
          ]),
        ),
      ),
    );
  }

  @override
  build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    // all events types here:
    // https://developer.github.com/v3/activity/events/types/#event-types--payloads
    switch (e.type) {
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
        return _buildDefaultItem(context);
      case 'ForkEvent':
        final forkeeOwner = e.payload.forkee['owner']['login'] as String;
        final forkeeName = e.payload.forkee['name'] as String;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' forked '),
            _buildLinkSpan(theme, '$forkeeOwner/$forkeeName'),
            TextSpan(text: ' from '),
            _buildRepo(theme),
          ],
          url: '/$forkeeOwner/$forkeeName',
          actionItems: [
            ..._getUserActions([e.actor.login, forkeeOwner]),
            ActionItem.repository(forkeeOwner, forkeeName),
            ActionItem.repository(e.repoOwner, e.repoName),
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
            _buildLinkSpan(theme, '#${e.payload.issue.number}'),
            TextSpan(text: ' at '),
            _buildRepo(theme),
          ],
          card: _buildIssueCard(
            context,
            e.payload.issue,
            e.payload.comment.body,
            isPullRequest: e.payload.issue.isPullRequestComment,
          ),
          actionItems: [
            ..._getUserActions([e.actor.login, e.repoOwner]),
            ActionItem.pullRequest(
                e.repoOwner, e.repoName, e.payload.issue.number),
          ],
        );
      case 'IssuesEvent':
        final issue = e.payload.issue;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${e.payload.action} issue '),
            _buildLinkSpan(theme, '#${issue.number}'),
            TextSpan(text: ' at '),
            _buildRepo(theme),
          ],
          card: _buildIssueCard(context, issue, issue.body),
          url: '/${e.repoOwner}/${e.repoName}/issues/${issue.number}',
          actionItems: [
            ..._getUserActions([e.actor.login, e.repoOwner]),
            ActionItem.repository(e.repoOwner, e.repoName),
            ActionItem.issue(e.repoOwner, e.repoName, issue.number),
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
        return _buildDefaultItem(context);
      case 'PullRequestEvent':
        final pr = e.payload.pullRequest;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${e.payload.action} pull request '),
            _buildLinkSpan(theme, '#${pr.number}'),
            TextSpan(text: ' at '),
            _buildRepo(theme),
          ],
          card: _buildIssueCard(context, pr, pr.body, isPullRequest: true),
          url: '/${e.repoOwner}/${e.repoName}/pulls/${pr.number}',
          actionItems: [
            ..._getUserActions([e.actor.login, e.repoOwner]),
            ActionItem.repository(e.repoOwner, e.repoName),
            ActionItem.pullRequest(e.repoOwner, e.repoName, pr.number),
          ],
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
            _buildLinkSpan(theme, '#${pr.number}'),
            TextSpan(text: ' at '),
            _buildRepo(theme),
          ],
          card: _buildIssueCard(context, pr, pr.body),
          url: '/${e.repoOwner}/${e.repoName}/pulls/${pr.number}',
          actionItems: [
            ..._getUserActions([e.actor.login, e.repoOwner]),
            ActionItem.repository(e.repoOwner, e.repoName),
            ActionItem.pullRequest(e.repoOwner, e.repoName, pr.number),
          ],
        );
      case 'PushEvent':
        return _buildItem(
          context: context,
          spans: [TextSpan(text: ' pushed to '), _buildRepo(theme)],
          card: _buildCommitsCard(context),
          actionItems: [
            ..._getUserActions([e.actor.login, e.repoOwner]),
            ActionItem.repository(e.repoOwner, e.repoName),
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
        return _buildDefaultItem(context);
      case 'WatchEvent':
        return _buildItem(
          context: context,
          spans: [TextSpan(text: ' starred '), _buildRepo(theme)],
          url: '/${e.repoOwner}/${e.repoName}',
          actionItems: [
            ..._getUserActions([e.actor.login, e.repoOwner]),
            ActionItem.repository(e.repoOwner, e.repoName),
          ],
        );
      default:
        return _buildDefaultItem(context);
    }
  }
}
