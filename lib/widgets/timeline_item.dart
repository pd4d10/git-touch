import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import 'comment_item.dart';

class TimelineEventItem extends StatelessWidget {
  final String actor;
  final IconData iconData;
  final Color iconColor;
  final TextSpan textSpan;
  final p;

  TimelineEventItem({
    this.actor,
    this.iconData = Octicons.octoface,
    this.iconColor = Colors.grey,
    this.textSpan,
    this.p,
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
  final Map<String, dynamic> p;
  TimelineItem(this.p);

  TextSpan _buildReviewText(BuildContext context, item) {
    switch (item['state']) {
      case 'APPROVED':
        return TextSpan(text: ' approved these changes');
      case 'COMMENTED':
        return TextSpan(text: ' reviewed ');
      default:
        return warningSpan;
    }
  }

  InlineSpan _buildLabel(p) {
    return WidgetSpan(
      child: MyLabel(
        name: p['label']['name'],
        cssColor: p['label']['color'],
      ),
    );
  }

  Widget _buildByType(BuildContext context, String type) {
    final theme = Provider.of<ThemeModel>(context);

    var defaultItem = TimelineEventItem(
      actor: '',
      iconData: Octicons.octoface,
      textSpan: TextSpan(children: [
        TextSpan(text: 'Woops, $type type not implemented yet'),
      ]),
      p: p,
    );

    switch (type) {
      // common types
      case 'PullRequestCommit':
        return TimelineEventItem(
          actor: p['prCommit']['author']['user'] == null
              ? null
              : p['prCommit']['author']['user']['login'],
          iconData: Octicons.git_commit,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added commit '),
            TextSpan(text: p['prCommit']['oid'].substring(0, 8))
          ]),
          p: p,
        );
      case 'IssueComment':
        return CommentItem.gh(p);
      case 'CrossReferencedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.primitive_dot,
          iconColor: GithubPalette.open,
          textSpan: TextSpan(
              text: ' referenced this on #' + p['source']['number'].toString()),
          p: p,
        );
      case 'ClosedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.circle_slash,
          iconColor: GithubPalette.closed,
          textSpan: TextSpan(text: ' closed this '),
          p: p,
        );

