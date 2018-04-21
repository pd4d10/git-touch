import '../../utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../issue.dart';
import '../user.dart';

TextSpan _strong(String text, [GestureRecognizer recognizer]) {
  return new TextSpan(
    text: text,
    style: new TextStyle(
      fontWeight: FontWeight.bold,
      color: new Color(0xff24292e),
    ),
    recognizer: recognizer,
  );
}

TextSpan _user(Event event, context) {
  return _strong(
    event.actor,
    new TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).push(
          new CupertinoPageRoute(
            builder: (context) {
              return new IosUserPage(event.actor, event.avatar);
            },
          ),
        );
      },
  );
}

class PushEvent extends StatelessWidget {
  final Event event;
  PushEvent(this.event);

  @override
  build(context) {
    return new RichText(
      text: new TextSpan(
        style: new TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          new TextSpan(text: ' pushed to '),
          new TextSpan(
            text: event.payload['ref'],
            style: new TextStyle(color: CupertinoColors.activeBlue),
          ),
          new TextSpan(text: ' in '),
          _strong(event.repo),
          new TextSpan(text: '')
        ],
      ),
    );
  }
}

class IssuesEvent extends StatelessWidget {
  final Event event;
  IssuesEvent(this.event);

  @override
  build(context) {
    return new RichText(
      text: new TextSpan(
        style: new TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          new TextSpan(text: ' ${event.payload['action']} issue '),
          _strong(event.repo),
          new TextSpan(
            text: '#' + event.payload['issue']['number'].toString(),
          ),
          new TextSpan(
            text: event.payload['issue']['title'],
          )
        ],
      ),
    );
  }
}

class PullRequestEvent extends StatelessWidget {
  final Event event;
  PullRequestEvent(this.event);

  @override
  build(context) {
    return new RichText(
      text: new TextSpan(
        style: new TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          new TextSpan(text: ' ${event.payload['action']} pull request '),
          _strong(event.repo),
          new TextSpan(text: '#' + event.payload['number'].toString()),
          new TextSpan(text: event.payload['pull_request']['title'])
        ],
      ),
    );
  }
}

class IssueCommentEvent extends StatelessWidget {
  final Event event;
  IssueCommentEvent(this.event);

  @override
  build(context) {
    return new RichText(
      text: new TextSpan(
        style: new TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          new TextSpan(text: ' commented on issue '),
          _strong(event.repo),
          new TextSpan(text: '#' + event.payload['issue']['number'].toString()),
          new TextSpan(text: event.payload['comment']['body'])
        ],
      ),
    );
  }
}

class WatchEvent extends StatelessWidget {
  final Event event;
  WatchEvent(this.event);

  @override
  build(context) {
    return new RichText(
      text: new TextSpan(
        style: new TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          new TextSpan(text: ' ${event.payload['action']} '),
          _strong(event.repo),
        ],
      ),
    );
  }
}
