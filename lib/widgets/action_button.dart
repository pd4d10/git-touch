import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/screens/issue.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';
import 'package:share/share.dart';

class ActionItem {
  String text;
  void Function(BuildContext context) onPress;
  IconData iconData;

  ActionItem({
    @required this.text,
    @required this.onPress,
    this.iconData,
  });

  ActionItem.share(String url)
      : text = 'Share',
        onPress = ((_) {
          Share.share(url);
        });
  ActionItem.launch(String url)
      : text = 'Open in Browser',
        onPress = ((_) {
          launchUrl(url);
        });
  ActionItem.user(String login)
      : text = '@$login',
        onPress = ((context) {
          Provider.of<ThemeModel>(context)
              .pushRoute(context, (_) => UserScreen(login));
        });
  ActionItem.repository(String owner, String name)
      : text = '$owner/$name',
        onPress = ((context) {
          Provider.of<ThemeModel>(context)
              .pushRoute(context, (_) => RepositoryScreen(owner, name));
        });
  ActionItem.issue(String owner, String name, int number,
      {isPullRequest = false})
      : text = (isPullRequest ? 'Pull Request' : 'Issue') + ' #$number',
        onPress = ((context) {
          Provider.of<ThemeModel>(context).pushRoute(
              context,
              (_) => IssueScreen(owner, name, number,
                  isPullRequest: isPullRequest));
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
              items[value].onPress(context);
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
            items[value].onPress(context);
          },
        );
    }
  }
}
