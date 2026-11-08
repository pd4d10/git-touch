import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';

class GhIssueFormScreen extends StatefulWidget {
  const GhIssueFormScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  State<GhIssueFormScreen> createState() => _GhIssueFormScreenState();
}

class _GhIssueFormScreenState extends State<GhIssueFormScreen> {
  var _title = '';
  var _body = '';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: Text(AppLocalizations.of(context)!.submitAnIssue),
      body: Column(
        children: <Widget>[
          Padding(
            padding: CommonStyle.padding,
            child: CupertinoTextField(
              style: TextStyle(color: AntTheme.of(context).colorText),
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
              style: TextStyle(color: AntTheme.of(context).colorText),
              placeholder: AppLocalizations.of(context)!.body,
              onChanged: (v) {
                setState(() {
                  _body = v;
                });
              },
              maxLines: 10,
            ),
          ),
          AntButton(
            color: AntTheme.of(context).colorPrimary,
            child: Text(AppLocalizations.of(context)!.submit),
            onClick: () async {
              final slug = RepositorySlug(widget.owner, widget.name);
              final res = await context
                  .read<AuthModel>()
                  .ghClient
                  .issues
                  .create(slug, IssueRequest(title: _title, body: _body));
              await AntToast.show(
                context,
                content: const Text('Issue submitted'),
              );
              await context.pushUrl(
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
