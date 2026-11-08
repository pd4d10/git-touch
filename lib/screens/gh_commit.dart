import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/files_item.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';

class GhCommit extends StatelessWidget {
  const GhCommit(this.owner, this.name, this.sha);
  final String owner;
  final String name;
  final String sha;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<RepositoryCommit>(
      title: Text(
          '${AppLocalizations.of(context)!.commit} ${sha.substring(0, 8)}'),
      fetch: () async {
        // TODO: change to graphql when files diff is available via graphql
        final res = await context
            .read<AuthModel>()
            .ghClient
            .repositories
            .getCommit(RepositorySlug(owner, name), sha);
        return res;
      },
      actionBuilder: (v, _) {
        return ActionButton(
          title: AppLocalizations.of(context)!.actions,
          items: [
            ...ActionItem.getUrlActions(
                'https://github.com/$owner/$name/commit/$sha'),
          ],
        );
      },
      bodyBuilder: (v, _) {
        final theme = AntTheme.of(context);

        return Column(
          children: [
            Container(
              padding: CommonStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LinkWidget(
                    url: v.author == null ? null : '/github/${v.author!.login}',
                    child: Row(
                      children: <Widget>[
                        Avatar(
                            url: v.author?.avatarUrl,
                            size: AvatarSize.extraSmall),
                        const SizedBox(width: 4),
                        Text(
                          v.author?.login ?? 'ghost',
                          style: TextStyle(
                            fontSize: 17,
                            color: theme.colorTextSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    v.commit?.message ?? 'no message',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: CommonStyle.padding,
              child: Column(
                children: [
                  CommonStyle.border,
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            AppLocalizations.of(context)!
                                .filesChanged(v.files?.length ?? 0),
                            style: TextStyle(
                              color: theme.colorTextSecondary,
                              fontSize: 17,
                            )),
                        Row(
                          children: <Widget>[
                            Text('+${v.stats?.additions ?? 0}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                )),
                            const SizedBox(width: 2),
                            Text('-${v.stats?.deletions ?? 0}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ]),
                  const SizedBox(height: 8),
                  CommonStyle.border
                ],
              ),
            ),
            Wrap(
              children: (v.files ?? [])
                  .map<Widget>((vs) => FilesItem(
                        filename: vs.name,
                        additions: vs.additions,
                        deletions: vs.deletions,
                        status: vs.status,
                        patch:
                            vs.patch ?? AppLocalizations.of(context)!.blankDiff,
                      ))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
