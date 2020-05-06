import 'package:flutter/material.dart';
import 'package:git_touch/models/github.dart';
// import 'package:git_touch/models/github.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';
import 'package:github/src/const/language_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class GistsItem extends StatelessWidget {
  final String description;
  final String login;
  final Map<String, GistFiles> files;
  final List<dynamic> filenames;
  final String language;
  final String avatarUrl;
  final DateTime updatedAt;
  final String id;
  // final DateTime createdAt;

  GistsItem({
    @required this.description,
    @required this.login,
    @required this.files,
    @required this.filenames,
    @required this.language,
    @required this.avatarUrl,
    @required this.updatedAt,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    print(language);
    return Link(
      url: '/$login/gists/$id',
      child: Container(
        padding: CommonStyle.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Avatar(
                        url: avatarUrl,
                        size: AvatarSize.small,
                        linkUrl: '/$login',
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: '$login / ',
                              style: TextStyle(
                                fontSize: 18,
                                color: theme.palette.primary,
                              ),
                            ),
                            TextSpan(
                              text: filenames[0].filename,
                              style: TextStyle(
                                fontSize: 18,
                                color: theme.palette.primary,
                                fontWeight: FontWeight.w600,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  if (description != null && description.isNotEmpty) ...[
                    Text(
                      description,
                      style: TextStyle(
                        color: theme.palette.secondaryText,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                  if (updatedAt != null) ...[
                    Text(
                      'Updated ${timeago.format(updatedAt)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.palette.tertiaryText,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                  DefaultTextStyle(
                    style: TextStyle(color: theme.palette.text, fontSize: 14),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            // Error in color: convertColor(langauge ?? languagesColor[language]),
                            color: convertColor(languagesColor[language]),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          language,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
