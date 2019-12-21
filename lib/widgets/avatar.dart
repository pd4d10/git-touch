import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/image_view.dart';
import 'package:provider/provider.dart';

class Avatar extends StatelessWidget {
  final String url;
  final double size;

  Avatar.extraSmall({
    @required this.url,
  }) : size = 20;
  Avatar.small({@required this.url}) : size = 24;
  Avatar.medium({
    @required this.url,
  }) : size = 36;
  Avatar.large({
    @required this.url,
  }) : size = 48;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: FadeInImage.assetNetwork(
          placeholder: 'images/octoface.png',
          image: url ?? 'images/octoface.png',
          width: size,
          height: size,
          fadeInDuration: Duration(milliseconds: 200),
          fadeOutDuration: Duration(milliseconds: 100),
        ),
      ),
      onTap: () {
        // TODO:
        // Provider.of<ThemeModel>(context).pushRoute(
        //     context, (_) => ImageViewScreen(url),
        //     fullscreenDialog: true);
      },
    );
  }
}
