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
    this.size = 18,
    this.login,
  });

  @override
  Widget build(BuildContext context) {
    var avatar = ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: FadeInImage.assetNetwork(
        placeholder: 'images/octoface.png',
        image: url,
        width: 2 * size,
        height: 2 * size,
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
