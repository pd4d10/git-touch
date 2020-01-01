import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:share/share.dart';

class ActionItem {
  String text;
  String url;
  void Function(BuildContext context) onTap;
  IconData iconData;

  ActionItem({
    @required this.text,
    this.onTap,
    this.url,
    this.iconData,
  });

  ActionItem.share(String url)
      : text = 'Share',
        onTap = ((_) {
          Share.share(url);
        });
  ActionItem.launch(String url)
      : text = 'Open in Browser',
        onTap = ((_) {
          launchUrl(url);
        });
}

class ActionButton extends StatelessWidget {
  final String title;
  final List<ActionItem> items;
  final IconData iconData;
  final int selected;

  ActionButton({
    @required this.title,
    @required this.items,
    this.iconData = Icons.more_vert,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    switch (theme.theme) {
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
                      child: Text(
                        entry.value.text,
                        style: TextStyle(
                            fontWeight: selected == entry.key
                                ? FontWeight.w500
                                : FontWeight.w400),
                      ),
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
              if (items[value].onTap != null) items[value].onTap(context);
              if (items[value].url != null)
                theme.push(context, items[value].url);
            }
          },
        );
      default:
        return PopupMenuButton(
          icon: Icon(iconData),
          initialValue: selected,
          itemBuilder: (context) {
            return items.asMap().entries.map((entry) {
              return PopupMenuItem(
                value: entry.key,
                child: Text(entry.value.text),
              );
            }).toList();
          },
          onSelected: (value) {
            items[value].onTap(context);
          },
        );
    }
  }
}
