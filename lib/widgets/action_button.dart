import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:share/share.dart';

class ActionItem {
  String text;
  void Function() onPress;
  IconData iconData;

  ActionItem({
    @required this.text,
    @required this.onPress,
    this.iconData,
  });

  ActionItem.share(String url)
      : text = 'Share',
        onPress = (() {
          Share.share(url);
        });
  ActionItem.launch(String url)
      : text = 'Open in Browser',
        onPress = (() {
          launchUrl(url);
        });
}

class ActionButton extends StatelessWidget {
  final String title;
  final List<ActionItem> items;
  final IconData iconData;

  ActionButton({
    @required this.title,
    @required this.items,
    this.iconData = Icons.more_vert,
  });

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return GestureDetector(
          child: Icon(iconData, size: 22),
          onTap: () async {
            var value = await showCupertinoModalPopup<int>(
              context: context,
              builder: (BuildContext context) {
                return CupertinoActionSheet(
                  title: Text(title),
                  actions: items.asMap().entries.map((entry) {
                    return CupertinoActionSheetAction(
                      child: Text(entry.value.text),
                      onPressed: () {
                        Navigator.pop(context, entry.key);
                      },
                    );
                  }).toList(),
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text('Cancel'),
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            );

            if (value != null) {
              items[value].onPress();
            }
          },
        );
      default:
        return PopupMenuButton(
          icon: Icon(iconData),
          itemBuilder: (context) {
            return items.asMap().entries.map((entry) {
              return PopupMenuItem(
                value: entry.key,
                child: Text(entry.value.text),
              );
            }).toList();
          },
          onSelected: (selected) {
            items[selected].onPress();
          },
        );
    }
  }
}
