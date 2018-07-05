import 'package:flutter/material.dart';
// import '../utils.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class UserPage extends StatelessWidget {
  final String login;
  final String avatar;
  UserPage(this.login, this.avatar);
  final double _appBarHeight = 256.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  build(context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: _appBarHeight,
        pinned: _appBarBehavior == AppBarBehavior.pinned,
        floating: _appBarBehavior == AppBarBehavior.floating ||
            _appBarBehavior == AppBarBehavior.snapping,
        snap: _appBarBehavior == AppBarBehavior.snapping,
        actions: [
          IconButton(
            icon:  Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: () {
              // _scaffoldKey.currentState.showSnackBar( SnackBar(
              //     content:  Text(
              //         'This is actually just a demo. Editing isn\'t supported.')));
            },
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          title: Text(login),
          background: Stack(
            fit: StackFit.expand,
            children: [
               DecoratedBox(
                decoration:  BoxDecoration(
                  gradient:  LinearGradient(
                    begin:  Alignment(0.0, -1.0),
                    end:  Alignment(0.0, -0.4),
                    colors:  <Color>[
                       Color(0x60000000),
                       Color(0x00000000)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
