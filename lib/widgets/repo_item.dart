import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:git_touch/models/bitbucket.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:github/github.dart' as github;
import 'package:gql_github/repos.data.gql.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/rhodecode.dart';

class RepoItem extends StatelessWidget {
  const RepoItem({
    required this.owner,
    required this.avatarUrl,
    required this.name,
    required this.description,
    required this.starCount,
    required this.forkCount,
    this.primaryLanguageName,
    this.primaryLanguageColor,
    this.note,
    this.iconData,
    required this.url,
    required this.avatarLink,
  });

  RepoItem.go({
    required GogsRepository payload,
    this.primaryLanguageName,
    this.primaryLanguageColor,
    this.note,
    this.owner,
    this.name,
  })  : url = '/gogs/${payload.fullName}',
        avatarUrl = payload.owner!.avatarUrl,
        avatarLink = '/gogs/${payload.fullName}',
        description = payload.description,
        forkCount = payload.forksCount,
        starCount = payload.starsCount,
        iconData = payload.private! ? Octicons.lock : null;

  RepoItem.bb({
    required BbRepo payload,
    this.primaryLanguageName,
    this.primaryLanguageColor,
  })  : owner = payload.ownerLogin,
        name = payload.name,
        url = '/bitbucket/${payload.fullName}',
        avatarUrl = payload.avatarUrl,
        avatarLink = null,
        note = 'Updated ${timeago.format(payload.updatedOn!)}',
        description = payload.description,
        forkCount = 0,
        starCount = 0,
        iconData = payload.isPrivate! ? Octicons.lock : null;

  RepoItem.gl({
    required GitlabProject payload,
    this.primaryLanguageName,
    this.primaryLanguageColor,
    this.note,
  })  : owner = payload.namespace!.path,
        avatarUrl = payload.owner?.avatarUrl,
        name = payload.name,
        description = payload.description,
        starCount = payload.starCount,
        forkCount = payload.forksCount,
        url = '/gitlab/projects/${payload.id}',
        avatarLink = payload.namespace!.kind == 'group'
            ? '/gitlab/group/${payload.namespace!.id}'
            : '/gitlab/user/${payload.namespace!.id}',
        iconData = _buildGlIconData(payload.visibility);

  RepoItem.gh({
    required this.owner,
    required this.avatarUrl,
    required this.name,
    required this.description,
    required this.starCount,
    required this.forkCount,
    this.primaryLanguageName,
    this.primaryLanguageColor,
    this.note,
    required bool? isPrivate,
    required bool? isFork,
  })  : iconData = _buildIconData(isPrivate, isFork),
        avatarLink = '/github/$owner',
        url = '/github/$owner/$name';

  RepoItem.rh({
    required RhRepo payload,
    this.primaryLanguageName,
    this.primaryLanguageColor,
    this.note,
  })  : name = payload.repoName,
        description = payload.description,
        url = '/rhodecode/repository/${payload.repoId}',
        iconData = _buildIconData(payload.private, payload.forkOfId != null),
        owner = payload.owner,
        forkCount = 0, //TODO
        starCount = 0, // TODO
        avatarLink = 'TODO',
        avatarUrl = 'TODO';

  factory RepoItem.gql(GRepoParts v, {String? note}) {
    return RepoItem.gh(
      owner: v.owner.login,
      avatarUrl: v.owner.avatarUrl,
      name: v.name,
      description: v.description,
      starCount: v.stargazers.totalCount,
      forkCount: v.forks.totalCount,
      primaryLanguageName: v.primaryLanguage?.name,
      primaryLanguageColor: v.primaryLanguage?.color,
      note: note,
      isPrivate: v.isPrivate,
      isFork: v.isFork,
    );
  }
  final String? owner;
  final String? avatarUrl;
  final String? name;
  final String? description;
  final IconData? iconData;
  final int? starCount;
  final int? forkCount;
  final String? primaryLanguageName;
  final String? primaryLanguageColor;
  final String? note;
  final String url;
  final String? avatarLink;

  static IconData? _buildIconData(bool? isPrivate, bool? isFork) {
    if (isPrivate == true) return Octicons.lock;
    if (isFork == true) return Octicons.repo_forked;
    return null;
  }

  static IconData _buildGlIconData(String? visibility) {
    switch (visibility) {
      case 'internal':
        return Ionicons.shield_outline;
      case 'public':
        return Ionicons.globe_outline;
      case 'private':
        return Ionicons.lock_closed_outline;
      default:
        return Octicons.repo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);
    const bottomGap = SizedBox(width: 4);

    return AntListItem(
      arrow: null,
      onClick: () {
        context.pushUrl(url);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Avatar(
                url: avatarUrl,
                size: AvatarSize.small,
                linkUrl: avatarLink,
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: '$owner / ',
                      style: TextStyle(
                          height: 1, fontSize: 18, color: theme.colorPrimary),
                    ),
                    TextSpan(
                      text: name,
                      style: TextStyle(
                        height: 1,
                        fontSize: 18,
                        color: theme.colorPrimary,
                        fontWeight: FontWeight.w600,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (iconData != null)
                DefaultTextStyle(
                  style: TextStyle(color: theme.colorTextSecondary),
                  child:
                      Icon(iconData, size: 18, color: theme.colorTextSecondary),
                ),
            ].withSeparator(const SizedBox(width: 8)),
          ),
          if (description != null && description!.isNotEmpty)
            Text(
              description!,
              style: TextStyle(color: theme.colorTextSecondary, fontSize: 16),
            ),
          if (note != null)
            Text(note!, style: TextStyle(fontSize: 14, color: theme.colorWeak)),
          Builder(builder: (context) {
            return DefaultTextStyle(
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 14),
              child: IconTheme(
                data: IconThemeData(size: 14, color: theme.colorText),
                child: Row(
                  children: <Widget>[
                    if (primaryLanguageName != null)
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: fromCssColor(primaryLanguageColor ??
                                  github.languageColors[primaryLanguageName!]!),
                              shape: BoxShape.circle,
                            ),
                          ),
                          bottomGap,
                          Text(primaryLanguageName!),
                        ],
                      ),
                    if (starCount! > 0)
                      Row(
                        children: [
                          const Icon(Octicons.star),
                          bottomGap,
                          Text(numberFormat.format(starCount)),
                        ],
                      ),
                    if (forkCount! > 0)
                      Row(
                        children: [
                          const Icon(Octicons.repo_forked),
                          bottomGap,
                          Text(numberFormat.format(forkCount)),
                        ],
                      ),
                  ].withSeparator(const SizedBox(width: 24)),
                ),
              ),
            );
          }),
        ].withSeparator(const SizedBox(height: 8)),
      ),
    );
  }
}
