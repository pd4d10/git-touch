import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodeModel with ChangeNotifier {
  static const _kTheme = 'code-theme';
  static const _kThemeDark = 'code-theme-dark';
  static const _kFontSize = 'code-font-size';
  static const _kFontFamily = 'code-font-family';

  static var themes = themeMap.keys.toList();
  static const fontSizes = [12, 13, 14, 15, 16, 17, 18, 19, 20];
  static const fontFamilies = [
    'System',
    'Fira Code',
    'Inconsolata',
    'PT Mono',
    'Source Code Pro',
    'Ubuntu Mono'
  ];

  String _theme = 'github-gist';
  String _themeDark = 'vs2015';
  int _fontSize = 14;
  String _fontFamily = 'System';

  String get theme => _theme;
  String get themeDark => _themeDark;
  int get fontSize => _fontSize;
  String get fontFamily => _fontFamily;
  String get fontFamilyUsed =>
      _fontFamily == 'System' ? CommonStyle.monospace : _fontFamily;

  Future<void> init() async {
    var prefs = await SharedPreferences.getInstance();
    var vh = prefs.getString(_kTheme);
    var vdh = prefs.getString(_kThemeDark);
    var vs = prefs.getInt(_kFontSize);
    var vf = prefs.getString(_kFontFamily);

    Fimber.d('read code: $vh, $vs, $vf');
    if (themeMap.keys.contains(vh)) {
      _theme = vh;
    }
    if (themeMap.keys.contains(vdh)) {
      _themeDark = vdh;
    }
    if (fontSizes.contains(vs)) {
      _fontSize = vs;
    }
    if (fontFamilies.contains(vf)) {
      _fontFamily = vf;
    }

    notifyListeners();
  }

  setTheme(String v) async {
    var prefs = await SharedPreferences.getInstance();

    await prefs.setString(_kTheme, v);
    Fimber.d('write code theme: $v');

    _theme = v;
    notifyListeners();
  }

  setThemeDark(String v) async {
    var prefs = await SharedPreferences.getInstance();

    await prefs.setString(_kThemeDark, v);
    Fimber.d('write code theme dark: $v');

    _themeDark = v;
    notifyListeners();
  }

  setFontSize(int v) async {
    var prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_kFontSize, v);
    Fimber.d('write code font size: $v');

    _fontSize = v;
    notifyListeners();
  }

  setFontFamily(String v) async {
    var prefs = await SharedPreferences.getInstance();

    await prefs.setString(_kFontFamily, v);
    Fimber.d('write code font family: $v');

    _fontFamily = v;
    notifyListeners();
  }
}
