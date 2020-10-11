import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommitItem extends StatelessWidget {
  final String url;
  final String avatarUrl;
  final String avatarLink;
  final String message;
  final String author;
  final DateTime createdAt;
  final List<Widget> widgets;
  CommitItem({
    @required this.url,
    @required this.avatarUrl,
    @required this.avatarLink,
    @required this.message,
    @required this.author,
    @required this.createdAt,
    this.widgets,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Link(
      url: url,
      child: Container(
        padding: CommonStyle.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (avatarUrl != null) ...[
              Avatar(url: avatarUrl, linkUrl: avatarLink),
              SizedBox(width: 10),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 17,
                      color: theme.palette.text,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Text(author,
                          style: TextStyle(
                              fontSize: 15, color: theme.palette.primary)),
                      Text(
                        ' committed ${timeago.format(createdAt)}',
                        style: TextStyle(
                          color: theme.palette.secondaryText,
                          fontSize: 15,
                        ),
                      ),
                      if (widgets != null) ...widgets,
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
