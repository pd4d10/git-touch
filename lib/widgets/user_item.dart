import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

const userGqlChunk = '''
  login
  name
  avatarUrl
  bio
''';

class UserItem extends StatelessWidget {
  final String login;
  final String name;
  final String avatarUrl;
  final Widget bio;
  final bool inUserScreen;

  UserItem({
    this.login,
    this.name,
    this.avatarUrl,
    this.bio,
    this.inUserScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    final widget = Container(
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
                      name ?? login,
                      style: TextStyle(
                        color: theme.palette.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '($login)',
                      style: TextStyle(
                          color: theme.palette.secondaryText, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                if (bio != null)
                  DefaultTextStyle(
                    style: TextStyle(
                      color: theme.palette.secondaryText,
                      fontSize: 15,
                    ),
                    child: bio,
                  ),
              ],
            ),
          )
        ],
      ),
    );

    if (inUserScreen) {
      return widget;
    } else {
      return Link(url: '/$login', child: widget);
    }
  }
}
