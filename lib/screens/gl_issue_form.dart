import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class GlIssueFormScreen extends StatefulWidget {
  const GlIssueFormScreen(this.id);
  final int id;

  @override
  State<GlIssueFormScreen> createState() => _GlIssueFormScreenState();
}

class _GlIssueFormScreenState extends State<GlIssueFormScreen> {
  var _title = '';
  var _body = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
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
              final res = await auth.fetchGitlab(
                '/projects/${widget.id}/issues',
                isPost: true,
                body: {'description': _body, 'title': _title},
              ).then((v) {
                return GitlabIssue.fromJson(v);
              });
              await AntToast.show(
                context,
                content: const Text('Issue submitted'),
              );
              await context.pushUrl(
                '/gitlab/projects/${widget.id}/issues/${res.iid}',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
