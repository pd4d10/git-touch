import 'package:flutter/material.dart';

class RepoScreen extends StatefulWidget {
  final String owner;
  final String name;
  RepoScreen(this.owner, this.name);

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.owner),
    );
  }
}
