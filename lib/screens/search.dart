import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/tab.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/settings.dart';
import '../utils/utils.dart';
import 'package:git_touch/widgets/repository_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _activeTab = 0;
  bool _loading = false;
  List<List> _payloads = [[], [], []];

  TextEditingController _controller;

  String get _keyword => _controller.text?.trim() ?? '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _query() async {
    if (_loading || _keyword.isEmpty) return;

    var keyword = _controller.text;
    setState(() {
      _loading = true;
    });
    try {
      var data = await Provider.of<SettingsModel>(context).query('''
{
  repository: search(first: $pageSize, type: REPOSITORY, query: "$keyword") {
    nodes {
      ... on Repository {
        $repoChunk
      }
    }
  }
  user: search(first: $pageSize, type: USER, query: "$keyword") {
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
        login
      }
    }
  }
  issue: search(first: $pageSize, type: ISSUE, query: "$keyword") {
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

  Widget _buildInput() {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CupertinoTextField(
          controller: _controller,
          // padding: EdgeInsets.all(10),
          placeholder: 'Type to search',
          clearButtonMode: OverlayVisibilityMode.editing,
          onSubmitted: (_) => _query(),
        );
      default:
        return TextField(
          onSubmitted: (_) => _query(),
          controller: _controller,
        );
    }
  }

  Widget _buildItem(data) {
    switch (_activeTab) {
      case 0:
        return RepositoryItem(data);
      case 1:
        return UserItem.fromData(
          data,
          isOrganization: data['__typename'] == 'Organization',
        );
      case 2:
      default:
        return IssueItem(
            payload: data, isPullRequest: data['__typename'] == 'PullRequest');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabScaffold(
      title: AppBarTitle('Search GitHub Repositories'),
      body: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.all(8), child: _buildInput()),
          Column(children: _payloads[_activeTab].map(_buildItem).toList())
        ],
      ),
      activeTab: _activeTab,
      onRefresh: _query,
      onTabSwitch: (int index) {
        setState(() {
          _activeTab = index;
        });
        if (_payloads[_activeTab].isEmpty) {
          _query();
        }
      },
      tabs: ['Repositories', 'Users', 'Issues'],
    );
  }
}
