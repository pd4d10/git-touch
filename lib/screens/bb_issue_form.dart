import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class BbIssueFormScreen extends StatefulWidget {
  final String owner;
  final String name;
  BbIssueFormScreen(this.owner, this.name);

  @override
  _BbIssueFormScreenState createState() => _BbIssueFormScreenState();
}

class _BbIssueFormScreenState extends State<BbIssueFormScreen> {
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
              await auth.fetchBbJson(
                '/repositories/${widget.owner}/${widget.name}/issues',
                isPost: true,
                body: {'body': _body, 'title': _title},
              ).then((v) {
                return BbIssues.fromJson(v);
              });
              Navigator.pop(context, true);
              final snackBar = SnackBar(content: Text('Issue submitted'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              await theme.push(
                context,
                '/bitbucket/${widget.owner}/${widget.name}/issues',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
