import 'package:flutter/material.dart';

class ErrorReload extends StatelessWidget {
  final String text;
  final Function onTap;

  ErrorReload({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(
            'Woops, something bad happened. Error message:',
            style: TextStyle(fontSize: 16),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.redAccent,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          GestureDetector(
            child: Text(
              'Reload',
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
