import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class GeSearchScreen extends StatefulWidget {
  @override
  _GeSearchScreenState createState() => _GeSearchScreenState();
}

class _GeSearchScreenState extends State<GeSearchScreen> {
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
      final auth = context.read<AuthModel>();
      final searchRepositories =
          await auth.fetchGitee('/search/repositories?q=$keyword').then((v) {
        return [for (var repo in v) GiteeRepo.fromJson(repo)];
      });
      final searchUsers =
          await auth.fetchGitee('/search/users?q=$keyword').then((v) {
        return [for (var user in v) GiteeUser.fromJson(user)];
      });
      final searchIssues =
          await auth.fetchGitee('/search/issues?q=$keyword').then((v) {
        return [for (var issue in v) GiteeIssue.fromJson(issue)];
      });

      _payloads[0] = searchRepositories;
      _payloads[1] = searchUsers;
      _payloads[2] = searchIssues;
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _buildInput() {
    final theme = Provider.of<ThemeModel>(context);
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return Container(
          color: theme.palette.background,
          child: CupertinoTextField(
            prefix: Row(
              children: <Widget>[
                SizedBox(width: 8),
                Icon(Octicons.search, size: 20, color: PrimerColors.gray400),
              ],
            ),
            placeholder: S.of(context).search,
            clearButtonMode: OverlayVisibilityMode.editing,
            textInputAction: TextInputAction.go,
            onSubmitted: (_) => _query(),
            controller: _controller,
          ),
        );
      default:
        return TextField(
          decoration: InputDecoration.collapsed(hintText: S.of(context).search),
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

  Widget _buildItem(p) {
    switch (_activeTab) {
      case 0:
        return RepositoryItem(
          owner: p.namespace.path,
          avatarUrl: p.owner.avatarUrl,
          name: p.path,
          description: p.description,
          starCount: p.stargazersCount,
          forkCount: p.forksCount,
          note: 'Updated ${timeago.format(p.updatedAt)}',
          url: '/gitee/${p.namespace.path}/${p.path}',
          avatarLink: '/gitee/${p.namespace.path}',
        );
      case 1:
        return UserItem.gitee(
          login: p.login,
          name: p.name,
          avatarUrl: p.avatarUrl,
          bio: Text(p.bio != null ? p.bio : p.htmlUrl),
        );
      default:
        return IssueItem(
          author: p.user.login,
          avatarUrl: p.user.avatarUrl,
          commentCount: p.comments,
          subtitle: '#' + p.number,
          title: p.title,
          updatedAt: DateTime.parse(p.updatedAt),
          url:
              '/gitee/${p.repository.namespace.path}/${p.repository.path}/issues/${p.number}',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context).theme;

    final scaffold = CommonScaffold(
      title: _buildInput(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (theme == AppThemeType.cupertino)
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: CupertinoSlidingSegmentedControl(
                    groupValue: _activeTab,
                    onValueChanged: _onTabSwitch,
                    children: tabs.asMap().map((key, text) => MapEntry(
                        key,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(text, style: TextStyle(fontSize: 14)),
                        ))),
                  ),
                ),
              ),
            if (_loading)
              Loading()
            else
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
