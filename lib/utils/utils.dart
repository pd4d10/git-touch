import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import '../providers/settings.dart';
import '../screens/repo.dart';
export 'github.dart';
export 'octicons.dart';
export 'timeago.dart';

// These keys are for development
var clientId = '9b7d1cc04a1db5710767';
var clientSecret = '710e085908dde6a8b55f7a9dc447ad5c0c5617d1';

Color convertColor(String cssHex) {
  if (cssHex.startsWith('#')) {
    cssHex = cssHex.substring(1);
  }
  return Color(int.parse('ff' + cssHex, radix: 16));
}

class Option<T> {
  final T value;
  final Widget widget;
  Option({this.value, this.widget});
}

Future<bool> showConfim(BuildContext context, String text) {
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

Future<T> showOptions<T>(BuildContext context, List<Option<T>> options) {
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
      color: Color(0xff0366d6),
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
  static const green = Color(0xff2cbe4e);
  static const purple = Color(0xff6f42c1);
  static const red = Color(0xffcb2431);
  static const gray = Color(0xff959da5);
}

final pageSize = 20;

final graphqlChunk1 = '''
title
createdAt
body
author {
  login
  avatarUrl
}
''';

var graghqlChunk = '''
__typename

... on IssueComment {
  createdAt
  body
  author {
    login
    avatarUrl
  }
}

... on Commit {
  committedDate
  oid
  author {
    user {
      login
    }
  }
}
          ... on ReferencedEvent {
            createdAt
            isCrossRepository
            actor {
              login
            }
            commit {
              oid
              url
            }
            commitRepository {
              owner {
                login
              }
              name
            }
          }

          ... on RenamedTitleEvent {
            createdAt
            previousTitle
            currentTitle
            actor {
              login
            }
          }

          ... on ClosedEvent {
            createdAt
            actor {
              login
            }
          }

          ... on ReopenedEvent {
            createdAt
            actor {
              login
            }
          }

          ... on CrossReferencedEvent {
            createdAt
            actor {
              login
            }
    				source {
              __typename
              ... on Issue {
                number
                repository {
                  owner {
                    login
                  }
                  name
                }
              }
              ... on PullRequest {
                number
                repository {
                  owner {
                    login
                  }
                  name
                }
              }
            }
          }


          ... on LabeledEvent {
            createdAt
            actor {
              login
            }
            label {
              name
              color
            }
          }

          ... on UnlabeledEvent {
            createdAt
            actor {
              login
            }
            label {
              name
              color
            }
          }

          ... on MilestonedEvent {
            createdAt
            actor {
              login
            }
            milestoneTitle
          }
          
          ... on LockedEvent {
            createdAt
            actor {
              login
            }
            lockReason
          }        
          ... on UnlockedEvent {
            createdAt
            actor {
              login
            }
          }          
          ... on AssignedEvent {
            createdAt
            actor {
              login
            }
            user {
              login
            }
          }  
''';

var createWarning =
    (String text) => Text(text, style: TextStyle(color: Colors.redAccent));
var warningSpan =
    TextSpan(text: 'xxx', style: TextStyle(color: Colors.redAccent));
