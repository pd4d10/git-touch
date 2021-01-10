import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class GtIssueFormScreen extends StatefulWidget {
  final String owner;
  final String name;
  GtIssueFormScreen(this.owner, this.name);

  @override
  _GtIssueFormScreenState createState() => _GtIssueFormScreenState();
}

class _GtIssueFormScreenState extends State<GtIssueFormScreen> {
  var _title = '';
  var _body = '';

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
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
              final res = await auth.fetchGitea(
                '/repos/${widget.owner}/${widget.name}/issues',
                requestType: 'POST',
                body: {'body': _body, 'title': _title},
              ).then((v) {
                return GiteaIssue.fromJson(v);
              });
              Navigator.pop(context);
              await theme.push(
                context,
                '/gitea/${widget.owner}/${widget.name}/issues',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
