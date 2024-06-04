import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/mutation_button.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.login,
    required this.createdAt,
    required this.bio,
    this.isViewer = true,
    this.rightWidgets = const [],
  });
  final String? avatarUrl;
  final String? name;
  final String? login;
  final DateTime? createdAt;
  final String? bio;
  final bool isViewer;
  final List<Widget> rightWidgets;

  @override
  Widget build(BuildContext context) {
    final right = isViewer
        ? [
            MutationButton(
              text: 'Switch accounts',
              onTap: () {
                context.pushUrl('/login');
              },
            )
          ]
        : rightWidgets;

    return Container(
      padding: CommonStyle.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Avatar(url: avatarUrl, size: AvatarSize.extraLarge),
              if (right.isNotEmpty) ...[
                Expanded(child: Container()),
                ...right,
              ]
            ],
          ),
          if (name != null && name!.isNotEmpty)
            Text(
              name!,
              style: TextStyle(
                color: AntTheme.of(context).colorText,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          Text(
            login!,
            style: TextStyle(
                color: AntTheme.of(context).colorPrimary, fontSize: 18),
          ),
          if (createdAt != null)
            Row(
              children: <Widget>[
                Icon(
                  Octicons.clock,
                  size: 16,
                  color: AntTheme.of(context).colorWeak,
                ),
                const SizedBox(width: 4),
                Text(
                  'Joined on ${dateFormat.format(createdAt!)}',
                  style: TextStyle(
                      color: AntTheme.of(context).colorWeak, fontSize: 16),
                ),
              ],
            ),
          if (bio != null && bio!.isNotEmpty)
            Text(
              bio!,
              style: TextStyle(
                color: AntTheme.of(context).colorTextSecondary,
                fontSize: 17,
              ),
            )
        ].withSeparator(const SizedBox(height: 8)),
      ),
    );
  }
}
