import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';

class GhIssueFormScreen extends StatefulWidget {
  final String owner;
  final String name;
  GhIssueFormScreen(this.owner, this.name);

  @override
  _GhIssueFormScreenState createState() => _GhIssueFormScreenState();
}

class _GhIssueFormScreenState extends State<GhIssueFormScreen> {
  var _title = '';
  var _body = '';

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return CommonScaffold(
      title: Text('Submit an issue'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: CommonStyle.padding,
            child: CupertinoTextField(
              style: TextStyle(color: theme.palette.text),
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
              style: TextStyle(color: theme.palette.text),
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
              final auth = Provider.of<AuthModel>(context);
              final theme = Provider.of<ThemeModel>(context);

              final slug = RepositorySlug(widget.owner, widget.name);

              // TODO: https://github.com/SpinlockLabs/github.dart/issues/211
              // final res = await auth.ghClient.issues
              //     .create(slug, IssueRequest(title: _title, body: _body));

              final response = await auth.ghClient.request(
                'POST',
                '/repos/${slug.fullName}/issues',
                body: jsonEncode({'title': _title, 'body': _body}),
              );
              final res = Issue.fromJson(
                  jsonDecode(response.body) as Map<String, dynamic>);
              await theme.push(
                context,
                '/github/${widget.owner}/${widget.name}/issues/${res.number}',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
