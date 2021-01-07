import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class GeIssueCommentScreen extends StatefulWidget {
  final String owner;
  final String name;
  final String number;
  final bool isPr;
  GeIssueCommentScreen(this.owner, this.name, this.number, {this.isPr: false});

  @override
  _GeIssueCommentScreenState createState() => _GeIssueCommentScreenState();
}

class _GeIssueCommentScreenState extends State<GeIssueCommentScreen> {
  var _body = '';

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    return CommonScaffold(
      title: Text('New Comment'),
      body: Column(
        children: <Widget>[
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
            child: Text('Comment'),
            onPressed: () async {
              if (!widget.isPr) {
                final res = await auth.fetchGitee(
                  '/repos/${widget.owner}/${widget.name}/issues/${widget.number}/comments',
                  isPost: true,
                  body: {'body': _body, 'repo': widget.name},
                ).then((v) {
                  return GiteeIssue.fromJson(v);
                });
                Navigator.pop(context, '');
                await theme.push(
                  context,
                  '/gitee/${widget.owner}/${widget.name}/issues/${widget.number}',
                  replace: true,
                );
              } else {
                final res = await auth.fetchGitee(
                  '/repos/${widget.owner}/${widget.name}/pulls/${widget.number}/comments',
                  isPost: true,
                  body: {'body': _body, 'repo': widget.name},
                ).then((v) {
                  return GiteePull.fromJson(v);
                });
                Navigator.pop(context, '');
                await theme.push(
                  context,
                  '/gitee/${widget.owner}/${widget.name}/pulls/${widget.number}',
                  replace: true,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
