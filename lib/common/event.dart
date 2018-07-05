import '../utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
// import '../issue.dart';
// import '../user.dart';

// class Strong extends StatelessWidget {
//   final String text;

//   @override
//   build(context) {
//     return TextSpan(
//       text: text,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         color: Color(0xff24292e),
//       ),
//       // recognizer: recognizer,
//     );
//   }
// }

class _Avatar extends StatelessWidget {
  final String url;
  _Avatar(this.url);

  @override
  build(context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
      radius: 24.0,
    );
  }
}

class EventItem extends StatelessWidget {
  final Event event;
  EventItem(this.event);

  getEventItemByType() {
    switch (event.type) {
      case 'IssuesEvent':
        return IssuesEvent(event);
      case 'PushEvent':
        return PushEvent(event);
      case 'PullRequestEvent':
        return PullRequestEvent(event);
      case 'WatchEvent':
        return WatchEvent(event);
      default:
        return Text('Not implement yet');
    }
  }

  @override
  build(context) {
    //  Padding(padding:  EdgeInsets.only(top: 16.0)),

    return Row(
      children: [
        _Avatar(event.avatar),
        Expanded(child: getEventItemByType()),
      ],
    );
  }
}

TextSpan _strong(String text, [GestureRecognizer recognizer]) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xff24292e),
    ),
    recognizer: recognizer,
  );
}

TextSpan _user(Event event, context) {
  return _strong(
    event.actor,
    // TapGestureRecognizer()
    //   ..onTap = () {
    //     Navigator.of(context).push(
    //       CupertinoPageRoute(
    //         builder: (context) {
    //           return IosUserPage(event.actor, event.avatar);
    //         },
    //       ),
    //     );
    //   },
  );
}

class PushEvent extends StatelessWidget {
  final Event event;
  PushEvent(this.event);

  @override
  build(context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          TextSpan(text: ' pushed to '),
          TextSpan(
            text: event.payload['ref'],
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
          TextSpan(text: ' in '),
          _strong(event.repo),
          TextSpan(text: '')
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
    return RichText(
      text: TextSpan(
        style: TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          TextSpan(text: ' ${event.payload['action']} issue '),
          _strong(event.repo),
          TextSpan(
            text: '#' + event.payload['issue']['number'].toString(),
          ),
          TextSpan(
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
    return RichText(
      text: TextSpan(
        style: TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          TextSpan(text: ' ${event.payload['action']} pull request '),
          _strong(event.repo),
          TextSpan(text: '#' + event.payload['number'].toString()),
          TextSpan(text: event.payload['pull_request']['title'])
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
    return RichText(
      text: TextSpan(
        style: TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          TextSpan(text: ' commented on issue '),
          _strong(event.repo),
          TextSpan(text: '#' + event.payload['issue']['number'].toString()),
          TextSpan(text: event.payload['comment']['body'])
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
    return RichText(
      text: TextSpan(
        style: TextStyle(color: CupertinoColors.black),
        children: [
          _user(event, context),
          TextSpan(text: ' ${event.payload['action']} '),
          _strong(event.repo),
        ],
      ),
    );
  }
}
