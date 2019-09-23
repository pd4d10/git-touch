import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/widgets/picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DialogOption<T> {
  final T value;
  final Widget widget;
  DialogOption({this.value, this.widget});
}

class AppThemeType {
  static const material = 0;
  static const cupertino = 1;
  static const values = [AppThemeType.material, AppThemeType.cupertino];
}

class ThemeModel with ChangeNotifier {
  static const storageKey = 'theme';

  int _theme;
  int get theme => _theme;
  bool get ready => _theme != null;

  init() async {
    var prefs = await SharedPreferences.getInstance();

    int v = prefs.getInt(storageKey);
    print('read theme: $v');
    if (AppThemeType.values.contains(v)) {
      _theme = v;
    } else if (Platform.isIOS) {
      _theme = AppThemeType.cupertino;
    } else {
      _theme = AppThemeType.material;
    }

    notifyListeners();
  }

  Future<void> setTheme(int v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _theme = v;
    await prefs.setInt(storageKey, v);
    print('write theme: $v');

    notifyListeners();
  }

  void pushRoute({
    @required BuildContext context,
    @required WidgetBuilder builder,
    bool fullscreenDialog = false,
  }) {
    switch (theme) {
      case AppThemeType.cupertino:
        Navigator.of(context).push(CupertinoPageRoute(
          builder: builder,
          fullscreenDialog: fullscreenDialog,
        ));
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(
          builder: builder,
          fullscreenDialog: fullscreenDialog,
        ));
    }
  }

  Future<bool> showConfirm(BuildContext context, String text) {
    switch (theme) {
      case AppThemeType.cupertino:
        return showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(text),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('cancel'),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            );
          },
        );
      default:
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                text,
                // style: dialogTextStyle
              ),
              actions: <Widget>[
                FlatButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                FlatButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                )
              ],
            );
          },
        );
    }
  }

  Future<T> showDialogOptions<T>(
      BuildContext context, List<DialogOption<T>> options) {
    var title = Text('Pick your reaction');
    var cancelWidget = Text('Cancel');

    switch (theme) {
      case AppThemeType.cupertino:
        return showCupertinoDialog<T>(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: title,
              actions: options.map((option) {
                return CupertinoDialogAction(
                  child: option.widget,
                  onPressed: () {
                    Navigator.pop(context, option.value);
                  },
                );
              }).toList()
                ..add(
                  CupertinoDialogAction(
                    child: cancelWidget,
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                  ),
                ),
            );
          },
        );
      default:
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: title,
              children: options.map<Widget>((option) {
                return SimpleDialogOption(
                  child: option.widget,
                  onPressed: () {
                    Navigator.pop(context, option.value);
                  },
                );
              }).toList()
                ..add(SimpleDialogOption(
                  child: cancelWidget,
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                )),
            );
          },
        );
    }
  }

  static Timer _debounce;

  showPicker(BuildContext context, PickerGroupItem<String> groupItem) async {
    switch (theme) {
      case AppThemeType.cupertino:
        await showCupertinoModalPopup<void>(
          context: context,
          builder: (context) {
            return Container(
              height: 300,
              child: CupertinoPicker(
                backgroundColor: CupertinoColors.white,
                children: groupItem.items.map((v) => Text(v.text)).toList(),
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                    initialItem: groupItem.items
                        .toList()
                        .indexWhere((v) => v.value == groupItem.value)),
                onSelectedItemChanged: (index) {
                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    return groupItem
                        .onChange(groupItem.items.toList()[index].value);
                  });
                },
              ),
            );
          },
        );
        break;
      default:
        final value = await showMenu(
          context: context,
          initialValue: groupItem.value,
          items: groupItem.items
              .map((item) =>
                  PopupMenuItem(value: item.value, child: Text(item.text)))
              .toList(),
          position: RelativeRect.fill,
        );
        if (value != null) {
          groupItem.onChange(value);
        }
    }
  }
}
