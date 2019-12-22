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

  Avatar.large({
    @required this.url,
  }) : size = 48;

  Avatar({this.url, this.size = AvatarSize.medium});

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
        // Provider.of<ThemeModel>(context).push(
        //     context, '/$login');
      },
    );
  }
}
