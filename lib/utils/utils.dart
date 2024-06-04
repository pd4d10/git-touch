import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/widgets/border_view.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:primer/primer.dart';
import 'package:tuple/tuple.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart';

export 'extensions.dart';

class StorageKeys {
  @Deprecated('Use `accounts` instead')
  static const account = 'account';
  @Deprecated('Use `accounts` instead')
  static const github = 'github';
  @Deprecated('Split into several keys')
  static const iTheme = 'theme';

  static const accounts = 'accounts';
  static const iBrightness = 'brightness';
  static const codeTheme = 'code-theme';
  static const codeThemeDark = 'code-theme-dark';
  static const iCodeFontSize = 'code-font-size';
  static const codeFontFamily = 'code-font-family';
  static const iMarkdown = 'markdown';
  static const iDefaultAccount = 'default-account';
  static const locale = 'locale';

  static getDefaultStartTabKey(String platform) =>
      'default-start-tab-$platform';
}

class CommonStyle {
  CommonStyle._();
  static const padding = EdgeInsets.all(12);
  static const border = BorderView();
  static const verticalGap = SizedBox(height: 18);
  static final monospace = Platform.isIOS ? 'Menlo' : 'monospace'; // FIXME:
}

TextSpan createLinkSpan(
  BuildContext context,
  String? text,
  String url,
) {
  return TextSpan(
    text: text,
    style: TextStyle(
      color: AntTheme.of(context).colorPrimary,
      fontWeight: FontWeight.w600,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        context.pushUrl(url);
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
const kPageSize = 30;

extension MyList on List {
  List<T> withSeparator<T>(T separator) {
    final result = <T>[];
    for (var i = 0; i < length; i++) {
      if (i != 0) {
        result.add(separator);
      }
      result.add(this[i]);
    }
    return result;
  }
}

final numberFormat = NumberFormat();

Future<void> launchStringUrl(String? url) async {
  if (url == null) return;

  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
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

const kTotalCountFallback = 999; // TODO:

class ListPayload<T, K> {
  ListPayload({
    required this.cursor,
    required this.hasMore,
    required this.items,
  });
  K cursor;
  bool hasMore;
  Iterable<T> items;
}

extension MyHelper on BuildContext {
  Future<void> pushUrl(String url, {bool replace = true}) async {
    // Fimber.d(url);
    if (url.startsWith('/')) {
      if (replace) {
        this.replace(url);
      } else {
        push(url);
      }
    } else {
      launchStringUrl(url);
    }
  }
}
