import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/files_item.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:github/github.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class GhCommit extends StatelessWidget {
  final String owner;
  final String name;
  final String sha;
  GhCommit(this.owner, this.name, this.sha);

  Widget _buildStats(
      BuildContext context, int filesChanged, CommitStats stats) {
    final theme = Provider.of<ThemeModel>(context);
    return Container(
      padding: CommonStyle.padding,
      child: Column(
        children: [
          CommonStyle.border,
          SizedBox(height: 8),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    '${AppLocalizations.of(context)!.filesChanged(filesChanged)}',
                    style: TextStyle(
                      color: theme.palette.secondaryText,
                      fontSize: 17,
                    )),
                Row(
                  children: <Widget>[
                    Text('+${stats.additions}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                        )),
                    SizedBox(width: 2),
                    Text('-${stats.deletions}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        )),
                  ],
                ),
              ]),
          SizedBox(height: 8),
          CommonStyle.border
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required String? avatarUrl,
    required String title,
    required String author,
  }) {
    final theme = Provider.of<ThemeModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: CommonStyle.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LinkWidget(
                url: '/github/$author',
                child: Row(
                  children: <Widget>[
                    Avatar(url: avatarUrl, size: AvatarSize.extraSmall),
                    SizedBox(width: 4),
                    Text(
                      '$author',
                      style: TextStyle(
                        fontSize: 17,
                        color: theme.palette.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold(
      title: AppBarTitle(
          '${AppLocalizations.of(context)!.commit} ${sha.substring(0, 8)}'),
      fetch: () async {
        // TODO: change to graphql when files diff is available via graphql
        final res = await context.read<AuthModel>().ghClient.getJSON(
            '/repos/$owner/$name/commits/$sha',
            convert: (dynamic vs) => RepositoryCommit.fromJson(vs));
        return res;
      },
      actionBuilder: (dynamic v, _) {
        return ActionButton(
          title: AppLocalizations.of(context)!.actions,
          items: [
            ...ActionItem.getUrlActions(
                'https://github.com/$owner/$name/commits/$sha'),
          ],
        );
      },
      bodyBuilder: (dynamic v, _) {
        return Column(
          children: [
            _buildHeader(context,
                avatarUrl: v.author.avatarUrl,
                title: v.commit.message,
                author: v.author.login),
            _buildStats(context, v.files.length, v.stats),
            Wrap(
              children: v.files
                  .map<Widget>((vs) => FilesItem(
                        filename: vs.name,
                        additions: vs.additions,
                        deletions: vs.deletions,
                        status: vs.status,
                        patch: vs.patch ??
                            "${AppLocalizations.of(context)!.blankDiff}",
                      ))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
