import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

class AvatarSize {
  static const double extraSmall = 20;
  static const double small = 24;
  static const double medium = 36;
  static const double large = 48;
  static const double extraLarge = 64;
}

class Avatar extends StatelessWidget {
  const Avatar({
    required this.url,
    this.size = AvatarSize.medium,
    this.linkUrl,
    this.square = true,
  });
  final String? url;
  final double size;
  final String? linkUrl;
  final bool square;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final fallback = theme.brightness == Brightness.light
        ? 'images/avatar.png'
        : 'images/avatar-dark.png';

    final fallbackWidget = Image.asset(fallback, width: size, height: size);

    final widget = ClipRRect(
      borderRadius: BorderRadius.circular(square ? 4 : size),
      child: url == null
          ? fallbackWidget
          : FadeInImage.assetNetwork(
              placeholder: fallback,
              image: url!,
              width: size,
              height: size,
              fadeInDuration: const Duration(milliseconds: 200),
              fadeOutDuration: const Duration(milliseconds: 100),
              imageErrorBuilder: (_, __, ___) {
                Fimber.e('image error: ${url!}');
                return fallbackWidget;
              },
            ),
    );
    if (linkUrl == null) return widget;
    return LinkWidget(
      child: widget,
      onTap: () {
        context.pushUrl(linkUrl!);
      },
    );
  }
}
