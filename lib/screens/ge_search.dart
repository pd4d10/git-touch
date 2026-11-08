import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/widgets/issue_item.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GeSearchScreen extends StatefulWidget {
  @override
  State<GeSearchScreen> createState() => _GeSearchScreenState();
}

class _GeSearchScreenState extends State<GeSearchScreen> {
  int? _activeTab = 0;
  bool _loading = false;
  final List<List> _payloads = [[], [], []];

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

  _onTabSwitch(int? index) {
    setState(() {
      _activeTab = index;
    });
    if (_payloads[_activeTab!].isEmpty) {
      _query();
    }
  }

  static const tabs = ['Repositories', 'Users', 'Issues'];

  Widget _buildItem(p) {
    switch (_activeTab) {
      case 0:
        return RepoItem(
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
          bio: Text(p.bio ?? p.htmlUrl),
        );
      default:
        return IssueItem(
          author: p.user.login,
          avatarUrl: p.user.avatarUrl,
          commentCount: p.comments,
          subtitle: '#${p.number}',
          title: p.title,
          updatedAt: DateTime.parse(p.updatedAt),
          url:
              '/gitee/${p.repository.namespace.path}/${p.repository.path}/issues/${p.number}',
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
              ..._payloads[_activeTab!].map(_buildItem).toList(),
          ],
        ),
      ),
    );
  }
}
