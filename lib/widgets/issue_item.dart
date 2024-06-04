import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

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
  const IssueItem({
    required this.url,
    required this.subtitle,
    required this.title,
    required this.commentCount,
    required this.updatedAt,
    required this.avatarUrl,
    required this.author,
    this.labels,
    this.isPr = true,
  });
  final String? url;
  final String subtitle;
  final String? title;
  final int? commentCount;
  final DateTime? updatedAt;
  final String? avatarUrl;
  final String? author;
  final Widget? labels;
  final bool isPr;

  @override
  Widget build(BuildContext context) {
    return AntListItem(
      arrow: null,
      onClick: () {
        context.pushUrl(url!);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(isPr ? Octicons.git_pull_request : Octicons.issue_opened,
              color: GithubPalette.open, size: 20),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '$title '),
                      TextSpan(
                        text: subtitle,
                        style: TextStyle(
                          color: AntTheme.of(context).colorWeak,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontSize: 17,
                    color: AntTheme.of(context).colorText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (labels != null) labels!,
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 14,
                    color: AntTheme.of(context).colorTextSecondary,
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
                        const SizedBox(width: 4),
                        Text(
                          author!,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                      Expanded(
                          child: Text(
                        ' opened ${timeago.format(updatedAt!)}',
                        style: TextStyle(
                          fontSize: 17,
                          color: AntTheme.of(context).colorTextSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )),
                      if (commentCount! > 0) ...[
                        const Expanded(child: SizedBox()),
                        Icon(Octicons.comment,
                            size: 14,
                            color: AntTheme.of(context).colorTextSecondary),
                        const SizedBox(width: 3),
                        Text(numberFormat.format(commentCount))
                      ],
                    ],
                  ),
                )
              ].withSeparator(const SizedBox(height: 8)),
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
    );
  }
}
