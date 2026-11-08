import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GhSearchScreen extends StatefulWidget {
  @override
  State<GhSearchScreen> createState() => _GhSearchScreenState();
}

class _GhSearchScreenState extends State<GhSearchScreen> {
  int? _activeTab = 0;
  bool _loading = false;
  final List<List?> _payloads = [[], [], []];

  TextEditingController? _controller;

  String get _keyword => _controller!.text.trim();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future<void> _query() async {
    if (_loading || _keyword.isEmpty) return;

    final keyword = _controller!.text;
    setState(() {
      _loading = true;
    });
    try {
      final auth = context.read<AuthModel>();
      final data = await auth.query('''
{
  repository: search(first: $kPageSize, type: REPOSITORY, query: "$keyword") {
    nodes {
      ... on Repository {
        owner {
          __typename
          login
          avatarUrl
        }
        name
        description
        isPrivate
        isFork
        updatedAt
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
      }
    }
  }
  user: search(first: $kPageSize, type: USER, query: "$keyword") {
    nodes {
      ... on Organization {
        __typename
        name
        avatarUrl
        bio: description
        login
      }
      ... on User {
        $userGqlChunk
      }
    }
  }
  issue: search(first: $kPageSize, type: ISSUE, query: "$keyword") {
    nodes {
      ... on PullRequest {
        __typename
        $issueGqlChunk
      }
      ... on Issue {
        $issueGqlChunk
      }
    }
  }
}
        ''');
      _payloads[0] = data['repository']['nodes'];
      _payloads[1] = data['user']['nodes'];
      _payloads[2] = data['issue']['nodes'];
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  _onTabSwitch(int? index) {
    setState(() {
      _activeTab = index;
    });
    if (_payloads[_activeTab!]!.isEmpty) {
      _query();
    }
  }

  static const tabs = ['Repositories', 'Users', 'Issues'];

  // static IconData _buildIconData(p) {
  //   if (p['isPrivate']) {
  //     return Octicons.lock;
  //   }
  //   if (p['isFork']) {
  //     return Octicons.repo_forked;
  //   }
  //   return Octicons.repo;
  // }

  Widget _buildItem(p) {
    switch (_activeTab) {
      case 0:
        final updatedAt = timeago.format(DateTime.parse(p['updatedAt']));
        return RepoItem.gh(
          owner: p['owner']['login'],
          avatarUrl: p['owner']['avatarUrl'],
          name: p['name'],
          description: p['description'],
          starCount: p['stargazers']['totalCount'],
          forkCount: p['forks']['totalCount'],
          primaryLanguageName: p['primaryLanguage'] == null
              ? null
              : p['primaryLanguage']['name'],
          primaryLanguageColor: p['primaryLanguage'] == null
              ? null
              : p['primaryLanguage']['color'],
          note: 'Updated $updatedAt',
          isPrivate: p['isPrivate'],
          isFork: p['isFork'],
        );
      case 1:
        return UserItem.github(
          login: p['login'],
          name: p['name'],
          avatarUrl: p['avatarUrl'],
          bio: Text(p['bio'] ?? ''),
        );
      case 2:
      default:
        return IssueItem(
          author: p['author']['login'],
          avatarUrl: p['author']['avatarUrl'],
          commentCount: p['comments']['totalCount'],
          subtitle: '#${p['number']}',
          title: p['title'],
          updatedAt: DateTime.parse(p['updatedAt']),
          url: '/github${Uri.parse(p['url']).path}',
          isPr: p['__typename'] == 'PullRequest',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: Container(
        color: AntTheme.of(context).colorBackground,
        child: CupertinoTextField(
          prefix: Row(
            children: const <Widget>[
              SizedBox(width: 8),
              Icon(Octicons.search, size: 20, color: PrimerColors.gray400),
            ],
          ),
          placeholder: AppLocalizations.of(context)!.search,
          clearButtonMode: OverlayVisibilityMode.editing,
          textInputAction: TextInputAction.go,
          onSubmitted: (_) => _query(),
          controller: _controller,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSlidingSegmentedControl(
                  groupValue: _activeTab,
                  onValueChanged: _onTabSwitch,
                  children: tabs.asMap().map((key, text) => MapEntry(
                      key,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(text, style: const TextStyle(fontSize: 14)),
                      ))),
                ),
              ),
            ),
            if (_loading)
              const Loading()
            else
              ..._payloads[_activeTab!]!.map(_buildItem).toList(),
          ],
        ),
      ),
    );
  }
}
