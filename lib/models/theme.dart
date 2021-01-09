import 'package:universal_io/io.dart';
import 'dart:async';
import 'package:fimber/fimber.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:primer/primer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

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

class AppMarkdownType {
  static const flutter = 0;
  static const webview = 1;
  static const values = [AppMarkdownType.flutter, AppMarkdownType.webview];
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
  String markdownCss;

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

  // markdown render engine
  int _markdown;
  int get markdown => _markdown;
  Future<void> setMarkdown(int v) async {
    _markdown = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.markdown, v);
    Fimber.d('write markdown engine: $v');
    notifyListeners();
  }

  bool get shouldUseMarkdownFlutterView {
    // WebView on macOS not working
    return Platform.isMacOS || markdown == AppMarkdownType.flutter;
  }

  final router = FluroRouter();

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
    markdownCss = await rootBundle.loadString('images/github-markdown.css');

    final prefs = await SharedPreferences.getInstance();

    final v = prefs.getInt(StorageKeys.iTheme);
    Fimber.d('read theme: $v');
    if (AppThemeType.values.contains(v)) {
      _theme = v;
    } else if (Platform.isIOS || Platform.isMacOS) {
      _theme = AppThemeType.cupertino;
    } else {
      _theme = AppThemeType.material;
    }
    final b = prefs.getInt(StorageKeys.iBrightness);
    Fimber.d('read brightness: $b');
    if (AppBrightnessType.values.contains(b)) {
      _brightnessValue = b;
    }
    final m = prefs.getInt(StorageKeys.markdown);
    if (AppMarkdownType.values.contains(m)) {
      _markdown = m;
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: palette.background,
                border: Border(
                  bottom: BorderSide(
                    color: palette.grayBackground,
                    width: 0.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                      _selectedItem = groupItem.value;
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5.0,
                    ),
                  ),
                  CupertinoButton(
                    child: Text('Confirm'),
                    onPressed: () {
                      Navigator.pop(context);
                      groupItem.onClose(_selectedItem);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5.0,
                    ),
                  )
                ],
              ),
            ),
            Container(
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
            )
          ],
        );
      },
    );
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