      case 'ReopenedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.primitive_dot,
          iconColor: GithubPalette.open,
          textSpan: TextSpan(text: ' reopened this '),
          p: p,
        );
      case 'SubscribedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          textSpan: TextSpan(text: ' subscribed to this issue '),
          p: p,
        );
      case 'UnsubscribedEvent':
        return TimelineEventItem( 
          actor: p['actor']['login'],
          textSpan: TextSpan(text: ' unsubscribed from this issue '),
          p: p,
        );
      case 'ReferencedEvent':
        // TODO: isCrossRepository
        if (p['commit'] == null) {
          return Container();
        }

        if(p['isCrossRepository']) {
          return TimelineEventItem(
            actor: p['actor']['login'],
            iconData: Octicons.bookmark,
            textSpan: TextSpan(children: [
              TextSpan(text: ' referenced this pull request from commit '),
              TextSpan(text: p['commit']['oid'].substring(0, 8)),
              TextSpan(text: ' from ' + p['commitRepository']['name']),
            ]),
            p: p,
          );
        }

        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.bookmark,
          textSpan: TextSpan(children: [
            TextSpan(text: ' referenced this pull request from commit '),
            TextSpan(text: p['commit']['oid'].substring(0, 8)),
          ]),
          p: p,
        );
      case 'AssignedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' assigned this to '),
            // TextSpan(text: p['user']['login'])
            // User field is depracated. Assignee should be used
            TextSpan(text: p['assignee']),
          ]),
          p: p,
        );
      case 'UnassignedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' unassigned this from '),
            TextSpan(text: p['assignee']),
          ]),
          p: p,
        );
      case 'LabeledEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added '),
            _buildLabel(p),
            TextSpan(text: ' label'),
          ]),
          p: p,
        );
      case 'UnlabeledEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' removed '),
            _buildLabel(p),
            TextSpan(text: ' label'),
          ]),
          p: p,
        );

      case 'MilestonedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.milestone,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added this to '),
            TextSpan(text: p['milestoneTitle']),
            TextSpan(text: ' milestone'),
          ]),
          p: p,
        );
      case 'DemilestonedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.milestone,
          textSpan: TextSpan(children: [
            TextSpan(text: ' removed this from '),
            TextSpan(text: p['milestoneTitle']),
            TextSpan(text: ' milestone'),
          ]),
          p: p,
        );
      case 'RenamedTitleEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.pencil,
          textSpan: TextSpan(children: [
            TextSpan(text: ' changed the title '),
            TextSpan(
              text: p['previousTitle'],
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            TextSpan(text: ' to '),
            TextSpan(text: p['currentTitle'])
          ]),
          p: p,
        );
      case 'LockedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.lock,
          textSpan: TextSpan(children: [
            TextSpan(text: ' locked this conversation '),
          ]),
          p: p,
        );
      case 'UnlockedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' unlocked this conversation '),
          ]),
          p: p,
        );

      // issue only types
      case 'TransferredEvent':
        return TimelineEventItem( 
          actor: p['actor']['login'],
          textSpan: TextSpan( 
            children: [
              TextSpan(text: ' transferred this issue from ' + p['fromRepository']['name'])
            ],
          ),
        );

      // pull request only types
      case 'CommitCommentThread':
        return defaultItem; // TODO:
      case 'PullRequestReview':
        return TimelineEventItem(
          actor: p['author']['login'],
          iconColor: GithubPalette.open,
          iconData: Octicons.check,
          textSpan: _buildReviewText(context, p),
          p: p,
        );
      case 'PullRequestReviewThread':
      case 'PullRequestReviewComment':
        return defaultItem; // TODO:
      case 'MergedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.git_merge,
          iconColor: GithubPalette.merged,
          textSpan: TextSpan(children: [
            TextSpan(text: ' merged commit '),
            TextSpan(text: p['commit']['oid'].substring(0, 8)),
            TextSpan(text: ' into '),
            TextSpan(text: p['mergeRefName']),
          ]),
          p: p,
        );
      case 'MentionedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.bookmark,
          textSpan: TextSpan(text: ' was mentioned '),
        );
      case 'PinnedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.pin,
          textSpan: TextSpan(text: ' pinned this issue '),
        );
      case 'DeployedEvent':
        return TimelineEventItem(  
          actor: p['actor']['login'],
          textSpan: TextSpan(text: ' deployed the pull request ' + p['pullRequest']['name']),
        );
      case 'DeploymentEnvironmentChangedEvent':
        return TimelineEventItem(  
          actor: p['actor']['login'],
          textSpan: TextSpan(text: ' changed the deployment environment to ' + p['deploymentStatus']['deployment']['environment']),
        );
      case 'HeadRefDeletedEvent':
        return TimelineEventItem(
          actor: p['actor']['login'],
          iconData: Octicons.git_branch,
          textSpan: TextSpan(children: [
            TextSpan(text: ' deleted the '),
            TextSpan(text: p['headRefName']),
            TextSpan(text: ' branch'),
          ]),
          p: p,
        );
      case 'HeadRefRestoredEvent':
        return TimelineEventItem(  
          actor: p['actor']['login'],
          textSpan: TextSpan(
            children: [
              TextSpan(text: ' restored the '),
              WidgetSpan(  
                child: PrimerBranchName(p['pullRequest']['headRef']['name'])
              ),
              TextSpan(text: ' branch')
            ]
          ),
        );
      case 'HeadRefForcePushedEvent':
        return TimelineEventItem(
          iconData: Octicons.repo_force_push,
          actor: p['actor']['login'],
          textSpan: TextSpan(
            children: [
              TextSpan(text: ' force-pushed the '),
              WidgetSpan(
                  child: PrimerBranchName(p['pullRequest']['headRef']['name'])),
              TextSpan(text: ' branch from '),
              TextSpan(
                text: (p['beforeCommit']['oid'] as String).substring(0, 7),
                style: TextStyle(color: theme.palette.primary),
              ),
              TextSpan(text: ' to '),
              TextSpan(
                text: (p['afterCommit']['oid'] as String).substring(0, 7),
                style: TextStyle(color: theme.palette.primary),
              ),
            ],
          ),
          p: p,
        );
      case 'BaseRefForcePushedEvent':
        return TimelineEventItem(
          iconData: Octicons.repo_force_push,
          actor: p['actor']['login'],
          textSpan: TextSpan(
            children: [
              TextSpan(text: ' force-pushed the '),
              WidgetSpan(
                  child: PrimerBranchName(p['pullRequest']['baseRef']['name'])),
              TextSpan(text: ' branch from '),
              TextSpan(
                text: (p['beforeCommit']['oid'] as String).substring(0, 7),
                style: TextStyle(color: theme.palette.primary),
              ),
              TextSpan(text: ' to '),
              TextSpan(
                text: (p['afterCommit']['oid'] as String).substring(0, 7),
                style: TextStyle(color: theme.palette.primary),
              ),
            ],
          ),
          p: p,
        );
      case 'ReviewRequestedEvent':
        return TimelineEventItem(
          iconData: Octicons.eye,
          actor: p['actor']['login'],
          textSpan: TextSpan(children: [
            TextSpan(text: ' requested a review from '),
            createUserSpan(context, p['requestedReviewer']['login']),
          ]),
          p: p,
        );
      case 'ReviewRequestRemovedEvent':
        return TimelineEventItem(
          iconData: Octicons.eye,
          actor: p['actor']['login'],
          textSpan: TextSpan(children: [
            TextSpan(text: ' removed '),
            createUserSpan(context, p['requestedReviewer']['login']),
            TextSpan(text: ' from the review request '),
          ]),
          p: p,
        );
      case 'ReviewDismissedEvent':
        return TimelineEventItem( 
          iconData: Octicons.eye,
          actor: p['actor']['login'],
          textSpan: TextSpan(children: [
            TextSpan(text: ' dismissed the pull request review requested by '),
            createUserSpan(context, p['pullRequest']['author']['login'])
          ]),
        );
      default:
        return defaultItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    final type = p['__typename'] as String;

    Widget widget = Container(
      padding: CommonStyle.padding,
      child: _buildByType(context, type),
    );

    if (type == 'PullRequestReview') {
      final comments = p['comments']['nodes'] as List;
      if (comments.isNotEmpty) {
        widget = Column(
          children: <Widget>[
            widget,
            Container(
              padding: CommonStyle.padding.copyWith(left: 50),
              child: Column(
                children: <Widget>[
                  for (var v in comments) CommentItem.gh(v),
                ],
              ),
            ),
          ],
        );
      }
    }

    return widget;
  }
}
