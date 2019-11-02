import 'package:flutter/material.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../utils/utils.dart';
import '../widgets/link.dart';
import '../screens/issue.dart';

const issueGqlChunk = '''
number
title
updatedAt
author {
  login
  avatarUrl
}
repository {
  owner {
    login
  }
  name
}
labels(first: 10) {
  nodes {
    name
    color
  }
}
comments {
  totalCount
}
''';

class IssueItem extends StatelessWidget {
  final payload;
  final bool isPullRequest;

  IssueItem({this.payload, this.isPullRequest = false});

  @override
  Widget build(BuildContext context) {
    return Link(
      screenBuilder: (context) {
        return IssueScreen(
          payload['repository']['owner']['login'] as String,
          payload['repository']['name'] as String,
          payload['number'] as int,
          isPullRequest: isPullRequest,
        );
      },
      child: Container(
        padding: CommonStyle.padding,
        // color: payload.unread ? Colors.white : Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                    isPullRequest
                        ? Octicons.git_pull_request
                        : Octicons.issue_opened,
                    color: Palette.green,
                    size: 18),
                SizedBox(width: 6),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: join(SizedBox(height: 8), [
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(text: payload['title'] + ' '),
                            TextSpan(
                              text: '#${payload['number']}',
                              style: TextStyle(color: PrimerColors.gray500),
                            ),
                          ]),
                          style: TextStyle(
                            fontSize: 16,
                            color: PrimerColors.blue500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if ((payload['labels']['nodes'] as List).isNotEmpty)
                          Wrap(
                            spacing: 2,
                            runSpacing: 2,
                            children: (payload['labels']['nodes'] as List)
                                .map((label) {
                              final color = convertColor(label['color']);
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 3),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                child: Text(
                                  label['name'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: getFontColorByBrightness(color),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 13, color: PrimerColors.gray700),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // FIXME: Deleted user
                              if (payload['author'] != null) ...[
                                Link(
                                  child: Avatar.extraSmall(
                                      url: payload['author']['avatarUrl']),
                                  screenBuilder: (_) =>
                                      UserScreen(payload['author']['login']),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  payload['author']['login'],
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                              Text(' opened ' +
                                  timeago.format(
                                      DateTime.parse(payload['updatedAt']))),
                              if (payload['comments']['totalCount'] > 0) ...[
                                Expanded(child: SizedBox()),
                                Icon(Octicons.comment,
                                    size: 13, color: PrimerColors.gray700),
                                SizedBox(width: 4),
                                Text(numberFormat
                                    .format(payload['comments']['totalCount']))
                              ],
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                // Column(
                //   children: <Widget>[
                //     Icon(Octicons.check, color: Colors.black45),
                //     Icon(Octicons.unmute, color: Colors.black45)
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
