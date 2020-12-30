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
  final String url;

  UserItem.github({
    @required this.login,
    @required this.name,
    @required this.avatarUrl,
    @required this.bio,
  }) : url = '/github/$login';

  UserItem.gitlab({
    @required this.login,
    @required this.name,
    @required this.avatarUrl,
    @required this.bio,
    @required int id,
  }) : url = '/gitlab/user/$id';

  UserItem.gitlabGroup({
    @required this.login,
    @required this.name,
    @required this.avatarUrl,
    @required this.bio,
    @required int id,
  }) : url = '/gitlab/group/$id';

  UserItem.gitea({
    @required this.login,
    @required this.name,
    @required this.avatarUrl,
    @required this.bio,
  }) : url = '/gitea/$login';

  UserItem.gitee({
    @required this.login,
    @required this.name,
    @required this.avatarUrl,
    @required this.bio,
  }) : url = '/gitee/$login';

  UserItem.bitbucket({
    @required this.login,
    @required this.name,
    @required this.avatarUrl,
    @required this.bio,
  }) : url = '/bitbucket/$login?team=1';

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
            Avatar(url: avatarUrl, size: AvatarSize.large),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      if (name != null && name.isNotEmpty) ...[
                        Text(
                          name,
                          style: TextStyle(
                            color: theme.palette.text,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                      Expanded(
                        child: Text(
                          login,
                          style: TextStyle(
                            color: theme.palette.text,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  if (bio != null)
                    DefaultTextStyle(
                      style: TextStyle(
                        color: theme.palette.secondaryText,
                        fontSize: 16,
                      ),
                      child: bio,
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
