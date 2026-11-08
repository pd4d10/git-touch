import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class BbIssueFormScreen extends StatefulWidget {
  const BbIssueFormScreen(this.owner, this.name);
  final String owner;
  final String name;

  @override
  State<BbIssueFormScreen> createState() => _BbIssueFormScreenState();
}

class _BbIssueFormScreenState extends State<BbIssueFormScreen> {
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
              await auth.fetchBbJson(
                '/repositories/${widget.owner}/${widget.name}/issues',
                isPost: true,
                body: {'body': _body, 'title': _title},
              ).then((v) {
                return BbIssues.fromJson(v);
              });
              Navigator.pop(context, true);
              await AntToast.show(
                context,
                content: const Text('Issue submitted'),
              );
              await context.pushUrl(
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
