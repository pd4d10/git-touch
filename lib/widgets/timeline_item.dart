import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/utils.dart';
import 'comment_item.dart';
import 'user_name.dart';

class TimelineItem extends StatelessWidget {
  final Map<String, dynamic> payload;

  TimelineItem(this.payload);

  TextSpan _buildReviewText(BuildContext context, item) {
    switch (item['state']) {
      case 'APPROVED':
        return TextSpan(text: ' approved these changes');
      case 'COMMENTED':
        return TextSpan(text: ' commented ');
      default:
        return warningSpan;
    }
  }

  Widget _buildItem({
    String actor,
    IconData iconData = Octicons.octoface,
    Color iconColor = Palette.gray,
    TextSpan textSpan,
    item,
  }) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 6)),
        Icon(iconData, color: iconColor, size: 20),
        Padding(padding: EdgeInsets.only(left: 12)),
        Expanded(
          child: RichText(
            text: TextSpan(style: TextStyle(color: Colors.black), children: [
              // TODO: actor is null
              createUserSpan(actor),
              textSpan,
              // TextSpan(text: ' ' + TimeAgo.formatFromString(item['createdAt']))
            ]),
          ),
        ),
      ],
    );
  }

  TextSpan _buildLabel(item) {
    var color = convertColor(item['label']['color']);
    var grayscale = color.red * 0.3 + color.green * 0.59 + color.blue * 0.11;
    // print('color: $color, $grayscale');

    var showWhite = grayscale < 128;
    var textColor = showWhite ? Colors.white : Colors.black;

    return TextSpan(
      text: item['label']['name'],
      style: TextStyle(
        color: textColor,
        // https://github.com/flutter/flutter/issues/20430
        background: Paint()..color = color,
        // https://stackoverflow.com/a/52592679
        // ..strokeWidth = 16.5
        // ..style = PaintingStyle.stroke
      ),
    );
  }

  Widget _buildByType(BuildContext context) {
    String type = payload['__typename'];

    var defaultItem = _buildItem(
      actor: '',
      iconData: Octicons.octoface,
      textSpan: TextSpan(children: [
        TextSpan(text: 'Woops, $type type not implemented yet'),
      ]),
      item: payload,
    );

    switch (type) {
      // common types
      case 'Commit':
        return _buildItem(
          actor: payload['author']['user'] == null
              ? null
              : payload['author']['user']['login'],
          iconData: Octicons.git_commit,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added commit '),
            TextSpan(text: payload['oid'].substring(0, 8))
          ]),
          item: payload,
        );
      case 'IssueComment':
        return CommentItem(payload);
      case 'CrossReferencedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.primitive_dot,
          iconColor: Palette.green,
          textSpan: TextSpan(
              text: ' referenced this on #' +
                  payload['source']['number'].toString()),
          item: payload,
        );
      case 'ClosedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.circle_slash,
          iconColor: Palette.red,
          textSpan: TextSpan(text: ' closed this '),
          item: payload,
        );

      case 'ReopenedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.primitive_dot,
          iconColor: Palette.green,
          textSpan: TextSpan(text: ' reopened this '),
          item: payload,
        );
      case 'SubscribedEvent':
      case 'UnsubscribedEvent':
        return defaultItem; // TODO:
      case 'ReferencedEvent':
        // TODO: isCrossRepository
        if (payload['commit'] == null) {
          return Container();
        }

        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.bookmark,
          textSpan: TextSpan(children: [
            TextSpan(text: ' referenced this pull request from commit '),
            TextSpan(text: payload['commit']['oid'].substring(0, 8)),
          ]),
          item: payload,
        );
      case 'AssignedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' assigned this to '),
            TextSpan(text: payload['user']['login'])
          ]),
          item: payload,
        );
      case 'UnassignedEvent':
        return defaultItem; // TODO:
      case 'LabeledEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added '),
            _buildLabel(payload),
            TextSpan(text: ' label'),
          ]),
          item: payload,
        );
      case 'UnlabeledEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' removed '),
            _buildLabel(payload),
            TextSpan(text: ' label'),
          ]),
          item: payload,
        );

      case 'MilestonedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.milestone,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added this to '),
            TextSpan(text: payload['milestoneTitle']),
            TextSpan(text: ' milestone'),
          ]),
          item: payload,
        );
      case 'DemilestonedEvent':
        return defaultItem; // TODO:
      case 'RenamedTitleEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.pencil,
          textSpan: TextSpan(children: [
            TextSpan(text: ' changed the title '),
            TextSpan(
              text: payload['previousTitle'],
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            TextSpan(text: ' to '),
            TextSpan(text: payload['currentTitle'])
          ]),
          item: payload,
        );
      case 'LockedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.lock,
          textSpan: TextSpan(children: [
            TextSpan(text: ' locked this conversation '),
          ]),
          item: payload,
        );
      case 'UnlockedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' unlocked this conversation '),
          ]),
          item: payload,
        );

      // issue only types
      case 'TransferredEvent':
        return defaultItem; // TODO:

      // pull request only types
      case 'CommitCommentThread':
        return defaultItem; // TODO:
      case 'PullRequestReview':
        return _buildItem(
          actor: payload['author']['login'],
          iconColor: Color(0xff28a745),
          iconData: Octicons.check,
          textSpan: _buildReviewText(context, payload),
          item: payload,
        );
      case 'PullRequestReviewThread':
      case 'PullRequestReviewComment':
        return defaultItem; // TODO:
      case 'MergedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.git_merge,
          iconColor: Color(0xff6f42c1),
          textSpan: TextSpan(children: [
            TextSpan(text: ' merged commit '),
            TextSpan(text: payload['commit']['oid'].substring(0, 8)),
            TextSpan(text: ' into '),
            TextSpan(text: payload['mergeRefName']),
          ]),
          item: payload,
        );
      case 'DeployedEvent':
      case 'DeploymentEnvironmentChangedEvent':
        return defaultItem; // TODO:
      case 'HeadRefDeletedEvent':
        return _buildItem(
          actor: payload['actor']['login'],
          iconData: Octicons.git_branch,
          textSpan: TextSpan(children: [
            TextSpan(text: ' deleted the '),
            TextSpan(text: payload['headRefName']),
            TextSpan(text: ' branch'),
          ]),
          item: payload,
        );
      case 'HeadRefRestoredEvent':
      case 'HeadRefForcePushedEvent':
      case 'BaseRefForcePushedEvent':
        return defaultItem; // TODO:
      case 'ReviewRequestedEvent':
        return _buildItem(
          iconData: Octicons.eye,
          // actor: payload['author']['login'],
          // TODO:
          actor: 'test',
          textSpan: TextSpan(children: [
            TextSpan(text: ' requested a review from '),
            createUserSpan(payload['requestedReviewer']['login']),
          ]),
          item: payload,
        );
      case 'ReviewRequestRemovedEvent':
      case 'ReviewDismissedEvent':
        return defaultItem; // TODO:
      default:
        return defaultItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: _buildByType(context),
    );
  }
}
