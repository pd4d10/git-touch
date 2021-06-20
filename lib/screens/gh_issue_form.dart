import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

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
              final slug = RepositorySlug(widget.owner, widget.name);
              final res = await context
                  .read<AuthModel>()
                  .ghClient
                  .issues
                  .create(slug, IssueRequest(title: _title, body: _body));
              final snackBar = SnackBar(content: Text('Issue submitted'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
