import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/github.data.gql.dart';
import 'package:git_touch/graphql/schema.schema.gql.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import 'comment_item.dart';

TextSpan createUserSpan(BuildContext context, String login) {
  return createLinkSpan(context, login, '/github/$login');
}

class TimelineEventItem extends StatelessWidget {
  final String actor;
  final IconData iconData;
  final Color iconColor;
  final TextSpan textSpan;

  TimelineEventItem({
    this.actor,
    this.iconData = Octicons.octoface,
    this.iconColor = Colors.grey,
    this.textSpan,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return Row(
      children: <Widget>[
        SizedBox(width: 6),
        Icon(iconData, color: iconColor, size: 20),
        SizedBox(width: 12),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: TextStyle(color: theme.palette.text, fontSize: 16),
              children: [
                // TODO: actor is null
                createUserSpan(context, actor),
                textSpan,
                // TextSpan(text: ' ' + TimeAgo.formatFromString(item['createdAt']))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TimelineItem extends StatelessWidget {
  final dynamic node;
  TimelineItem(this.node);

  Widget _buildFallback(String type) {
    return TimelineEventItem(
      actor: '',
      iconData: Octicons.octoface,
      textSpan: TextSpan(children: [
        TextSpan(text: 'Woops, $type type not implemented yet'),
      ]),
    );
  }

  Widget _buildByType(BuildContext context, String type) {
    final theme = Provider.of<ThemeModel>(context);

    switch (type) {
      // common types
      case 'PullRequestCommit':
        final p = node as GPullRequestCommitParts;
        return TimelineEventItem(
          actor: p.commit.author.user?.login,
          iconData: Octicons.git_commit,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added commit '),
            TextSpan(text: p.commit.oid.substring(0, 8))
          ]),
        );
      case 'IssueComment':
        return CommentItem.gql(
            node as GCommentParts, node as GReactableParts, (item) {});
      case 'CrossReferencedEvent':
        final p = node as GCrossReferencedEventParts;
        final source = p.source as dynamic;
        final number = source.number;
        final owner = source.repository.owner.login;
        final name = source.repository.name;
        final prefix = p.source.G__typename == 'Issue' ? 'issues' : 'pull';
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.primitive_dot,
          iconColor: GithubPalette.open,
          textSpan: TextSpan(children: [
            TextSpan(text: ' referenced this on '),
            createLinkSpan(context, '$owner/$name#$number',
                '/github/$owner/$name/$prefix/$number'),
          ]),
        );
      case 'ClosedEvent':
        final p = node as GClosedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.circle_slash,
          iconColor: GithubPalette.closed,
          textSpan: TextSpan(text: ' closed this '),
        );

      case 'ReopenedEvent':
        final p = node as GReopenedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.primitive_dot,
          iconColor: GithubPalette.open,
          textSpan: TextSpan(text: ' reopened this '),
        );
      case 'SubscribedEvent':
        final p = node as GSubscribedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          textSpan: TextSpan(text: ' subscribed to this issue '),
        );
      case 'UnsubscribedEvent':
        final p = node as GUnsubscribedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          textSpan: TextSpan(text: ' unsubscribed from this issue '),
        );
      case 'ReferencedEvent':
        final p = node as GReferencedEventParts;
        // TODO: isCrossRepository
        if (p.commit == null) {
          return Container();
        }
        if (p.isCrossRepository) {
          return TimelineEventItem(
            actor: p.actor.login,
            iconData: Octicons.bookmark,
            textSpan: TextSpan(children: [
              TextSpan(text: ' referenced this pull request from commit '),
              TextSpan(text: p.commit.oid.substring(0, 8)),
              TextSpan(text: ' from ' + p.commitRepository.name),
            ]),
          );
        }
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.bookmark,
          textSpan: TextSpan(children: [
            TextSpan(text: ' referenced this pull request from commit '),
            TextSpan(text: p.commit.oid.substring(0, 8)),
          ]),
        );
      case 'AssignedEvent':
        final p = node as GAssignedEventParts;
        final assignee = (p.assignee as dynamic).login;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' assigned this to '),
            createLinkSpan(context, assignee, '/github/$assignee'),
          ]),
        );
      case 'UnassignedEvent':
        final p = node as GUnassignedEventParts;
        final assignee = (p.assignee as dynamic).login;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' unassigned this from '),
            createLinkSpan(context, assignee, '/github/$assignee')
          ]),
        );
      case 'LabeledEvent':
        final p = node as GLabeledEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added '),
            WidgetSpan(
                child: MyLabel(name: p.label.name, cssColor: p.label.color)),
            TextSpan(text: ' label'),
          ]),
        );
      case 'UnlabeledEvent':
        final p = node as GUnlabeledEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' removed '),
            WidgetSpan(
                child: MyLabel(name: p.label.name, cssColor: p.label.color)),
            TextSpan(text: ' label'),
          ]),
        );
      case 'MilestonedEvent':
        final p = node as GMilestonedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.milestone,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added this to '),
            TextSpan(text: p.milestoneTitle),
            TextSpan(text: ' milestone'),
          ]),
        );
      case 'DemilestonedEvent':
        final p = node as GDemilestonedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.milestone,
          textSpan: TextSpan(children: [
            TextSpan(text: ' removed this from '),
            TextSpan(text: p.milestoneTitle),
            TextSpan(text: ' milestone'),
          ]),
        );
      case 'RenamedTitleEvent':
        final p = node as GRenamedTitleEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.pencil,
          textSpan: TextSpan(children: [
            TextSpan(text: ' changed the title '),
            TextSpan(
              text: p.previousTitle,
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            TextSpan(text: ' to '),
            TextSpan(text: p.currentTitle)
          ]),
        );
      case 'LockedEvent':
        final p = node as GLockedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.lock,
          textSpan: TextSpan(children: [
            TextSpan(text: ' locked this conversation '),
          ]),
        );
      case 'UnlockedEvent':
        final p = node as GUnlockedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' unlocked this conversation '),
          ]),
        );
      case 'TransferredEvent':
        final p = node as GTransferredEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          textSpan: TextSpan(
            children: [
              TextSpan(
                  text: ' transferred this issue from ' + p.fromRepository.name)
            ],
          ),
        );

      // pull request only types
      case 'CommitCommentThread':
        return _buildFallback(type); // TODO:
      case 'PullRequestReview':
        final p = node as GPullRequestReviewParts;
        return Column(
          children: <Widget>[
            TimelineEventItem(
                actor: p.author.login,
                iconColor: GithubPalette.open,
                iconData: Octicons.check,
                textSpan: p.state == GPullRequestReviewState.APPROVED
                    ? TextSpan(text: ' approved these changes')
                    : p.state == GPullRequestReviewState.COMMENTED
                        ? TextSpan(text: ' reviewed ')
                        : warningSpan),
            Container(
              padding: CommonStyle.padding.copyWith(left: 50),
              child: Column(
                children: <Widget>[
                  for (var v in p.comments.nodes)
                    CommentItem.gql(v, v, (key) {}),
                ],
              ),
            ),
          ],
        );
      case 'PullRequestReviewThread':
      case 'PullRequestReviewComment':
        return _buildFallback(type); // TODO:
      case 'MergedEvent':
        final p = node as GMergedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.git_merge,
          iconColor: GithubPalette.merged,
          textSpan: TextSpan(children: [
            TextSpan(text: ' merged commit '),
            TextSpan(text: p.commit.oid.substring(0, 8)),
            TextSpan(text: ' into '),
            TextSpan(text: p.mergeRefName),
          ]),
        );
      case 'MentionedEvent':
        final p = node as GMentionedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.bookmark,
          textSpan: TextSpan(text: ' was mentioned '),
        );
      case 'PinnedEvent':
        final p = node as GPinnedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.pin,
          textSpan: TextSpan(text: ' pinned this issue '),
        );
      case 'DeployedEvent':
        final p = node as GDeployedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          textSpan: TextSpan(
              text: ' deployed the pull request ' + p.pullRequest.headRef.name),
        );
      case 'DeploymentEnvironmentChangedEvent':
        final p = node as GDeploymentEnvironmentChangedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          textSpan: TextSpan(
              text: ' changed the deployment environment to ' +
                  p.deploymentStatus.deployment.environment),
        );
      case 'HeadRefDeletedEvent':
        final p = node as GHeadRefDeletedEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          iconData: Octicons.git_branch,
          textSpan: TextSpan(children: [
            TextSpan(text: ' deleted the '),
            TextSpan(text: p.headRefName),
            TextSpan(text: ' branch'),
          ]),
        );
      case 'HeadRefRestoredEvent':
        final p = node as GHeadRefRestoredEventParts;
        return TimelineEventItem(
          actor: p.actor.login,
          textSpan: TextSpan(children: [
            TextSpan(text: ' restored the '),
            WidgetSpan(child: PrimerBranchName(p.pullRequest.headRefName)),
            TextSpan(text: ' branch')
          ]),
        );
      case 'HeadRefForcePushedEvent':
        final p = node as GHeadRefForcePushedEventParts;
        return TimelineEventItem(
          iconData: Octicons.repo_force_push,
          actor: p.actor.login,
          textSpan: TextSpan(
            children: [
              TextSpan(text: ' force-pushed the '),
              WidgetSpan(child: PrimerBranchName(p.pullRequest.headRefName)),
              TextSpan(text: ' branch from '),
              TextSpan(
                text: p.beforeCommit.oid.substring(0, 7),
                style: TextStyle(color: theme.palette.primary),
              ),
              TextSpan(text: ' to '),
              TextSpan(
                text: p.afterCommit.oid.substring(0, 7),
                style: TextStyle(color: theme.palette.primary),
              ),
            ],
          ),
        );
      case 'BaseRefForcePushedEvent':
        final p = node as GBaseRefForcePushedEventParts;
        return TimelineEventItem(
          iconData: Octicons.repo_force_push,
          actor: p.actor.login,
          textSpan: TextSpan(
            children: [
              TextSpan(text: ' force-pushed the '),
              WidgetSpan(child: PrimerBranchName(p.pullRequest.baseRef.name)),
              TextSpan(text: ' branch from '),
              TextSpan(
                text: p.beforeCommit.oid.substring(0, 7),
                style: TextStyle(color: theme.palette.primary),
              ),
              TextSpan(text: ' to '),
              TextSpan(
                text: p.afterCommit.oid.substring(0, 7),
                style: TextStyle(color: theme.palette.primary),
              ),
            ],
          ),
        );
      case 'ReviewRequestedEvent':
        final p = node as GReviewRequestedEventParts;
        return TimelineEventItem(
          iconData: Octicons.eye,
          actor: p.actor.login,
          textSpan: TextSpan(children: [
            TextSpan(text: ' requested a review from '),
            createUserSpan(
                context,
                (p.requestedReviewer
                        as GReviewRequestedEventParts_requestedReviewer__asUser)
                    .login),
          ]),
        );
      case 'ReviewRequestRemovedEvent':
        final p = node as GReviewRequestRemovedEventParts;
        return TimelineEventItem(
          iconData: Octicons.eye,
          actor: p.actor.login,
          textSpan: TextSpan(children: [
            TextSpan(text: ' removed '),
            createUserSpan(
                context,
                (p.requestedReviewer
                        as GReviewRequestRemovedEventParts_requestedReviewer__asUser)
                    .login),
            TextSpan(text: ' from the review request '),
          ]),
        );
      case 'ReviewDismissedEvent':
        final p = node as GReviewDismissedEventParts;
        return TimelineEventItem(
          iconData: Octicons.eye,
          actor: p.actor.login,
          textSpan: TextSpan(children: [
            TextSpan(text: ' dismissed the pull request review requested by '),
            createUserSpan(context, p.pullRequest.author.login),
          ]),
        );
      default:
        return _buildFallback(type);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CommonStyle.padding,
      child: _buildByType(context, node.G__typename),
    );
  }
}
