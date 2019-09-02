import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:primer/primer.dart';
import '../providers/settings.dart';
import '../screens/repo.dart';
export 'package:flutter_vector_icons/flutter_vector_icons.dart';

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

void nextTick(Function callback, [int milliseconds = 0]) {
  // FIXME:
  Future.delayed(Duration(milliseconds: 0)).then((_) {
    callback();
  });
}

TextSpan createLinkSpan(BuildContext context, String text, Function handle) {
  return TextSpan(
    text: text,
    style: TextStyle(fontWeight: FontWeight.w600),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) {
              return handle();
            },
          ),
        );
      },
  );
}

TextSpan createRepoLinkSpan(BuildContext context, String owner, String name) {
  return createLinkSpan(context, '$owner/$name', () => RepoScreen(owner, name));
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

var repoChunk = '''
owner {
  login
}
name
description
isPrivate
isFork
stargazers {
  totalCount
}
forks {
  totalCount
}
primaryLanguage {
  color
  name
}
''';
