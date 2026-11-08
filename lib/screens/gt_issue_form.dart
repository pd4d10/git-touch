import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class GtIssueFormScreen extends StatefulWidget {
  const GtIssueFormScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  State<GtIssueFormScreen> createState() => _GtIssueFormScreenState();
}

class _GtIssueFormScreenState extends State<GtIssueFormScreen> {
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
              await auth.fetchGitea(
                '/repos/${widget.owner}/${widget.name}/issues',
                requestType: 'POST',
                body: {'body': _body, 'title': _title},
              ).then((v) {
                return GiteaIssue.fromJson(v);
              });
              Navigator.pop(context);
              await AntToast.show(
                context,
                content: const Text('Issue submitted'),
              );
              await context.pushUrl(
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
