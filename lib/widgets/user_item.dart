import 'package:flutter/material.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/text_contains_organization.dart';
import 'package:primer/primer.dart';

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
    return Link(
      screenBuilder: inUserScreen ? null : (_) => UserScreen(login),
      child: Container(
        padding: CommonStyle.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Avatar.large(url: avatarUrl),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        name ?? login,
                        style: TextStyle(
                          color: PrimerColors.blue500,
                          fontSize: inUserScreen ? 18 : 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        login,
                        style: TextStyle(
                            color: PrimerColors.gray700,
                            fontSize: inUserScreen ? 16 : 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  if (bio != null && bio.isNotEmpty)
                    TextContainsOrganization(
                      bio,
                      style: TextStyle(
                          color: PrimerColors.gray700,
                          fontSize: inUserScreen ? 15 : 14),
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
