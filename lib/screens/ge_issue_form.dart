import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class GeIssueFormScreen extends StatefulWidget {
  final String owner;
  final String name;
  GeIssueFormScreen(this.owner, this.name);

  @override
  _GeIssueFormScreenState createState() => _GeIssueFormScreenState();
}

class _GeIssueFormScreenState extends State<GeIssueFormScreen> {
  var _title = '';
  var _body = '';

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    return CommonScaffold(
      title: Text(AppLocalizations.of(context)!.submitAnIssue),
      body: Column(
        children: <Widget>[
          Padding(
            padding: CommonStyle.padding,
            child: CupertinoTextField(
              style: TextStyle(color: theme.palette.text),
              placeholder: AppLocalizations.of(context)!.title,
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
              placeholder: AppLocalizations.of(context)!.body,
              onChanged: (v) {
                setState(() {
                  _body = v;
                });
              },
              maxLines: 10,
            ),
          ),
          CupertinoButton.filled(
            child: Text(AppLocalizations.of(context)!.submit),
            onPressed: () async {
              final res = await auth.fetchGitee(
                '/repos/${widget.owner}/issues',
                requestType: 'POST',
                body: {'body': _body, 'title': _title, 'repo': widget.name},
              ).then((v) {
                return GiteeIssue.fromJson(v);
              });
              await theme.push(
                context,
                '/gitee/${widget.owner}/${widget.name}/issues/${res.number}',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
