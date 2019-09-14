import 'package:flutter/material.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:primer/primer.dart';

class UserItem extends StatelessWidget {
  final String login;
  final String name;
  final String avatarUrl;
  final String bio;
  final bool inUserScreen;

  UserItem(this.login,
      {this.name, this.avatarUrl, this.bio, this.inUserScreen = false});

  @override
  Widget build(BuildContext context) {
    final widget = Container(
      padding: EdgeInsets.all(10),
      color: PrimerColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Avatar(url: avatarUrl, size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      name ?? login,
                      style: TextStyle(
                        color: PrimerColors.blue500,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      login,
                      style:
                          TextStyle(color: PrimerColors.gray700, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                if (bio != null && bio.isNotEmpty)
                  Text(
                    bio,
                    style: TextStyle(color: PrimerColors.gray700, fontSize: 15),
                  ),
              ],
            ),
          )
        ],
      ),
    );

    if (inUserScreen) {
      return widget;
    } else {
      return Link(screenBuilder: (_) => UserScreen(login), child: widget);
    }
  }
}
