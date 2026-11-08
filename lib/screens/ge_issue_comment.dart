import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';

class GeIssueCommentScreen extends StatefulWidget {
  const GeIssueCommentScreen(this.owner, this.name, this.number,
      {this.isPr = false, this.body = '', this.id = ''});
  final String owner;
  final String name;
  final String number;
  final bool isPr;
  final String body;
  final String id;

  @override
  State<GeIssueCommentScreen> createState() => _GeIssueCommentScreenState();
}

class _GeIssueCommentScreenState extends State<GeIssueCommentScreen> {
  bool isEdit = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.body;
    if (_controller.text != '') {
      isEdit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return CommonScaffold(
      title: Text(isEdit ? 'Update Comment' : 'New Comment'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: CommonStyle.padding,
            child: CupertinoTextField(
              controller: _controller,
              style: TextStyle(color: AntTheme.of(context).colorText),
              placeholder: AppLocalizations.of(context)!.body,
              maxLines: 10,
            ),
          ),
          AntButton(
            color: AntTheme.of(context).colorPrimary,
            child: const Text('Comment'),
            onClick: () async {
              if (!isEdit) {
                await auth.fetchGitee(
                  '/repos/${widget.owner}/${widget.name}/${widget.isPr ? 'pulls' : 'issues'}/${widget.number}/comments',
                  requestType: 'POST',
                  body: {'body': _controller.text, 'repo': widget.name},
                );
              } else {
                await auth.fetchGitee(
                  '/repos/${widget.owner}/${widget.name}/${widget.isPr ? 'pulls' : 'issues'}/comments/${int.parse(widget.id)}',
                  requestType: 'PATCH',
                  body: {'body': _controller.text, 'repo': widget.name},
                );
              }
              Navigator.pop(context, '');
              await context.pushUrl(
                '/gitee/${widget.owner}/${widget.name}/${widget.isPr ? 'pulls' : 'issues'}/${widget.number}',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
