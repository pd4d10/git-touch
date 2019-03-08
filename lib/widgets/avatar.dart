import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/user.dart';
import 'link.dart';

class Avatar extends StatelessWidget {
  final String login;
  final String url;
  final double size;

  Avatar({
    @required this.login,
    @required this.url,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Link(
      screenBuilder: (_) => UserScreen(login),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: FadeInImage.assetNetwork(
          placeholder: 'images/octoface.png',
          image: url,
          width: 2 * size,
          height: 2 * size,
          fadeInDuration: Duration(milliseconds: 200),
          fadeOutDuration: Duration(milliseconds: 100),
        ),
      ),
      material: false,
    );
  }
}
