import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class PickerItem<T> {
  final T value;
  final String text;
  PickerItem(this.value, {@required this.text});
}

class PickerGroupItem<T> {
  final T value;
  final List<PickerItem<T>> items;
  final Function(T value) onChange;
  final Function(T value) onClose;

  PickerGroupItem({
    @required this.value,
    @required this.items,
    this.onChange,
    this.onClose,
  });
}

// No animation. For replacing route
// TODO: Go back
class StaticRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  StaticRoute({this.builder})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return child;
          },
        );
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

  pushRoute(
    BuildContext context,
    WidgetBuilder builder, {
    bool fullscreenDialog = false,
  }) {
    switch (theme) {
      case AppThemeType.cupertino:
        return Navigator.of(context).push(CupertinoPageRoute(
          builder: builder,
          fullscreenDialog: fullscreenDialog,
        ));
      default:
        return Navigator.of(context).push(MaterialPageRoute(
          builder: builder,
          fullscreenDialog: fullscreenDialog,
        ));
    }
  }

  pushReplacementRoute(BuildContext context, WidgetBuilder builder) {
    return Navigator.of(context).pushReplacement(StaticRoute(builder: builder));
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

  String _selectedItem;

  showPicker(BuildContext context, PickerGroupItem<String> groupItem) async {
    switch (theme) {
      case AppThemeType.cupertino:
      default:
        await showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              height: 216,
              child: CupertinoPicker(
                backgroundColor: CupertinoColors.white,
                children: groupItem.items.map((v) => Text(v.text)).toList(),
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                    initialItem: groupItem.items
                        .toList()
                        .indexWhere((v) => v.value == groupItem.value)),
                onSelectedItemChanged: (index) {
                  _selectedItem = groupItem.items[index].value;

                  if (groupItem.onChange != null) {
                    if (_debounce?.isActive ?? false) {
                      _debounce.cancel();
                    }

                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      groupItem.onChange(_selectedItem);
                    });
                  }
                },
              ),
            );
          },
        );
        if (groupItem.onClose != null) {
          groupItem.onClose(_selectedItem);
        }
    }
  }
}
