import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IssueScreen extends StatefulWidget {
  final int id;
  final String repo;
  IssueScreen(this.id, this.repo);

  @override
  _IssueScreenState createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.repo + ' #' + widget.id.toString()),
        trailing: Icon(Icons.more_vert, size: 24),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(widget.id.toString() + widget.repo),
            ),
          ],
        ),
      ),
    );
  }
}
