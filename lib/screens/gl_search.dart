import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/widgets/repository_item.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:git_touch/models/gitlab.dart';
import '../generated/l10n.dart';

class GlSearchScreen extends StatefulWidget {
  @override
  _GlSearchScreenState createState() => _GlSearchScreenState();
}

class _GlSearchScreenState extends State<GlSearchScreen> {
  int _activeTab = 0;
  bool _loading = false;
  List<GitlabProject> _projects = List<GitlabProject>();
  List<GitlabUser> _users = List<GitlabUser>();

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
    if (_projects.isEmpty || _users.isEmpty) {
      _query();
    }
  }

  static const tabs = ['Projects', 'Users'];

  Widget _buildItem(_p) {
    switch (_activeTab) {
      case 0:
        final p = _p as GitlabProject;
        final updatedAt = timeago.format(p.lastActivityAt);
        return RepositoryItem.gl(
          payload: p,
          note: 'Updated $updatedAt',
        );
      case 1:
        final p = _p as GitlabUser;
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
            else if (_activeTab == 0)
              ..._projects.map(_buildItem).toList()
            else
              ..._users.map(_buildItem).toList(),
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
