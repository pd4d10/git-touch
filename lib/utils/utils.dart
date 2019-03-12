import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import '../providers/settings.dart';
import '../screens/repo.dart';
export 'package:flutter_vector_icons/flutter_vector_icons.dart';
export 'timeago.dart';

class StorageKeys {
  static const account = 'account';
  static const github = 'github';
  static const theme = 'theme';
  static const newsFilter = 'news.filter';
}

Color convertColor(String cssHex) {
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

Future<bool> showConfirm(BuildContext context, String text) {
  switch (SettingsProvider.of(context).theme) {
    case ThemeMap.cupertino:
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

class DialogOption<T> {
  final T value;
  final Widget widget;
  DialogOption({this.value, this.widget});
}

Future<T> showOptions<T>(BuildContext context, List<DialogOption<T>> options) {
  var builder = (BuildContext context) {
    return CupertinoAlertDialog(
      actions: options.map((option) {
        return CupertinoDialogAction(
          child: option.widget,
          onPressed: () {
            Navigator.pop(context, option.value);
          },
        );
      }).toList(),
    );
  };

  switch (SettingsProvider.of(context).theme) {
    case ThemeMap.cupertino:
      return showCupertinoDialog<T>(
        context: context,
        builder: builder,
      );
    default:
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              children: <Widget>[
                PopupMenuItem(child: Text('a')),
                PopupMenuItem(child: Text('b')),
              ],
            ),
          );
        },
      );
  }
}

TextSpan createLinkSpan(BuildContext context, String text, Function handle) {
  return TextSpan(
    text: text,
    style: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
      // decoration: TextDecoration.underline,
    ),
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
  static const primary = Color(0xff24292e);
  static const green = Color(0xff2cbe4e);
  static const purple = Color(0xff6f42c1);
  static const red = Color(0xffcb2431);
  static const gray = Color(0xff959da5);
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
