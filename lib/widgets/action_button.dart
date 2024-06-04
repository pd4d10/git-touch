import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ActionItem {
  ActionItem({
    required this.text,
    this.onTap,
    this.danger = true,
  });
  String? text;
  bool danger;
  void Function(BuildContext context)? onTap;

  static List<ActionItem> getUrlActions(String? url) {
    return [
      ActionItem(
        text: 'Share',
        onTap: (_) {
          Share.share(url!);
        },
      ),
      ActionItem(
        text: 'Open in Browser',
        onTap: (_) {
          launchStringUrl(url);
        },
      ),
    ];
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.title,
    required this.items,
    this.iconData = Ionicons.ellipsis_horizontal,
    this.selected,
  });

  final String title;
  final List<ActionItem> items;
  final IconData iconData;
  final int? selected;
  // TODO: selected, font bold

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: () async {
        await theme.showActions(context, items);
      },
      child: Icon(iconData, size: 22),
    );
  }
}
