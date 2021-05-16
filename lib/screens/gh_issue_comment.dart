import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/graphql/github.req.gql.dart';

class GhIssueCommentScreen extends StatefulWidget {
  final String owner;
  final String name;
  final String number;
  final bool isPr;
  final String body;
  final String id;
  GhIssueCommentScreen(this.owner, this.name, this.number,
      {this.isPr: false, this.body: '', this.id: ''});

  @override
  _GhIssueCommentScreenState createState() => _GhIssueCommentScreenState();
}

class _GhIssueCommentScreenState extends State<GhIssueCommentScreen> {
  bool isEdit = false;
  TextEditingController _controller = new TextEditingController();

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
    final theme = Provider.of<ThemeModel>(context);
    return CommonScaffold(
      title: Text(isEdit ? 'Update Comment' : 'New Comment'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: CommonStyle.padding,
            child: CupertinoTextField(
              controller: _controller,
              style: TextStyle(color: theme.palette.text),
              placeholder: 'Body',
              maxLines: 10,
            ),
          ),
          CupertinoButton.filled(
            child: Text('Comment'),
            onPressed: () async {
              if (!isEdit) {
                final req = GaddCommentReq((b) => b
                  ..vars.body = _controller.text
                  ..vars.subjectId = widget.id);
                final res = await context
                    .read<AuthModel>()
                    .gqlClient
                    .request(req)
                    .first;
              } else {
                final req = GupdateIssueCommentReq((b) => b
                  ..vars.body = _controller.text
                  ..vars.id = widget.id);
                final res = await context
                    .read<AuthModel>()
                    .gqlClient
                    .request(req)
                    .first;
              }
              Navigator.pop(context, '');
              await theme.push(
                context,
                '/github/${widget.owner}/${widget.name}/${widget.isPr ? 'pulls' : 'issues'}/${widget.number}',
                replace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
