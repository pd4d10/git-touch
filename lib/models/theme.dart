import 'dart:io';
import 'dart:async';
import 'package:fimber/fimber.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:primer/primer.dart';
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

class AppBrightnessType {
  static const followSystem = 0;
  static const light = 1;
  static const dark = 2;
  static const values = [
    AppBrightnessType.followSystem,
    AppBrightnessType.light,
    AppBrightnessType.dark
  ];
}

class AppStartTabGh {
  static const news = 0;
  static const notification = 1;
  static const trending = 2;
  static const search = 3;
  static const me = 4;
  static const explore = 5;
  static const groups = 6;
  static const teams = 7;

  static const values = [
    AppStartTabGh.news,
    AppStartTabGh.notification,
    AppStartTabGh.trending,
    AppStartTabGh.search,
    AppStartTabGh.me,
  ];
}

class AppStartTabGl {
  static const explore = 0;
  static const groups = 1;
  static const me = 2;

  static const values = [
    AppStartTabGl.explore,
    AppStartTabGl.groups,
    AppStartTabGl.me,
  ];
}

class AppStartTabBb {
  static const explore = 0;
  static const teams = 1;
  static const me = 2;

  static const values = [
    AppStartTabBb.explore,
    AppStartTabBb.teams,
    AppStartTabBb.me,
  ];
}

class AppStartTabGt {
  static const orgs = 0;
  static const me = 1;

  static const values = [
    AppStartTabGt.orgs,
    AppStartTabGt.me,
  ];
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

class SelectorItem<T> {
  T value;
  String text;
  SelectorItem({@required this.value, @required this.text});
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

class Palette {
  final Color primary;
  final Color text;
  final Color secondaryText;
  final Color tertiaryText;
  final Color background;
  final Color grayBackground;
  final Color border;

  const Palette({
    this.primary,
    this.text,
    this.secondaryText,
    this.tertiaryText,
    this.background,
    this.grayBackground,
    this.border,
  });
}

class ThemeModel with ChangeNotifier {
  int _theme;
  int get theme => _theme;
  bool get ready => _theme != null;

  Brightness systemBrightness = Brightness.light;
  void setSystemBrightness(Brightness v) {
    if (v != systemBrightness) {
      Future.microtask(() {
        systemBrightness = v;
        notifyListeners();
      });
    }
  }

  int _brightnessValue = AppBrightnessType.followSystem;
  int get brighnessValue => _brightnessValue;

  int _defaultStartTabGh = AppStartTabGh.news;
  int get defaultTabGh => _defaultStartTabGh;

  int get startTabGh {
    switch(_defaultStartTabGh) {
      case AppStartTabGh.news:
        return 0;
      case AppStartTabGh.notification:
        return 1;
      case AppStartTabGh.trending:
        return 2;
      case AppStartTabGh.search:
        return 3;
      case AppStartTabGh.me:
        return 4;
      default:
        return 0;
    }
  }

  Future<void> setDefaultStartTabGh(int v) async {
    _defaultStartTabGh = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.defaultStartTabGh, v);
    Fimber.d('write default start tab for github: $v');
    notifyListeners();
  }

  int _defaultStartTabGl = AppStartTabGl.explore;
  int get defaultTabGl => _defaultStartTabGl;

  int get startTabGl {
    switch(_defaultStartTabGl) {
      case AppStartTabGl.explore:
        return 0;
      case AppStartTabGl.groups:
        return 1;
      case AppStartTabGl.me:
        return 2;
      default:
        return 0;
    }
  }

  Future<void> setDefaultStartTabGl(int v) async {
    _defaultStartTabGl = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.defaultStartTabGl, v);
    Fimber.d('write default start tab for gitlab: $v');
    notifyListeners();
  }

  int _defaultStartTabBb = AppStartTabBb.explore;
  int get defaultTabBb => _defaultStartTabBb;

  int get startTabBb {
    switch(_defaultStartTabBb) {
      case AppStartTabBb.explore:
        return 0;
      case AppStartTabBb.teams:
        return 1;
      case AppStartTabBb.me:
        return 2;
      default:
        return 0;
    }
  }

