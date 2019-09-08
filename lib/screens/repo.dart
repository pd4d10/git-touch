import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/settings.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/commits.dart';
import 'package:git_touch/screens/object.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../scaffolds/refresh.dart';
import '../widgets/repo_item.dart';
import '../widgets/entry_item.dart';
import '../screens/issues.dart';
import '../screens/user.dart';
import '../screens/organization.dart';
import '../widgets/action.dart';

class RepoScreen extends StatelessWidget {
  final String owner;
  final String name;

  static const _languageBarPadding = 10.0;

  RepoScreen(this.owner, this.name);
  RepoScreen.fromFullName(String fullName)
      : owner = fullName.split('/')[0],
        name = fullName.split('/')[1];

  Future queryRepo(BuildContext context) async {
    var data = await Provider.of<SettingsModel>(context).query('''
{
  repository(owner: "$owner", name: "$name") {
    id
    owner {
      __typename
      login
      url
      avatarUrl
    }
    name
    isPrivate
    isFork
    description
    stargazers {
      totalCount
    }
    forks {
      totalCount
    }
    primaryLanguage {
      color
      name
    }
    issues(states: OPEN) {
      totalCount
    }
    pullRequests(states: OPEN) {
      totalCount
    }
    languages(first: 10, orderBy: {field: SIZE, direction: DESC}) {
      totalSize
      edges {
        size
        node {
          name
          color
        }
      }
    }
    url
    defaultBranchRef {
      name
      target {
        ... on Commit {
          history {
            totalCount
          }
        }
      }
    }
    viewerHasStarred
    viewerSubscription
  }
}

''');
    return data['repository'];
  }

  Future fetchReadme(BuildContext context) async {
    var data = await Provider.of<SettingsModel>(context)
        .getWithCredentials('/repos/$owner/$name/readme');

    if (data['content'] == null) {
      return '';
    }

    var bits = base64.decode(data['content'].replaceAll('\n', ''));
    var str = utf8.decode(bits);
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: Text(owner + '/' + name),
      trailingBuilder: (data) {
        var payload = data[0];

        return ActionButton(title: 'Repository Actions', actions: [
          MyAction(
            text: '@$owner',
            onPress: () {
              WidgetBuilder builder;

              switch (payload['owner']['__typename']) {
                case 'Organization':
                  // builder = (_) => OrganizationScreen(owner);
                  // break;

                  // Seems organization permission is a little complicated
                  // So we just launch browser currently
                  launch(payload['owner']['url']);
                  return;
                case 'User':
                  builder = (_) => UserScreen(owner);
                  break;
              }

              Provider.of<ThemeModel>(context)
                  .pushRoute(context: context, builder: builder);
            },
          ),
          MyAction(
            text: payload['viewerHasStarred'] ? 'Unstar' : 'Star',
            onPress: () async {
              if (payload['viewerHasStarred']) {
                await Provider.of<SettingsModel>(context)
                    .deleteWithCredentials('/user/starred/$owner/$name');
                payload['viewerHasStarred'] = false;
              } else {
                Provider.of<SettingsModel>(context)
                    .putWithCredentials('/user/starred/$owner/$name');
                payload['viewerHasStarred'] = true;
              }
            },
          ),
          // TODO: watch
          MyAction(
            text: 'Share',
            onPress: () {
              Share.share(payload['url']);
            },
          ),
          MyAction(
            text: 'Open in Browser',
            onPress: () {
              launch(payload['url']);
            },
          ),
        ]);
      },
      onRefresh: () => Future.wait([
        queryRepo(context),
        fetchReadme(context),
      ]),
      bodyBuilder: (data) {
        var payload = data[0];
        var readme = data[1];

        final langWidth =
            MediaQuery.of(context).size.width - _languageBarPadding * 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RepoItem(payload, isLink: false),
            BorderView(),
            Row(
              children: <Widget>[
                EntryItem(
                  count: payload['issues']['totalCount'],
                  text: 'Issues',
                  screenBuilder: (context) =>
                      IssuesScreen(owner: owner, name: name),
                ),
                EntryItem(
                  count: payload['pullRequests']['totalCount'],
                  text: 'Pull Requests',
                  screenBuilder: (context) => IssuesScreen(
                      owner: owner, name: name, isPullRequest: true),
                ),
                EntryItem(
                  count: payload['defaultBranchRef']['target']['history']
                      ['totalCount'],
                  text: 'Commits',
                  screenBuilder: (context) => CommitsScreen(owner, name),
                ),
              ],
            ),
            BorderView(height: 10),
            Padding(
              padding: const EdgeInsets.all(_languageBarPadding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: 10,
                  child: Row(
                      children: (payload['languages']['edges'] as List)
                          .map((lang) => Container(
                              color: convertColor(lang['node']['color']),
                              width: langWidth *
                                  lang['size'] /
                                  payload['languages']['totalSize']))
                          .toList()),
                ),
              ),
            ),
            TableView(items: [
              TableViewItem(
                leftWidget: Icon(Octicons.code,
                    size: 20,
                    color: convertColor(payload['primaryLanguage'] == null
                        ? null
                        : payload['primaryLanguage']['color'])),
                text: Text(payload['primaryLanguage'] == null
                    ? 'Unknown'
                    : payload['primaryLanguage']['name']),
                rightWidget: Icon(
                  CupertinoIcons.right_chevron,
                  size: 18,
                  color: PrimerColors.gray300,
                ),
                screenBuilder: (_) => ObjectScreen(owner: owner, name: name),
              )
            ]),
            BorderView(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              child: MarkdownBody(data: readme),
            ),
          ],
        );
      },
    );
  }
}
