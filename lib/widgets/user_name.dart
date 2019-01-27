import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_flux/screens/screens.dart';

final style = TextStyle(fontWeight: FontWeight.w600);

TextSpan createUserSpan(String login) {
  return TextSpan(text: login, style: style);
}

class UserName extends StatelessWidget {
  final String login;

  UserName(this.login);

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
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Text(login, style: style),
        ),
      ),
    );
  }
}
