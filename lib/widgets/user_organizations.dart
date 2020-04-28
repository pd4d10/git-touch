import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

class UserOrganizationItem extends StatelessWidget {
  final String login;
  final String avatarUrl;
  final String url;
  final String description;

  UserOrganizationItem({
    @required this.login,
    @required this.avatarUrl,
    @required this.url,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Link(
      url: url,
      child: Container(
        padding: CommonStyle.padding,
        child: Row(
          children: <Widget>[
            Avatar(url: avatarUrl, size: AvatarSize.large),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        login,
                        style: TextStyle(
                          color: theme.palette.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          description,
                          style: TextStyle(
                            color: theme.palette.secondaryText,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
