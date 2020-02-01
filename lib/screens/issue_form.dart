import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/graphql/gh.dart';
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
              final r0 = await auth.gqlClient.execute(
                GhRepoIdQuery(
                  variables:
                      GhRepoIdArguments(owner: widget.owner, name: widget.name),
                ),
              );
              final res = await auth.gqlClient.execute(GhCreateIssueQuery(
                variables: GhCreateIssueArguments(
                    repoId: r0.data.repository.id, title: _title, body: _body),
              ));
              final issue = res.data.createIssue.issue;
              await theme.push(
                context,
                '/${issue.repository.owner.login}/${issue.repository.name}/issues/${issue.number}',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
