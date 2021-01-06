import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../utils/utils.dart';
import '../widgets/link.dart';

const issueGqlChunk = '''
url
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
  final String url;
  final String subtitle;
  final String title;
  final int commentCount;
  final DateTime updatedAt;
  final String avatarUrl;
  final String author;
  final Widget labels;
  final bool isPr;

  IssueItem({
    @required this.url,
    @required this.subtitle,
    @required this.title,
    @required this.commentCount,
    @required this.updatedAt,
    @required this.avatarUrl,
    @required this.author,
    this.labels,
    this.isPr = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return Link(
      url: url,
      child: Container(
        padding: CommonStyle.padding,
        // color: payload.unread ? Colors.white : Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(isPr ? Octicons.git_pull_request : Octicons.issue_opened,
                    color: GithubPalette.open, size: 20),
                SizedBox(width: 6),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: join(SizedBox(height: 8), [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: '$title '),
                              TextSpan(
                                text: '$subtitle',
                                style: TextStyle(
                                  color: theme.palette.tertiaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(
                            fontSize: 17,
                            color: theme.palette.text,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (labels != null) labels,
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 14,
                            color: theme.palette.secondaryText,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // FIXME: Deleted user
                              if (avatarUrl != null) ...[
                                Avatar(
                                  size: AvatarSize.extraSmall,
                                  url: avatarUrl,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  author,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                              Expanded(
                                  child: Text(
                                ' opened ' + timeago.format(updatedAt),
                                style: TextStyle(
                                  fontSize: 17,
                                  color: theme.palette.secondaryText,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )),
                              if (commentCount > 0) ...[
                                Expanded(child: SizedBox()),
                                Icon(Octicons.comment,
                                    size: 14,
                                    color: theme.palette.secondaryText),
                                SizedBox(width: 3),
                                Text(numberFormat.format(commentCount))
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
