import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import 'link.dart';

class RepositoryItem extends StatelessWidget {
  final String owner;
  final String avatarUrl;
  final String name;
  final String description;
  final IconData iconData;
  final int starCount;
  final int forkCount;
  final String primaryLanguageName;
  final String primaryLanguageColor;

  RepositoryItem(
    this.owner,
    this.avatarUrl,
    this.name,
    this.description,
    this.iconData,
    this.starCount,
    this.forkCount,
    this.primaryLanguageName,
    this.primaryLanguageColor,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Link(
      url: '/$owner/$name',
      child: Container(
        padding: CommonStyle.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Avatar(url: avatarUrl, size: AvatarSize.small, linkUrl: '/$owner'),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: join(SizedBox(height: 8), <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text(
                              owner + ' / ',
                              style: TextStyle(
                                fontSize: 17,
                                color: theme.palette.primary,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                name,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: theme.palette.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(iconData,
                          size: 17, color: theme.palette.tertiaryText),
                    ],
                  ),
                  if (description != null && description.isNotEmpty)
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.palette.secondaryText,
                        fontSize: 15,
                      ),
                    ),
                  DefaultTextStyle(
                    style: TextStyle(color: theme.palette.text, fontSize: 13),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: convertColor(primaryLanguageColor),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                primaryLanguageName ?? 'Unknown',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ]),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Octicons.star,
                                  size: 14, color: theme.palette.text),
                              Text(numberFormat.format(starCount)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Octicons.repo_forked,
                                  size: 14, color: theme.palette.text),
                              Text(numberFormat.format(forkCount)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
