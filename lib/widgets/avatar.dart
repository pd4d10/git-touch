import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class AvatarSize {
  static const double extraSmall = 20;
  static const double small = 24;
  static const double medium = 36;
  static const double large = 48;
}

class Avatar extends StatelessWidget {
  final String url;
  final double size;
  final String linkUrl;

  Avatar({
    @required this.url,
    this.size = AvatarSize.medium,
    this.linkUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: FadeInImage.assetNetwork(
          placeholder: 'images/avatar.png',
          image: url ?? 'images/avatar.png',
          width: size,
          height: size,
          fadeInDuration: Duration(milliseconds: 200),
          fadeOutDuration: Duration(milliseconds: 100),
        ),
      ),
      onTap: () {
        if (linkUrl != null)
          Provider.of<ThemeModel>(context).push(context, linkUrl);
      },
    );
  }
}

class GithubAvatar extends StatelessWidget {
  final String url;
  final double size;
  final String login;

  GithubAvatar({
    @required this.url,
    this.size = AvatarSize.medium,
    this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Avatar(url: url, size: size, linkUrl: '/$login');
  }
}

class GitlabAvatar extends StatelessWidget {
  final String url;
  final double size;
  final String login;

  GitlabAvatar({
    @required this.url,
    this.size = AvatarSize.medium,
    this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Avatar(url: url, size: size, linkUrl: '/$login');
  }
}
