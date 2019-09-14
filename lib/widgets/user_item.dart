import 'package:flutter/material.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:primer/primer.dart';

class UserItem extends StatelessWidget {
  final String login;
  final String name;
  final String avatarUrl;
  final String bio;

  UserItem(this.login, {this.name, this.avatarUrl, this.bio});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    style: TextStyle(color: PrimerColors.gray700, fontSize: 16),
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
    );
  }
}
