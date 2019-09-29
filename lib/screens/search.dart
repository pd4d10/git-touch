import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/utils.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
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
      var data = await Provider.of<AuthModel>(context).query('''
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
        return Container(
          color: Colors.white,
          child: CupertinoTextField(
            prefix: Row(
              children: <Widget>[
                SizedBox(width: 8),
                Icon(Octicons.search, size: 20, color: PrimerColors.gray400),
              ],
            ),
            placeholder: 'Search',
            clearButtonMode: OverlayVisibilityMode.editing,
            textInputAction: TextInputAction.go,
            onSubmitted: (_) => _query(),
            controller: _controller,
          ),
        );
      default:
        return TextField(
          textInputAction: TextInputAction.go,
          onSubmitted: (_) => _query(),
          controller: _controller,
        );
    }
  }

  _onTabSwitch(int index) {
    setState(() {
      _activeTab = index;
    });
    if (_payloads[_activeTab].isEmpty) {
      _query();
    }
  }

  static const tabs = ['Repositories', 'Users', 'Issues'];

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
    final theme = Provider.of<ThemeModel>(context).theme;

    final scaffold = CommonScaffold(
      title: _buildInput(),
      body: SingleChildScrollView(
        child: _loading
            ? Loading()
            : Column(
                children: [
                  if (theme == AppThemeType.cupertino)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CupertinoSegmentedControl(
                          groupValue: _activeTab,
                          onValueChanged: _onTabSwitch,
                          children: tabs.asMap().map((key, text) => MapEntry(
                              key,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child:
                                    Text(text, style: TextStyle(fontSize: 14)),
                              ))),
                        ),
                      ),
                    ),
                  ..._payloads[_activeTab].map(_buildItem).toList(),
                ],
              ),
      ),
      bottom: TabBar(
        onTap: _onTabSwitch,
        tabs: tabs.map((text) => Tab(text: text.toUpperCase())).toList(),
      ),
    );

    if (theme == AppThemeType.material) {
      return DefaultTabController(
        length: tabs.length,
        child: scaffold,
      );
    } else {
      return scaffold;
    }
  }
}
