import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/branch_name.dart';
import 'package:git_touch/widgets/issue_icon.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:timeago/timeago.dart' as timeago;

class EventItem extends StatelessWidget {
  const EventItem(this.e);
  final GithubEvent e;

  InlineSpan _buildLinkSpan(BuildContext context, String? text, String? url) {
    return TextSpan(
      text: text,
      style: TextStyle(color: AntTheme.of(context).colorPrimary),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          context.pushUrl(url!);
        },
    );
  }

  InlineSpan _buildRepo(BuildContext context, [String? fullName]) {
    final name = fullName ?? e.repo!.name;
    return _buildLinkSpan(context, name, '/github/$name');
  }

  InlineSpan _buildIssue(BuildContext context, int? number,
      {bool isPullRequest = true}) {
    return _buildLinkSpan(context, '#$number',
        '/github/${e.repoOwner}/${e.repoName}/${isPullRequest ? 'pull' : 'issues'}/$number');
  }

  Widget _buildItem({
    required BuildContext context,
    required List<InlineSpan> spans,
    Widget? card,
  }) {
    return AntListItem(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Avatar(
                  url: e.actor!.avatarUrl,
                  linkUrl: '/github/${e.actor!.login!}'),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 17,
                          color: AntTheme.of(context).colorText,
                        ),
                        children: [
                          _buildLinkSpan(context, e.actor!.login,
                              '/github/${e.actor!.login}'),
                          ...spans,
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(timeago.format(e.createdAt!),
                            style: TextStyle(
                              fontSize: 14,
                              color: AntTheme.of(context).colorWeak,
                            )),
                      ],
                    ),
                    if (card != null) card
                  ].withSeparator(const SizedBox(height: 6)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultItem(BuildContext context) {
    return _buildItem(
      context: context,
      spans: [
        TextSpan(
          text: ' ${e.type!}',
          style: TextStyle(color: AntTheme.of(context).colorPrimary),
        )
      ],
      card: Text(
          '${e.type} ${AppLocalizations.of(context)!.timelineTypeNotImplemented}'),
    );
  }

  Widget _buildCommitsCard(BuildContext context) {
    return LinkWidget(
      url:
          '/github/${e.repoOwner}/${e.repoName}/compare/${e.payload!.before}/${e.payload!.head}',
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Color(0xffcccccc),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                style: TextStyle(
                    color: AntTheme.of(context).colorText, fontSize: 15),
                children: [
                  TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.nCommitsTo(e.payload!.commits!.length)} '),
                  WidgetSpan(
                    child: BranchName(
                        e.payload!.ref!.replaceFirst('refs/heads/', '')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ...e.payload!.commits!.map((commit) {
              return Row(
                children: <Widget>[
                  Text(
                    commit.sha!.substring(0, 7),
                    style: TextStyle(
                      color: AntTheme.of(context).colorPrimary,
                      fontSize: 15,
                      fontFamily: CommonStyle.monospace,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      commit.message!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: AntTheme.of(context).colorText, fontSize: 15),
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
    return LinkWidget(
      url: e.payload!.comment!.htmlUrl,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AntTheme.of(context).colorBox,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Text(
                  e.payload!.comment!.commitId!.substring(0, 7),
                  style: TextStyle(
                    color: AntTheme.of(context).colorPrimary,
                    fontSize: 15,
                    fontFamily: CommonStyle.monospace,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    e.payload!.comment!.body!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: AntTheme.of(context).colorText, fontSize: 15),
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
      BuildContext context, GithubEventIssue issue, String? body,
      {isPullRequest = true}) {
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

    return LinkWidget(
      url:
          '/github/${e.repoOwner}/${e.repoName}/${isPullRequest ? 'pull' : 'issues'}/${issue.number}',
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AntTheme.of(context).colorBox,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                IssueIcon(state, size: 20),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '#${issue.number} ${issue.title!}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AntTheme.of(context).colorText,
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
                style: TextStyle(
                    color: AntTheme.of(context).colorTextSecondary,
                    fontSize: 15),
              ),
            Row(
              children: <Widget>[
                Avatar(url: issue.user!.avatarUrl, size: AvatarSize.extraSmall),
                const SizedBox(width: 8),
                Text(issue.user!.login!,
                    style: TextStyle(
                      fontSize: 14,
                      color: AntTheme.of(context).colorWeak,
                    )),
                Expanded(child: Container()),
                if (issue.comments != null) ...[
                  Icon(
                    Octicons.comment,
                    size: 14,
                    color: AntTheme.of(context).colorWeak,
                  ),
                  const SizedBox(width: 4),
                  Text(issue.comments.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: AntTheme.of(context).colorWeak,
                      )),
                ]
              ],
            )
          ].withSeparator(const SizedBox(height: 6)),
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
                  '${AppLocalizations.of(context)!.checkRunEventMessage(e.payload!.action!, e.payload!.checkRun!.name!)} '),
        ]);
      case 'CheckSuiteEvent':
        // Needs checks permission
        var conclusion = '';
        switch (e.payload!.checkSuite!.conclusion) {
          case 'success':
          case 'failure':
            conclusion =
                '${AppLocalizations.of(context)!.checkSuiteEventConclusionMessage(e.payload!.checkSuite!.conclusion!)} ';
            break;
          case 'neutral':
          case 'cancelled':
          case 'timed_out':
          case 'stale':
            conclusion =
                '${AppLocalizations.of(context)!.checkSuiteEventConclusionMessage(e.payload!.checkSuite!.conclusion!)} ';
            break;
          case 'action_required':
            conclusion =
                ' ${AppLocalizations.of(context)!.actionRequiredConclusion}';
            break;
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' ${AppLocalizations.of(context)!.checkSuiteEventMessage(e.payload!.action!)} $conclusion'),
          ],
        );
      case 'CommitCommentEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' ${AppLocalizations.of(context)!.commitCommentEventMessage} '),
            _buildRepo(context),
          ],
          card: _buildCommitCommentCard(context),
        );
      case 'ContentReferenceEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
              text:
                  ' ${AppLocalizations.of(context)!.contentReferenceEventMessage(e.payload!.action!)} '),
          _buildLinkSpan(context, e.payload!.contentReference!.reference,
              e.payload!.contentReference!.reference),
        ]);
      case 'CreateEvent':
        return _buildItem(
          context: context,
          spans: <InlineSpan>[
            TextSpan(
                text:
                    ' ${AppLocalizations.of(context)!.createdEventMessage(e.payload!.refType!, e.payload!.ref ?? '')}'),
            _buildRepo(context),
          ],
        );
      case 'DeleteEvent':
        return _buildItem(
          context: context,
          spans: <InlineSpan>[
            TextSpan(
                text:
                    ' ${AppLocalizations.of(context)!.deletedEventMessage(e.payload!.refType!, e.payload!.ref ?? '')}'),
            _buildRepo(context),
          ],
        );
      case 'ForkEvent':
        final forkeeOwner = e.payload!.forkee!['owner']['login'] as String?;
        final forkeeName = e.payload!.forkee!['name'] as String?;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${AppLocalizations.of(context)!.forked} '),
            _buildRepo(context, '$forkeeOwner/$forkeeName'),
            TextSpan(text: ' ${AppLocalizations.of(context)!.from} '),
            _buildRepo(context),
          ],
        );
      case 'GollumEvent':
        var pageNamesCreated = '';
        var pageNamesEdited = '';
        for (final page in e.payload!.pages!) {
          if (page.action == 'edited') {
            pageNamesEdited += ', ${page.pageName!}';
          } else {
            pageNamesCreated += ', ${page.pageName!}';
          }
        }
        if (pageNamesCreated.isNotEmpty) {
          pageNamesCreated =
              ' ${AppLocalizations.of(context)!.createdPages(pageNamesCreated)}';
        }
        if (pageNamesEdited.isNotEmpty) {
          pageNamesEdited =
              ' ${AppLocalizations.of(context)!.editedPages(pageNamesEdited)}';
        }

        return _buildItem(
            context: context,
            spans: [TextSpan(text: ' $pageNamesCreated\n$pageNamesEdited ')]);
      case 'InstallationEvent':
        var action = e.payload!.action;
        if (action == 'new_permissions_accepted') {
          action = AppLocalizations.of(context)!.newPermissionsAccepted;
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' $action ${AppLocalizations.of(context)!.forGithubAppWithId(e.payload!.installation!.id.toString())}'),
          ],
        );
      case 'InstallationRepositoriesEvent':
        final repositoriesAdded = e.payload!.installation!.repositoriesAdded!;
        final repositoriesRemoved =
            e.payload!.installation!.repositoriesRemoved!;
        var addedRepos = '';
        var removedRepos = '';
        for (final repo in repositoriesAdded) {
          addedRepos += '${repo.fullName!}, ';
        }
        for (final repo in repositoriesRemoved) {
          removedRepos += '${repo.fullName!}, ';
        }
        var finalListOfRepos = '';
        if (addedRepos != '') {
          finalListOfRepos +=
              '${AppLocalizations.of(context)!.wereAddedTo(addedRepos, e.payload!.installation!.id.toString())}\n ';
        }
        if (removedRepos != '') {
          finalListOfRepos +=
              '$removedRepos ${AppLocalizations.of(context)!.wereRemovedFrom(removedRepos, e.payload!.installation!.id.toString())}';
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: finalListOfRepos),
          ],
        );
      case 'IssueCommentEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' ${AppLocalizations.of(context)!.commentedOn} ${e.payload!.issue!.isPullRequestComment ? 'pull request' : 'issue'} '),
            _buildIssue(
              context,
              e.payload!.issue!.number,
              isPullRequest: e.payload!.issue!.isPullRequestComment,
            ),
            TextSpan(text: ' ${AppLocalizations.of(context)!.at} '),
            _buildRepo(context),
          ],
          card: _buildIssueCard(
            context,
            e.payload!.issue!,
            e.payload!.comment!.body,
            isPullRequest: e.payload!.issue!.isPullRequestComment,
          ),
        );
      case 'IssuesEvent':
        final issue = e.payload!.issue!;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' ${e.payload!.action} ${AppLocalizations.of(context)!.issue} '),
            _buildIssue(context, issue.number),
            TextSpan(text: ' ${AppLocalizations.of(context)!.at} '),
            _buildRepo(context),
          ],
          card: _buildIssueCard(context, issue, issue.body),
        );
      case 'MarketplacePurchaseEvent':
        final action = e.payload!.action;
        String? messageToDisplay;
        switch (action) {
          case 'purchased':
            messageToDisplay =
                AppLocalizations.of(context)!.purchasedMarketplacePlan;
            break;
          case 'cancelled':
            messageToDisplay =
                AppLocalizations.of(context)!.cancelledMarketplacePlan;
            break;
          case 'pending_change':
            messageToDisplay =
                AppLocalizations.of(context)!.pendingMarketplacePlan;
            break;
          case 'pending_change_cancelled':
            messageToDisplay =
                AppLocalizations.of(context)!.pendingChangeCancelled;
            break;
          case 'changed':
            messageToDisplay =
                AppLocalizations.of(context)!.changedMarketplacePlan;
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
        final action = e.payload!.action;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' ${AppLocalizations.of(context)!.was} ${e.payload!.action} ${action == 'added' ? AppLocalizations.of(context)!.to : AppLocalizations.of(context)!.from} '),
            _buildRepo(context),
          ],
        );
      case 'ProjectCardEvent':
        var action = e.payload!.action;
        if (action == 'converted') {
          action = ' ${AppLocalizations.of(context)!.convertProjectCard} ';
        } else {
          action =
              '${action!} ${AppLocalizations.of(context)!.theProjectCard} ';
        }
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' $action ${AppLocalizations.of(context)!.at} '),
            _buildRepo(context),
          ],
        );
      case 'ProjectColumnEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
              text:
                  ' ${AppLocalizations.of(context)!.projectColumnEventMessage(e.payload!.action!, e.payload!.projectColumn!.name!)} '),
          _buildRepo(context),
        ]);
      case 'ProjectEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
              text:
                  ' ${AppLocalizations.of(context)!.projectEventMessage(e.payload!.action!, e.payload!.project!.name!)}} '),
        ]);
      case 'PublicEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${AppLocalizations.of(context)!.made} '),
            _buildRepo(context),
            TextSpan(text: ' ${AppLocalizations.of(context)!.public}'),
          ],
        );
      case 'PullRequestEvent':
        final pr = e.payload!.pullRequest!;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' ${AppLocalizations.of(context)!.pullRequestEventMessage(e.payload!.action!)} '),
            _buildIssue(context, pr.number, isPullRequest: true),
            TextSpan(text: ' ${AppLocalizations.of(context)!.at} '),
            _buildRepo(context),
          ],
          card: _buildIssueCard(context, pr, pr.body, isPullRequest: true),
        );
      case 'PullRequestReviewEvent':
        final pr = e.payload!.pullRequest!;
        return _buildItem(context: context, spans: [
          TextSpan(
              text:
                  ' ${AppLocalizations.of(context)!.pullRequestReviewEventMessage(e.payload!.action!)} '),
          _buildIssue(context, pr.number, isPullRequest: true),
          TextSpan(text: ' ${AppLocalizations.of(context)!.at} '),
          _buildRepo(context),
        ]);
      case 'PullRequestReviewCommentEvent':
        final pr = e.payload!.pullRequest!;
        return _buildItem(
          context: context,
          spans: [
            TextSpan(
                text:
                    ' ${AppLocalizations.of(context)!.pullRequestReviewCommentEventMessage} '),
            _buildIssue(context, pr.number, isPullRequest: true),
            TextSpan(text: ' ${AppLocalizations.of(context)!.at} '),
            _buildRepo(context),
          ],
          card: _buildIssueCard(context, pr, e.payload!.comment!.body,
              isPullRequest: true),
        );
      case 'PushEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${AppLocalizations.of(context)!.pushedTo} '),
            _buildRepo(context)
          ],
          card: _buildCommitsCard(context),
        );
      case 'ReleaseEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: '${AppLocalizations.of(context)!.released} '),
            _buildLinkSpan(context, e.payload!.release!.tagName,
                e.payload!.release!.htmlUrl),
            const TextSpan(text: ' at '),
            _buildRepo(context)
          ],
        );
      // case 'RepositoryImportEvent':
      // // Uses Source Imports API
      case 'RepositoryVulnerabilityAlertEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
            text:
                ' ${AppLocalizations.of(context)!.securityAlertInvolvingPackage(e.payload!.alert!.affectedPackageName!, e.payload!.alert!.affectedRange!, e.payload!.action!)}',
          )
        ]);
      case 'SecurityAdvisoryEvent':
        return _buildItem(context: context, spans: [
          TextSpan(
            text:
                ' ${AppLocalizations.of(context)!.securityAdvisory(e.payload!.securityAdvisory!.summary!, e.payload!.action!)} ',
          )
        ]);
      case 'WatchEvent':
        return _buildItem(
          context: context,
          spans: [
            TextSpan(text: ' ${AppLocalizations.of(context)!.starred} '),
            _buildRepo(context)
          ],
        );
      default:
        return _buildDefaultItem(context);
    }
  }
}
