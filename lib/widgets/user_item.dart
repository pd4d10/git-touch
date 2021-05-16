import 'package:flutter/material.dart';
import 'package:git_touch/graphql/github.data.gql.dart';
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

class GhBioWidget extends StatelessWidget {
  final GUserItem p;
  const GhBioWidget(this.p);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    if (isNotNullOrEmpty(p.company)) {
      return Row(
        children: <Widget>[
          Icon(
            Octicons.organization,
            size: 15,
            color: theme.palette.secondaryText,
          ),
          SizedBox(width: 4),
          Expanded(child: Text(p.company!, overflow: TextOverflow.ellipsis)),
        ],
      );
    }
    if (isNotNullOrEmpty(p.location)) {
      return Row(
        children: <Widget>[
          Icon(
            Octicons.location,
            size: 15,
            color: theme.palette.secondaryText,
          ),
          SizedBox(width: 4),
          Expanded(child: Text(p.location!, overflow: TextOverflow.ellipsis)),
        ],
      );
    }
    return Row(
      children: <Widget>[
        Icon(
          Octicons.clock,
          size: 15,
          color: theme.palette.secondaryText,
        ),
        SizedBox(width: 4),
        Expanded(
            child: Text('Joined on ${dateFormat.format(p.createdAt)}',
                overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}

class UserItem extends StatelessWidget {
  final String? login;
  final String? name;
  final String? avatarUrl;
  final Widget? bio;
  final String url;

  UserItem.github({
    required this.login,
    required this.name,
    required this.avatarUrl,
    required this.bio,
  }) : url = '/github/$login';

  UserItem.gql(GUserItem p)
      : login = p.login,
        name = p.name,
        avatarUrl = p.avatarUrl,
        url = '/github/' + p.login,
        bio = GhBioWidget(p);

  UserItem.gitlab({
    required this.login,
    required this.name,
    required this.avatarUrl,
    required this.bio,
    required int? id,
  }) : url = '/gitlab/user/$id';

  UserItem.gitlabGroup({
    required this.login,
    required this.name,
    required this.avatarUrl,
    required this.bio,
    required int? id,
  }) : url = '/gitlab/group/$id';

  UserItem.gitea({
    required this.login,
    required this.name,
    required this.avatarUrl,
    required this.bio,
  }) : url = '/gitea/$login';

  UserItem.gitee({
    required this.login,
    required this.name,
    required this.avatarUrl,
    required this.bio,
  }) : url = '/gitee/$login';

  UserItem.bitbucket({
    required this.login,
    required this.name,
    required this.avatarUrl,
    required this.bio,
  }) : url = '/bitbucket/$login?team=1';

  UserItem.gogs({
    required this.login,
    required this.name,
    required this.avatarUrl,
    required this.bio,
  }) : url = '/gogs/$login';

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return LinkWidget(
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
                      if (name != null && name!.isNotEmpty) ...[
                        Text(
                          name!,
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
                          login!,
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
                      child: bio!,
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
