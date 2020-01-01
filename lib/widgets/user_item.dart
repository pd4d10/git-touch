import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/text_contains_organization.dart';
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
  final String bio;
  final bool inUserScreen;

  UserItem({
    this.login,
    this.name,
    this.avatarUrl,
    this.bio,
    this.inUserScreen = false,
  });
  UserItem.fromData(
    data, {
    this.inUserScreen = false,
  })  : login = data['login'],
        name = data['name'],
        avatarUrl = data['avatarUrl'],
        bio = data['bio'];

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    final widget = Container(
      padding: CommonStyle.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Avatar(url: avatarUrl, size: AvatarSize.large),
          SizedBox(width: 10),
          Expanded(
            child: Column(
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
                if (bio != null && bio.isNotEmpty)
                  TextContainsOrganization(
                    bio,
                    style: TextStyle(
                      color: theme.palette.secondaryText,
                      fontSize: 15,
                    ),
                    oneLine: true,
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
