import 'dart:async';

import 'package:antd_mobile/antd_mobile.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_io/io.dart';

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
  PickerItem(this.value, {required this.text});
  final T value;
  final String? text;
}

class PickerGroupItem<T> {
  PickerGroupItem({
    required this.value,
    required this.items,
    this.onChange,
    this.onClose,
  });
  final T value;
  final List<PickerItem<T>> items;
  final Function(T value)? onChange;
  final Function(T value)? onClose;
}

class SelectorItem<T> {
  SelectorItem({required this.value, required this.text});
  T value;
  String text;
}

// No animation. For replacing route
// TODO: Go back
class StaticRoute extends PageRouteBuilder {
  StaticRoute({this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return builder!(context);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
  final WidgetBuilder? builder;
}

class ThemeModel with ChangeNotifier {
  String? markdownCss;

  Brightness systemBrightness = Brightness.light;
  void setSystemBrightness(Brightness v) {
    if (v != systemBrightness) {
      Future.microtask(() {
        systemBrightness = v;
        notifyListeners();
      });
    }
  }

  int? _brightnessValue = AppBrightnessType.followSystem;
  int? get brighnessValue => _brightnessValue;

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
  int? _markdown;
  int? get markdown => _markdown;
  Future<void> setMarkdown(int v) async {
    _markdown = v;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeys.iMarkdown, v);
    Fimber.d('write markdown engine: $v');
    notifyListeners();
  }

  bool get shouldUseMarkdownFlutterView {
    // webview on macOS not working
    if (Platform.isMacOS) return true;

    // android webview has some issues, prefer flutter
    // https://github.com/git-touch/git-touch/issues/132
    if (Platform.isAndroid && markdown == null) return true;

    // otherwise, prefer webview
    return markdown == AppMarkdownType.flutter;
  }

  // supported languages
  String? _locale;
  String? get locale => _locale;

  Future<void> setLocale(String? v) async {
    _locale = v;
    final prefs = await SharedPreferences.getInstance();
    if (v == null) {
      await prefs.remove(StorageKeys.locale);
    } else {
      await prefs.setString(StorageKeys.locale, v);
    }
    notifyListeners();
  }

  Future<void> init() async {
    markdownCss = await rootBundle.loadString('images/github-markdown.css');

    final prefs = await SharedPreferences.getInstance();

    final b = prefs.getInt(StorageKeys.iBrightness);
    Fimber.d('read brightness: $b');
    if (AppBrightnessType.values.contains(b)) {
      _brightnessValue = b;
    }
    final m = prefs.getInt(StorageKeys.iMarkdown);
    if (AppMarkdownType.values.contains(m)) {
      _markdown = m;
    }
    final l = prefs.getString(StorageKeys.locale);
    if (AppLocalizations.supportedLocales.any((v) => l == v.toString())) {
      _locale = l;
    }

    notifyListeners();
  }

  Future<bool?> showConfirm(BuildContext context, Widget content) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: content,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('cancel'),
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
  }

  static Timer? _debounce;
  String? _selectedItem;

  showPicker(BuildContext context, PickerGroupItem<String?> groupItem) async {
    await AntPopup.show(
      context: context,
      closeOnMaskClick: true,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: AntTheme.of(context).colorBackground,
                border: Border(
                  bottom: BorderSide(
                    color: AntTheme.of(context).colorBox,
                    width: 0.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _selectedItem = groupItem.value;
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5.0,
                    ),
                    child: const Text('Cancel'),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                      groupItem.onClose!(_selectedItem);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5.0,
                    ),
                    child: const Text('Confirm'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 216,
              child: CupertinoPicker(
                backgroundColor: AntTheme.of(context).colorBackground,
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                    initialItem: groupItem.items
                        .toList()
                        .indexWhere((v) => v.value == groupItem.value)),
                onSelectedItemChanged: (index) {
                  _selectedItem = groupItem.items[index].value;

                  if (groupItem.onChange != null) {
                    if (_debounce?.isActive ?? true) {
                      _debounce!.cancel();
                    }

                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      groupItem.onChange!(_selectedItem);
                    });
                  }
                },
                children: <Widget>[
                  for (var v in groupItem.items)
                    Text(v.text!,
                        style:
                            TextStyle(color: AntTheme.of(context).colorText)),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  showActions(BuildContext context, List<ActionItem> actionItems) async {
    await AntActionSheet.show(
      context: context,
      extra: const Text('Actions'),
      actions: [
        for (final item in actionItems)
          AntActionSheetAction(
            text: Text(
              item.text!,
              style: TextStyle(
                  color: item.danger ? AntTheme.of(context).colorDanger : null),
            ),
            onClick: () {
              item.onTap?.call(context);
            },
            key: null,
          ),
      ],
    );
  }
}
