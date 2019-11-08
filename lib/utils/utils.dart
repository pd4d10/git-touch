import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/widgets/border_view.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:intl/intl.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
export 'package:flutter_vector_icons/flutter_vector_icons.dart';

class StorageKeys {
  static const accounts = 'accounts';
  static const account = 'account';
  static const github = 'github';
  static const theme = 'theme';
  static const newsFilter = 'news.filter';
}

class CommonStyle {
  static const padding = EdgeInsets.all(12);
  static final border = BorderView();
  static const verticalGap = SizedBox(height: 18);
  static final monospace = Platform.isIOS ? 'Menlo' : 'monospace'; // FIXME:
}

Color convertColor(String cssHex) {
  if (cssHex == null) {
    return Color(0xffcccccc); // Default color
  }

  if (cssHex.startsWith('#')) {
    cssHex = cssHex.substring(1);
  }
  if (cssHex.length == 3) {
    cssHex = cssHex.split('').map((char) => char + char).join('');
  }
  return Color(int.parse('ff' + cssHex, radix: 16));
}

Color getFontColorByBrightness(Color color) {
  var grayscale = color.red * 0.3 + color.green * 0.59 + color.blue * 0.11;
  // Fimber.d('color: $color, $grayscale');

  var showWhite = grayscale < 128;
  return showWhite ? Colors.white : Colors.black;
}

void nextTick(Function callback, [int milliseconds = 0]) {
  // FIXME:
  Future.delayed(Duration(milliseconds: 0)).then((_) {
    callback();
  });
}

TextSpan createLinkSpan(
  BuildContext context,
  String text,
  Widget Function(BuildContext) builder,
) {
  return TextSpan(
    text: text,
    style: TextStyle(
      color: PrimerColors.blue500,
      fontWeight: FontWeight.w600,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        Provider.of<ThemeModel>(context).pushRoute(context, builder);
      },
  );
}

TextSpan createUserSpan(BuildContext context, String login) {
  return createLinkSpan(context, login, (_) => UserScreen(login));
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
          color: PrimerColors.blue500,
          fontSize: 12,
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

Iterable<Widget> buildPinnedItems(List pinnedItems, List repositories) {
  String title;
  List items = [];

  if (pinnedItems.isNotEmpty) {
    title = 'pinned repositories';
    items = pinnedItems;
  } else if (repositories.isNotEmpty) {
    title = 'popular repositories';
    items = repositories;
  }

  items = items
      .where((x) => x.isNotEmpty)
      .toList(); // TODO: Pinned items may include Gist
  if (items.isEmpty) return [];

  return [
    CommonStyle.verticalGap,
    if (title != null) TableViewHeader(title),
    ...join(
      CommonStyle.border,
      items.map((item) {
        return RepositoryItem(item);
      }).toList(),
    ),
  ];
}