  Future<void> setDefaultStartTabBb(int v) async {
    _defaultStartTabBb = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.defaultStartTabBb, v);
    Fimber.d('write default start tab for bitbucket: $v');
    notifyListeners();
  }

  int _defaultStartTabGt = AppStartTabGt.orgs;
  int get defaultTabGt => _defaultStartTabGt;

  int get startTabGt {
    switch(_defaultStartTabGt) {
      case AppStartTabGt.orgs:
        return 0;
      case AppStartTabGt.me:
        return 1;
      default:
        return 0;
    }
  }

  Future<void> setDefaultStartTabGt(int v) async {
    _defaultStartTabGt = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.defaultStartTabGt, v);
    Fimber.d('write default start tab for gitea: $v');
    notifyListeners();
  }

  // could be null
  Brightness get brightness {
    switch (_brightnessValue) {
      case AppBrightnessType.light:
        return Brightness.light;
      case AppBrightnessType.dark:
        return Brightness.dark;
      default:
        return systemBrightness;
    }
  }

  Future<void> setBrightness(int v) async {
    _brightnessValue = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.iBrightness, v);
    Fimber.d('write brightness: $v');
    notifyListeners();
  }

  final router = Router();

  final paletteLight = Palette(
    primary: PrimerColors.blue500,
    text: Colors.black,
    secondaryText: Colors.grey.shade800,
    tertiaryText: Colors.grey.shade600,
    background: Colors.white,
    grayBackground: Colors.grey.shade100,
    border: Colors.grey.shade300,
  );
  final paletteDark = Palette(
    primary: PrimerColors.blue500,
    text: Colors.grey.shade300,
    secondaryText: Colors.grey.shade400,
    tertiaryText: Colors.grey.shade500,
    background: Colors.black,
    grayBackground: Colors.grey.shade900,
    border: Colors.grey.shade700,
  );

  Palette get palette {
    switch (brightness) {
      case Brightness.dark:
        return paletteDark;
      case Brightness.light:
      default:
        return paletteLight;
    }
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getInt(StorageKeys.iTheme);
    Fimber.d('read theme: $v');
    if (AppThemeType.values.contains(v)) {
      _theme = v;
    } else if (Platform.isIOS) {
      _theme = AppThemeType.cupertino;
    } else {
      _theme = AppThemeType.material;
    }
    final b = prefs.getInt(StorageKeys.iBrightness);
    Fimber.d('read brightness: $b');
    if (AppBrightnessType.values.contains(b)) {
      _brightnessValue = b;
    }
    final dGh = prefs.getInt(StorageKeys.defaultStartTabGh);
    if (AppStartTabGh.values.contains(dGh)) {
      _defaultStartTabGh = dGh;
    }
    final dGl = prefs.getInt(StorageKeys.defaultStartTabGl);
    if (AppStartTabGl.values.contains(dGl)) {
      _defaultStartTabGl = dGl;
    }
    final dBb = prefs.getInt(StorageKeys.defaultStartTabBb);
    if (AppStartTabBb.values.contains(dBb)) {
      _defaultStartTabBb = dBb;
    }
    final dGt = prefs.getInt(StorageKeys.defaultStartTabGt);
    if (AppStartTabGt.values.contains(dGt)) {
      _defaultStartTabGt = dGt;
    }

    notifyListeners();
  }

  Future<void> setTheme(int v) async {
    _theme = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.iTheme, v);
    Fimber.d('write theme: $v');
    notifyListeners();
  }

  push(BuildContext context, String url, {bool replace = false}) {
    // Fimber.d(url);
    if (url.startsWith('/')) {
      return router.navigateTo(
        context,
        url,
        transition: theme == AppThemeType.cupertino
            ? TransitionType.cupertino
            : TransitionType.material,
        replace: replace,
      );
    } else {
      launchUrl(url);
    }
  }

  Future<void> showWarning(BuildContext context, String message) async {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(message),
          actions: <Widget>[
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
  }

  Future<bool> showConfirm(BuildContext context, Widget content) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: content,
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
    // default:
    //   return showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         content: content,
    //         actions: <Widget>[
    //           FlatButton(
    //             child: const Text('CANCEL'),
    //             onPressed: () {
    //               Navigator.pop(context, false);
    //             },
    //           ),
    //           FlatButton(
    //             child: const Text('OK'),
    //             onPressed: () {
    //               Navigator.pop(context, true);
    //             },
    //           )
    //         ],
    //       );
    //     },
    //   );
  }

  static Timer _debounce;
  String _selectedItem;

  showPicker(BuildContext context, PickerGroupItem<String> groupItem) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 216,
          child: CupertinoPicker(
            backgroundColor: palette.background,
            children: <Widget>[
              for (var v in groupItem.items)
                Text(v.text, style: TextStyle(color: palette.text)),
            ],
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

  showActions(BuildContext context, List<ActionItem> actionItems) async {
    if (actionItems == null) return;
    final value = await showCupertinoModalPopup<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Actions'),
          actions: actionItems.asMap().entries.map((entry) {
            return CupertinoActionSheetAction(
              child: Text(entry.value.text),
              isDestructiveAction: entry.value.isDestructiveAction,
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
      actionItems[value].onTap(context);
    }
  }
}
