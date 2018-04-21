import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils.dart';

class IosUserPage extends StatelessWidget {
  String login;
  String avatar;
  IosUserPage(this.login, this.avatar);

  @override
  build(context) {
    return new CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
          leading: new CupertinoButton(
            child: const Text('Cancel'),
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          middle: new Text(login),
        ),
        child: new FutureBuilder(
          future: fetchUser(login),
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.hasData) {
              User user = snapshot.data;
              return new Text('');
            } else if (snapshot.hasError) {
              widget = new Text("${snapshot.error}");
            } else {
              widget = new CupertinoActivityIndicator();
            }
            return widget;
          },
        ));
  }
}
