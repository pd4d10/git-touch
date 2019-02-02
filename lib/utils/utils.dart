import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import '../screens/screens.dart';
export 'github.dart';
export 'octicons.dart';
export 'timeago.dart';

TextSpan createLinkSpan(BuildContext context, String text, Function handle) {
  return TextSpan(
    text: text,
    style: TextStyle(
      color: Color(0xff0366d6),
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
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
  static const green = 0xff2cbe4e;
  static const purple = 0xff6f42c1;
  static const red = 0xffcb2431;
  static const gray = 0xff959da5;
}

final pageSize = 100;

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
