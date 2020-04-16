import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

class RepoHeader extends StatelessWidget {
  final String avatarUrl;
  final String avatarLink;
  final String owner;
  final String name;
  final String description;
  final String homepageUrl;
  final List<Widget> actions;
  final List<Widget> trailings;

  RepoHeader({
    @required this.avatarUrl,
    @required this.avatarLink,
    @required this.owner,
    @required this.name,
    @required this.description,
    this.homepageUrl,
    this.actions,
    this.trailings,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      padding: CommonStyle.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: join(SizedBox(height: 12), [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Avatar(
                url: avatarUrl,
                size: AvatarSize.small,
                linkUrl: avatarLink,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$owner / $name',
                  style: TextStyle(
                    fontSize: 20,
                    color: theme.palette.primary,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          if (actions != null) ...actions,
          if (description != null && description.isNotEmpty)
            Text(
              description,
              style: TextStyle(
                color: theme.palette.secondaryText,
                fontSize: 17,
              ),
            ),
          if (homepageUrl != null && homepageUrl.isNotEmpty)
            Link(
              url: homepageUrl,
              child: Text(
                homepageUrl,
                style: TextStyle(
                  color: theme.palette.primary,
                  fontSize: 17,
                ),
              ),
            ),
          if (trailings != null) ...trailings
        ]),
      ),
    );
  }
}
