import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/border_view.dart';
import 'package:intl/intl.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
export 'extensions.dart';
export 'package:flutter_vector_icons/flutter_vector_icons.dart';

class StorageKeys {
  @deprecated
  static const account = 'account';
  @deprecated
  static const github = 'github';

  static const accounts = 'accounts';
  static const iTheme = 'theme';
  static const iBrightness = 'brightness';
  static const codeTheme = 'code-theme';
  static const codeThemeDark = 'code-theme-dark';
  static const iCodeFontSize = 'code-font-size';
  static const codeFontFamily = 'code-font-family';
  static const markdown = 'markdown';

  static getDefaultStartTabKey(String platform) =>
      'default-start-tab-$platform';
}

class CommonStyle {
  static const padding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static final border = BorderView();
  static const verticalGap = SizedBox(height: 18);
  static final monospace = Platform.isIOS ? 'Menlo' : 'monospace'; // FIXME:
}

Color convertColor(String cssHex) {
  if (cssHex == null) {
    return Color(0xffededed); // Default color
  }

  if (cssHex.startsWith('#')) {
    cssHex = cssHex.substring(1);
  }
  if (cssHex.length == 3) {
    cssHex = cssHex.split('').map((char) => char + char).join('');
  }
  return Color(int.tryParse('ff' + cssHex, radix: 16) ?? 0);
}

Color getFontColorByBrightness(Color color) {
  var grayscale = color.red * 0.3 + color.green * 0.59 + color.blue * 0.11;
  // Fimber.d('color: $color, $grayscale');

  var showWhite = grayscale < 128;
  return showWhite ? Colors.white : Colors.black;
}

TextSpan createLinkSpan(
  BuildContext context,
  String text,
  String url,
) {
  final theme = Provider.of<ThemeModel>(context);
  return TextSpan(
    text: text,
    style: TextStyle(
      color: theme.palette.primary,
      fontWeight: FontWeight.w600,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        theme.push(context, url);
      },
  );
}

Tuple2<String, String> parseRepositoryFullName(String fullName) {
  final ls = fullName.split('/');
  assert(ls.length == 2);
  return Tuple2(ls[0], ls[1]);
}

class GithubPalette {
  static const open = Color(0xff2cbe4e);
  static const closed = PrimerColors.red600;
  static const merged = PrimerColors.purple500;
}

// final pageSize = 5;
final pageSize = 30;

var createWarning =
    (String text) => Text(text, style: TextStyle(color: Colors.redAccent));
var warningSpan =
    TextSpan(text: 'xxx', style: TextStyle(color: Colors.redAccent));

List<T> join<T>(T seperator, List<T> xs) {
  List<T> result = [];
  xs.asMap().forEach((index, x) {
    if (x == null) return;

    result.add(x);
    if (index < xs.length - 1) {
      result.add(seperator);
    }
  });

  return result;
}

List<T> joinAll<T>(T seperator, List<List<T>> xss) {
  List<T> result = [];
  xss.asMap().forEach((index, x) {
    if (x == null || x.isEmpty) return;

    result.addAll(x);
    if (index < xss.length - 1) {
      result.add(seperator);
    }
  });

  return result;
}

final numberFormat = NumberFormat();

bool isNotNullOrEmpty(String text) {
  return text != null && text.isNotEmpty;
}

String getBranchQueryKey(String branch, {bool withParams = false}) {
  if (branch == null) return 'defaultBranchRef';
  return 'ref' + (withParams ? '(qualifiedName: "$branch")' : '');
}

// TODO: Primer
class PrimerBranchName extends StatelessWidget {
  final String name;

  PrimerBranchName(this.name);

  static const branchBgColor = Color(0xffeaf5ff);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      height: 16,
      decoration: BoxDecoration(
        color: branchBgColor,
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: theme.palette.primary,
          fontSize: 14,
          height: 1,
          fontFamily: CommonStyle.monospace,
        ),
      ),
    );
  }
}

launchUrl(String url) async {
  if (url == null) return;

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // TODO: fallback
  }
}

final dateFormat = DateFormat.yMMMMd();

int sortByKey<T>(T key, T a, T b) {
  if (a == key && b != key) return -1;
  if (a != key && b == key) return 1;
  return 0;
}
