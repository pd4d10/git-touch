import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/widgets.dart';

class TimelineItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Map<String, dynamic> payload;

  TimelineItem(this.item, this.payload);

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
    int iconColor = Palette.gray,
    TextSpan textSpan,
    item,
  }) {
    return Row(
      children: <Widget>[
        Icon(iconData, color: Color(iconColor), size: 16),
        Padding(padding: EdgeInsets.only(left: 4)),
        Expanded(
          child: RichText(
            text: TextSpan(style: TextStyle(color: Colors.black), children: [
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
    var textColor = item['label']['color'] == 'fbca04' ? null : Colors.white;

    return TextSpan(
      text: item['label']['name'],
      style: TextStyle(
          color: textColor,
          // https://github.com/flutter/flutter/issues/20430
          background: Paint()
            ..color = Color(int.parse('ff' + item['label']['color'], radix: 16))
          // https://stackoverflow.com/a/52592679
          // ..strokeWidth = 16.5
          // ..style = PaintingStyle.stroke
          ),
    );
  }

  Widget _buildByType(BuildContext context) {
    switch (item['__typename']) {
      case 'IssueComment':
        return Text('comment');
      // return CommentItem(item);
      case 'ReferencedEvent':
        // TODO: isCrossRepository
        if (item['commit'] == null) {
          return Container();
        }

        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.bookmark,
          textSpan: TextSpan(children: [
            TextSpan(text: ' referenced this pull request from commit '),
            TextSpan(text: item['commit']['oid'].substring(0, 8)),
          ]),
          item: item,
        );
      case 'RenamedTitleEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.pencil,
          textSpan: TextSpan(children: [
            TextSpan(text: ' changed the title '),
            TextSpan(
              text: item['previousTitle'],
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            TextSpan(text: ' to '),
            TextSpan(text: item['currentTitle'])
          ]),
          item: item,
        );
      case 'ClosedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.circle_slash,
          iconColor: Palette.red,
          textSpan: TextSpan(text: ' closed this '),
          item: item,
        );
      case 'ReopenedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.primitive_dot,
          iconColor: Palette.green,
          textSpan: TextSpan(text: ' reopened this '),
          item: item,
        );
      case 'CrossReferencedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.primitive_dot,
          iconColor: Palette.green,
          textSpan: TextSpan(
              text: ' referenced this on #' +
                  item['source']['number'].toString()),
          item: item,
        );
      case 'LabeledEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added '),
            _buildLabel(item),
            TextSpan(text: ' label'),
          ]),
          item: item,
        );
      case 'UnlabeledEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.tag,
          textSpan: TextSpan(children: [
            TextSpan(text: ' removed '),
            _buildLabel(item),
            TextSpan(text: ' label'),
          ]),
          item: item,
        );
      case 'MilestonedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.milestone,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added this to '),
            TextSpan(text: item['milestoneTitle']),
            TextSpan(text: ' milestone'),
          ]),
          item: item,
        );
      case 'LockedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.lock,
          textSpan: TextSpan(children: [
            TextSpan(text: ' locked this conversation '),
          ]),
          item: item,
        );
      case 'UnlockedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' unlocked this conversation '),
          ]),
          item: item,
        );
      case 'AssignedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.key,
          textSpan: TextSpan(children: [
            TextSpan(text: ' assigned this to '),
            TextSpan(text: item['user']['login'])
          ]),
          item: item,
        );

      //
      case 'ReviewRequestedEvent':
        return _buildItem(
          iconData: Octicons.eye,
          actor: payload['author']['login'],
          textSpan: TextSpan(children: [
            TextSpan(text: ' requested a review from '),
            createUserSpan(item['requestedReviewer']['login']),
          ]),
          item: item,
        );
      case 'PullRequestReview':
        return _buildItem(
          actor: item['author']['login'],
          iconColor: 0xff28a745,
          iconData: Octicons.check,
          textSpan: _buildReviewText(context, item),
          item: item,
        );
      case 'MergedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.git_merge,
          iconColor: 0xff6f42c1,
          textSpan: TextSpan(children: [
            TextSpan(text: ' merged commit '),
            TextSpan(text: item['commit']['oid'].substring(0, 8)),
            TextSpan(text: ' into '),
            TextSpan(text: item['mergeRefName']),
          ]),
          item: item,
        );
      case 'HeadRefDeletedEvent':
        return _buildItem(
          actor: item['actor']['login'],
          iconData: Octicons.git_branch,
          textSpan: TextSpan(children: [
            TextSpan(text: ' deleted the '),
            TextSpan(text: item['headRefName']),
            TextSpan(text: ' branch'),
          ]),
          item: item,
        );
      case 'Commit':
        return _buildItem(
          actor: item['author']['user']['login'],
          iconData: Octicons.git_commit,
          textSpan: TextSpan(children: [
            TextSpan(text: ' added commit '),
            TextSpan(text: item['oid'].substring(0, 8))
          ]),
          item: item,
        );
      default:
        return createWarning(item['__typename']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: CupertinoColors.extraLightBackgroundGray))),
      child: _buildByType(context),
    );
  }
}
