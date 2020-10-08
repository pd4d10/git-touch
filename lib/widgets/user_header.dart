import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/mutation_button.dart';
import 'package:provider/provider.dart';

class UserHeader extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String login;
  final DateTime createdAt;
  final String bio;
  final List<Widget> rightWidgets;

  UserHeader({
    @required this.avatarUrl,
    @required this.name,
    @required this.login,
    @required this.createdAt,
    @required this.bio,
    bool isViewer = false,
    List<Widget> rightWidgets,
  }) : this.rightWidgets = [
          ...(rightWidgets ?? []),
          if (isViewer)
            MutationButton(
              active: false,
              text: 'Switch accounts',
              url: '/login',
            )
        ];

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      padding: CommonStyle.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Avatar(url: avatarUrl, size: AvatarSize.extraLarge),
              if (rightWidgets?.isNotEmpty) ...[
                Expanded(child: Container()),
                ...rightWidgets,
              ]
            ],
          ),
          SizedBox(height: 8),
          if (name != null && name.isNotEmpty) ...[
            Text(
              name,
              style: TextStyle(
                color: theme.palette.text,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
          ],
          Text(
            login,
            style: TextStyle(
              color: theme.palette.primary,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          if (createdAt != null)
            Row(
              children: <Widget>[
                Icon(
                  Octicons.clock,
                  size: 16,
                  color: theme.palette.tertiaryText,
                ),
                SizedBox(width: 4),
                Text(
                  'Joined on ${dateFormat.format(createdAt)}',
                  style: TextStyle(
                    color: theme.palette.tertiaryText,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          if (bio != null && bio.isNotEmpty) ...[
            SizedBox(height: 10),
            Text(
              bio,
              style: TextStyle(
                color: theme.palette.secondaryText,
                fontSize: 17,
              ),
            )
          ]
        ],
      ),
    );
  }
}
