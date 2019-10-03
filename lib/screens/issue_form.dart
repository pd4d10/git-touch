import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class IssueFormScreen extends StatefulWidget {
  final String owner;
  final String name;

  IssueFormScreen(this.owner, this.name);

  @override
  _IssueFormScreenState createState() => _IssueFormScreenState();
}

class _IssueFormScreenState extends State<IssueFormScreen> {
  String get owner => widget.owner;
  String get name => widget.name;

  String _title = '';
  String _body = '';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: Text('Submit an issue'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: CommonStyle.padding,
            child: CupertinoTextField(
              placeholder: 'Title',
              onChanged: (v) {
                setState(() {
                  _title = v;
                });
              },
            ),
          ),
          Padding(
            padding: CommonStyle.padding,
            child: CupertinoTextField(
              placeholder: 'Body',
              onChanged: (v) {
                setState(() {
                  _body = v;
                });
              },
              maxLines: 10,
            ),
          ),
          CupertinoButton.filled(
            child: Text('Submit'),
            onPressed: () async {
              try {
                var res =
                    await Provider.of<AuthModel>(context).postWithCredentials(
                  '/repos/$owner/$name/issues',
                  body: {'title': _title, 'body': _body},
                );
                if (res.statusCode != HttpStatus.created) {
                  throw 'Create fail, response: ${res.body}';
                }
                await Provider.of<ThemeModel>(context)
                    .showConfirm(context, Text('Issue created'));
                Navigator.of(context).pop();
              } catch (err) {
                print(err); // TODO:
              }
            },
          ),
        ],
      ),
    );
  }
}
