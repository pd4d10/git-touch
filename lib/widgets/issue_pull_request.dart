import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/widgets.dart';

// Widget of issue screen and pull request screen
class IssuePullRequestScreen extends StatefulWidget {
  final int id;
  final String owner;
  final String name;
  final Function init;
  final Widget extra;

  IssuePullRequestScreen({
    this.id,
    this.owner,
    this.name,
    this.init,
    this.extra,
  });

  @override
  _IssuePullRequestScreenState createState() => _IssuePullRequestScreenState();
}

class _IssuePullRequestScreenState extends State<IssuePullRequestScreen> {
  Map<String, dynamic> payload;

  @override
  void initState() {
    super.initState();
    widget.init().then((_payload) {
      setState(() {
        payload = _payload;
      });
    });
  }

  get _fullName => widget.owner + '/' + widget.name;

  Widget _buildBody(BuildContext context) {
    if (payload == null) {
      return CupertinoActivityIndicator();
    }

    List items = payload['timeline']['nodes'];

    return Column(children: <Widget>[
      Container(
        // padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.extra,
            Text(payload['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                )),
            // CommentItem(payload),
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: comments.length,
            //   itemBuilder: _buildCommentItem,
            // ),
            Column(
                children:
                    items.map((item) => TimelineItem(item, payload)).toList()),
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_fullName + ' #' + widget.id.toString()),
        trailing: Icon(Icons.more_vert, size: 24),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: _buildBody(context),
        ),
      ),
    );
  }
}
