import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:git_touch/widgets/repo_item.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlSearchScreen extends StatefulWidget {
  @override
  State<GlSearchScreen> createState() => _GlSearchScreenState();
}

class _GlSearchScreenState extends State<GlSearchScreen> {
  int? _activeTab = 0;
  bool _loading = false;
  List<GitlabProject> _projects = [];
  List<GitlabUser> _users = [];

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
      final projects = await auth
          .fetchGitlabWithPage('/search?scope=projects&search=$keyword');
      final users =
          await auth.fetchGitlabWithPage('/search?scope=users&search=$keyword');
      _projects = [for (var v in projects.data) GitlabProject.fromJson(v)];
      _users = [for (var v in users.data) GitlabUser.fromJson(v)];
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
    if (_projects.isEmpty || _users.isEmpty) {
      _query();
    }
  }

  static const tabs = ['Projects', 'Users'];

  Widget _buildItem(project) {
    if (_activeTab == 0) {
      final p = project as GitlabProject;
      final updatedAt = timeago.format(p.lastActivityAt!);
      return RepoItem.gl(
        payload: p,
        note: 'Updated $updatedAt',
      );
    } else {
      final p = project as GitlabUser;
      return UserItem.gitlab(
        login: p.username,
        name: p.name,
        id: p.id,
        avatarUrl: p.avatarUrl,
        bio: Text(p.bio ?? ''),
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
            else if (_activeTab == 0)
              ..._projects.map(_buildItem).toList()
            else
              ..._users.map(_buildItem).toList(),
          ],
        ),
      ),
    );
  }
}
