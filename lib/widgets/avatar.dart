import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/image_view.dart';
import 'package:provider/provider.dart';

class Avatar extends StatelessWidget {
  final String url;
  final double size;

  Avatar({
    @required this.url,
    @required this.size,
  });
  Avatar.extraSmall({
    @required this.url,
  }) : size = 16;
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
          image: url,
          width: size,
          height: size,
          fadeInDuration: Duration(milliseconds: 200),
          fadeOutDuration: Duration(milliseconds: 100),
        ),
      ),
      onTap: () {
        Provider.of<ThemeModel>(context)
            .pushRoute(context, (_) => ImageView(url), fullscreenDialog: true);
      },
    );
  }
}
