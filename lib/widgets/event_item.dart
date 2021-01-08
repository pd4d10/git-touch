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
    return _buildLinkSpan(context, name, '/github/$name');
  }

  InlineSpan _buildIssue(BuildContext context, int number,
      {bool isPullRequest = false}) {
    return _buildLinkSpan(context, '#$number',
        '/github/${e.repoOwner}/${e.repoName}/${isPullRequest ? 'pull' : 'issues'}/$number');
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
              Avatar(
                  url: e.actor.avatarUrl, linkUrl: '/github/' + e.actor.login),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: join(SizedBox(height: 6), [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 17,
                          color: theme.palette.text,
                        ),
                        children: [
                          _buildLinkSpan(context, e.actor.login,
                              '/github/${e.actor.login}'),
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
          '/github/${e.repoOwner}/${e.repoName}/compare/${e.payload.before}/${e.payload.head}',
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.palette.grayBackground,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
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

  // Todo: Add a screen for the url
  Widget _buildCommitCommentCard(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Link(
      url: e.payload.comment.htmlUrl,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.palette.grayBackground,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Text(
                  e.payload.comment.commitId.substring(0, 7),
                  style: TextStyle(
                    color: theme.palette.primary,
                    fontSize: 15,
                    fontFamily: CommonStyle.monospace,
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    e.payload.comment.body,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: theme.palette.text, fontSize: 15),
                  ),
                )
              ],
            ),
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
          '/github/${e.repoOwner}/${e.repoName}/${isPullRequest ? 'pull' : 'issues'}/${issue.number}',
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
        return _buildItem(context: context, spans: [
          TextSpan(
              text:
                  ' ${e.payload.action} a check run for ${e.payload.checkRun.name} '),
        ]);
      case 'CheckSuiteEvent':
        // Needs checks permission
        String conclusion = "";
        switch (e.payload.checkSuite.conclusion) {
          case 'success':
          case 'failure':
            conclusion = 'it is a ' + e.payload.checkSuite.conclusion;
            break;
          case 'neutral':
          case 'cancelled':
          case 'timed_out':
          case 'stale':
            conclusion = 'it is ' + e.payload.checkSuite.conclusion;
            break;
          case 'action_required':
            conclusion = ' it requires more action';
            break;
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' ${e.payload.action} the check suite and the conclusion is that $conclusion'),
          ],
        );
      case 'CommitCommentEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' commented on a commit '),
            TextSpan(text: ' at '),
            _buildRepo(context),
          ],
          card: _buildCommitCommentCard(context),
        );
      case 'ContentReferenceEvent':
        return _buildItem(context: context, spans: [
          TextSpan(text: ' ${e.payload.action} a content reference at '),
          _buildLinkSpan(context, e.payload.contentReference.reference,
              e.payload.contentReference.reference),
        ]);
      case 'CreateEvent':
        return _buildItem(
          context: context,
          spans: <InlineSpan>[
            TextSpan(text: ' created a ${e.payload.refType}'),
            TextSpan(
                text:
                    '${e.payload.ref == null ? '' : ' ' + e.payload.ref + ' at'} '),
            _buildRepo(context),
          ],
        );
      case 'DeleteEvent':
        return _buildItem(
          context: context,
          spans: <InlineSpan>[
            TextSpan(text: ' deleted the ${e.payload.refType}'),
            TextSpan(
                text:
                    '${e.payload.ref == null ? '' : ' ' + e.payload.ref + ' at'} '),
            _buildRepo(context),
          ],
        );
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
      case 'GollumEvent':
        String pageNamesCreated = "";
        String pageNamesEdited = "";
        for (GithubPagesItem page in e.payload.pages) {
          if (page.action == "edited") {
            pageNamesEdited += ", " + page.pageName;
          } else {
            pageNamesCreated += ", " + page.pageName;
          }
        }
        if (pageNamesCreated.length > 0) {
          pageNamesCreated = " created the pages: \n" + pageNamesCreated + "\n";
        }
        if (pageNamesEdited.length > 0) {
          pageNamesEdited = " edited the pages: \n" + pageNamesEdited + "\n";
        }

        return _buildItem(
            context: context,
            spans: [TextSpan(text: ' $pageNamesCreated\n$pageNamesEdited ')]);
      case 'InstallationEvent':
        String action = e.payload.action;
        if (action == 'new_permissions_accepted') {
          action = "new permission were accepted for";
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' $action for the Github App with id ${e.payload.installation.id}'),
          ],
        );
      case 'InstallationRepositoriesEvent':
        List<GithubNotificationItemRepo> repositoriesAdded =
            e.payload.installation.repositoriesAdded;
        List<GithubNotificationItemRepo> repositoriesRemoved =
            e.payload.installation.repositoriesRemoved;
        String addedRepos = "";
        String removedRepos = "";
        for (GithubNotificationItemRepo repo in repositoriesAdded) {
          addedRepos += repo.fullName + ", ";
        }
        for (GithubNotificationItemRepo repo in repositoriesRemoved) {
          removedRepos += repo.fullName + ", ";
        }
        String finalListOfRepos = "";
        if (addedRepos != "") {
          finalListOfRepos += addedRepos + " were added to\n ";
        }
        if (removedRepos != "") {
          finalListOfRepos += removedRepos + " were removed from";
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' $finalListOfRepos the installation id ${e.payload.installation.id} '),
          ],
        );
      case 'IssueCommentEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' commented on ${e.payload.issue.isPullRequestComment ? 'pull request' : 'issue'} '),
            _buildIssue(
              context,
              e.payload.issue.number,
              isPullRequest: e.payload.issue.isPullRequestComment,
            ),
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
      case 'MarketplacePurchaseEvent':
        final action = e.payload.action;
        var messageToDisplay;
        switch (action) {
          case "purchased":
            messageToDisplay = "purchased a Marketplace Plan";
            break;
          case "cancelled":
            messageToDisplay = "cancelled their Marketplace Plan";
            break;
          case "pending_change":
            messageToDisplay = " Marketplace Plan is pending change";
            break;
          case "pending_change_cancelled":
            messageToDisplay = " Pending Marketplace Plan was cancelled";
            break;
          case "changed":
            messageToDisplay = " changed their Marketplace Plan";
            break;
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
              text: ' $messageToDisplay ',
            ),
            _buildRepo(context),
          ],
        );
      case 'MemberEvent':
        final action = e.payload.action;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' was ${e.payload.action} ${action == 'added' ? 'to' : 'from'} '),
            _buildRepo(context),
          ],
        );
      case 'ProjectCardEvent':
        String action = e.payload.action;
        if (action == 'converted') {
          action = ' converted the project card into an issue ';
        } else {
          action = action + ' the project card ';
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' $action at '),
            _buildRepo(context),
          ],
        );
      case 'ProjectColumnEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
              text:
                  ' ${e.payload.action} the project column ${e.payload.projectColumn.name} at '),
          _buildRepo(context),
        ]);
      case 'ProjectEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
              text:
                  ' ${e.payload.action} the project ${e.payload.project.name} '),
        ]);
      case 'PublicEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' made '),
            _buildRepo(context),
            TextSpan(text: ' public'),
          ],
        );
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
        final pr = e.payload.pullRequest;
        return _buildItem(context: context, spans: [
          TextSpan(text: ' ${e.payload.action} the pull request review '),
          _buildIssue(context, pr.number, isPullRequest: true),
          TextSpan(text: ' at '),
          _buildRepo(context),
        ]);
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
      // case 'RepositoryImportEvent':
      // // Uses Source Imports API
      case 'RepositoryVulnerabilityAlertEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
            text:
                ' Security alert involving the package ${e.payload.alert.affectedPackageName} between versions ${e.payload.alert.affectedRange} was {e.payload.action}ed',
          )
        ]);
      case 'SecurityAdvisoryEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
            text:
                ' Security advisory regarding ${e.payload.securityAdvisory.summary} was ${e.payload.action} ',
          )
        ]);
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
