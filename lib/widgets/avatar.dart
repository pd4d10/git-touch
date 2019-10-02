import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/user.dart';
import 'link.dart';

class Avatar extends StatelessWidget {
  final String url;
  final String login;
  final double size;

  Avatar({
    @required this.url,
    this.login,
    @required this.size,
  });
  Avatar.extraSmall({
    @required this.url,
    this.login,
  }) : size = 16;
  Avatar.small({
    @required this.url,
    this.login,
  }) : size = 24;
  Avatar.medium({
    @required this.url,
    this.login,
  }) : size = 36;
  Avatar.large({
    @required this.url,
    this.login,
  }) : size = 48;

  @override
  Widget build(BuildContext context) {
    var avatar = ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: FadeInImage.assetNetwork(
        placeholder: 'images/octoface.png',
        image: url,
        width: size,
        height: size,
        fadeInDuration: Duration(milliseconds: 200),
        fadeOutDuration: Duration(milliseconds: 100),
      ),
    );

    if (login == null) {
      return avatar;
    } else {
      return Link(
        screenBuilder: (_) => UserScreen(login),
        child: avatar,
      );
    }
  }
}
