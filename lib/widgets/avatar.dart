import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/screens.dart';

class Avatar extends StatelessWidget {
  final String login;
  final String url;

  Avatar(this.login, this.url);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (_) => UserScreen(login)),
          );
        },
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(url),
          radius: 18,
        ),
      ),
    );
  }
}
