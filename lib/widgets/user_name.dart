import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/user.dart';
import 'link.dart';

final style = TextStyle(fontWeight: FontWeight.w600);

class UserName extends StatelessWidget {
  final String login;

  UserName(this.login);

  @override
  Widget build(BuildContext context) {
    return Link(
      screenBuilder: (_) => UserScreen(login),
      child: Container(
        // padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Text(login, style: style),
      ),
    );
  }
}
