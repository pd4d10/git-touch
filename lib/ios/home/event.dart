import '../../utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _Avatar extends StatelessWidget {
  final String avatar;
  _Avatar(this.avatar);

  @override
  build(context) {
    return new CircleAvatar(
      backgroundImage: NetworkImage(avatar),
      radius: 24.0,
    );
  }
}

TextSpan _strong(String text) {
  return new TextSpan(
    text: text,
    style: new TextStyle(
      fontWeight: FontWeight.bold,
      color: new Color(0xff24292e),
    ),
  );
}

class PushEvent extends StatelessWidget {
  final Event event;
  PushEvent(this.event);

  @override
  build(ctx) {
    return new Row(
      children: [
        new _Avatar(event.avatar),
        new Expanded(
          child: new RichText(
            text: new TextSpan(
              style: new TextStyle(color: CupertinoColors.black),
              children: [
                _strong(event.actor),
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
          ),
        ),
      ],
    );
  }
}

class IssuesEvent extends StatelessWidget {
  final Event event;
  IssuesEvent(this.event);

  @override
  build(ctx) {
    return new Row(
      children: <Widget>[
        new _Avatar(event.avatar),
        new Expanded(
          child: new RichText(
            text: new TextSpan(
              style: new TextStyle(color: CupertinoColors.black),
              children: [
                _strong(event.actor),
                new TextSpan(text: ' ${event.payload['action']} issue '),
                _strong(event.repo),
                new TextSpan(
                    text: '#' + event.payload['issue']['number'].toString()),
                new TextSpan(text: event.payload['issue']['title'])
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PullRequestEvent extends StatelessWidget {
  final Event event;
  PullRequestEvent(this.event);

  @override
  build(ctx) {
    return new Row(
      children: <Widget>[
        new _Avatar(event.avatar),
        new Expanded(
          child: new RichText(
            text: new TextSpan(
              style: new TextStyle(color: CupertinoColors.black),
              children: [
                _strong(event.actor),
                new TextSpan(text: ' ${event.payload['action']} pull request '),
                _strong(event.repo),
                new TextSpan(text: '#' + event.payload['number'].toString()),
                new TextSpan(text: event.payload['pull_request']['title'])
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IssueCommentEvent extends StatelessWidget {
  final Event event;
  IssueCommentEvent(this.event);

  @override
  build(ctx) {
    return new Row(
      children: <Widget>[
        new _Avatar(event.avatar),
        new Expanded(
          child: new RichText(
            text: new TextSpan(
              style: new TextStyle(color: CupertinoColors.black),
              children: [
                _strong(event.actor),
                new TextSpan(text: ' commented on issue '),
                _strong(event.repo),
                new TextSpan(
                    text: '#' + event.payload['issue']['number'].toString()),
                new TextSpan(text: event.payload['comment']['body'])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
