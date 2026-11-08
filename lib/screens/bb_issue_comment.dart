import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class BbIssueCommentScreen extends StatefulWidget {
  const BbIssueCommentScreen(this.owner, this.name, this.number);
  final String owner;
  final String name;
  final String number;

  @override
  State<BbIssueCommentScreen> createState() => _BbIssueCommentScreenState();
}

class _BbIssueCommentScreenState extends State<BbIssueCommentScreen> {
  var _body = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return CommonScaffold(
      title: const Text('New Comment'),
      body: Column(
        children: <Widget>[
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
            child: const Text('Comment'),
            onClick: () async {
              await auth.fetchBb(
                '/repositories/${widget.owner}/${widget.name}/issues/${widget.number}/comments',
                isPost: true,
                body: {
                  'content': {'raw': _body}
                },
              );
              Navigator.pop(context, true);
              await context.pushUrl(
                '/bitbucket/${widget.owner}/${widget.name}/issues/${widget.number}',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
