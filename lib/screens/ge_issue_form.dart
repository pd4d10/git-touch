import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class GeIssueFormScreen extends StatefulWidget {
  const GeIssueFormScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  State<GeIssueFormScreen> createState() => _GeIssueFormScreenState();
}

class _GeIssueFormScreenState extends State<GeIssueFormScreen> {
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
              await AntToast.show(
                context,
                content: const Text('Issue submitted'),
              );
              await context.pushUrl(
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
