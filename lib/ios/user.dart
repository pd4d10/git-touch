import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import 'package:git_touch/utils/utils.dart';

class IosUserPage extends StatelessWidget {
  String login;
  String avatar;
  IosUserPage(this.login, this.avatar);

  @override
  build(context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: Text('Cancel'),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        middle: Text(login),
      ),
      child: FutureBuilder(
        // future: fetchUser(login),
        builder: (context, snapshot) {
          Widget widget;
          if (snapshot.hasData) {
            // User user = snapshot.data;
            return Text('');
          } else if (snapshot.hasError) {
            widget = Text("${snapshot.error}");
          } else {
            widget = CupertinoActivityIndicator();
          }
          return widget;
        },
      ),
    );
  }
}
