import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/screens/user.dart';
import 'package:intl/intl.dart';
import 'package:primer/primer.dart';
export 'package:flutter_vector_icons/flutter_vector_icons.dart';

final monospaceFont = Platform.isIOS ? 'Menlo' : 'monospace'; // FIXME:

class StorageKeys {
  static const account = 'account';
  static const github = 'github';
  static const theme = 'theme';
  static const newsFilter = 'news.filter';
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
  // print('color: $color, $grayscale');

  var showWhite = grayscale < 128;
  return showWhite ? Colors.white : Colors.black;
}

void nextTick(Function callback, [int milliseconds = 0]) {
  // FIXME:
  Future.delayed(Duration(milliseconds: 0)).then((_) {
    callback();
  });
}

TextSpan createLinkSpan(BuildContext context, String text, Function handle) {
  return TextSpan(
    text: text,
    style: TextStyle(color: PrimerColors.blue500, fontWeight: FontWeight.w600),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).push(
          // FIXME: Material route
          CupertinoPageRoute(
            builder: (context) {
              return handle();
            },
          ),
        );
      },
  );
}

TextSpan createUserSpan(BuildContext context, String login) {
  return createLinkSpan(context, login, () => UserScreen(login));
}

TextSpan createRepoLinkSpan(BuildContext context, String owner, String name) {
  return createLinkSpan(
      context, '$owner/$name', () => RepositoryScreen(owner, name));
}

class Palette {
  static const green = Color(0xff2cbe4e);
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

class BorderView extends StatelessWidget {
  final double height;
  final Color color;
  final double leftPadding;

  const BorderView({
    this.height = 1,
    this.color = PrimerColors.gray100,
    this.leftPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: leftPadding,
          height: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(color: PrimerColors.white),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: height,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          ),
        ),
      ],
    );
  }
}

const borderView = BorderView();
const borderView1 = BorderView(height: 20, color: PrimerColors.gray100);

String getBranchQueryKey(String branch, {bool withParams = false}) {
  if (branch == null) return 'defaultBranchRef';
  return 'ref' + (withParams ? '(qualifiedName: "$branch")' : '');
}
