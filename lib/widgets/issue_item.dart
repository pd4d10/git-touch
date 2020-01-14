import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/label.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../utils/utils.dart';
import '../widgets/link.dart';

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
    final theme = Provider.of<ThemeModel>(context);

    return Link(
      url:
          '/${payload['repository']['owner']['login']}/${payload['repository']['name']}/${isPullRequest ? 'pulls' : 'issues'}/${payload['number']}',
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
                    color: GithubPalette.open,
                    size: 20),
                SizedBox(width: 6),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: join(SizedBox(height: 8), [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: payload['title'] + ' '),
                              TextSpan(
                                text: '#${payload['number']}',
                                style: TextStyle(
                                  color: theme.paletteOf(context).tertiaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(
                            fontSize: 17,
                            color: theme.paletteOf(context).text,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if ((payload['labels']['nodes'] as List).isNotEmpty)
                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: (payload['labels']['nodes'] as List)
                                .map((label) {
                              return MyLabel(
                                name: label['name'],
                                cssColor: label['color'],
                              );
                            }).toList(),
                          ),
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 14,
                            color: theme.paletteOf(context).secondaryText,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // FIXME: Deleted user
                              if (payload['author'] != null) ...[
                                Avatar(
                                  size: AvatarSize.extraSmall,
                                  url: payload['author']['avatarUrl'],
                                  linkUrl: '/' + payload['author']['login'],
                                ),
                                SizedBox(width: 4),
                                Text(
                                  payload['author']['login'],
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                              Text(' opened ' +
                                  timeago.format(
                                      DateTime.parse(payload['updatedAt']))),
                              if (payload['comments']['totalCount'] > 0) ...[
                                Expanded(child: SizedBox()),
                                Icon(Octicons.comment,
                                    size: 14,
                                    color:
                                        theme.paletteOf(context).secondaryText),
                                SizedBox(width: 3),
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
