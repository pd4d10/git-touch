import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/tab.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/user_item.dart';
import 'package:http/http.dart' as http;
import 'package:git_touch/widgets/repository_item.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  int _activeTab;
  List _repoItems;
  List _userItems;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Uri get _uri => Uri.parse('https://github-trending-api.now.sh')
      .resolve(_activeTab == 1 ? '/developers' : '/');

  Iterable<Widget> _buildItems() {
    switch (_activeTab) {
      case 0:
        return _userItems?.map((item) => UserItem(
              item['username'],
              name: item['name'],
              avatarUrl: item['avatar'],
              bio: '',
            ));
      case 1:
      default:
        return _repoItems?.map((item) => RepositoryItem(item));
    }
  }

  _refresh() async {
    var res = await http.get(_uri);
    var items = json.decode(res.body) as List;
    setState(() {
      switch (_activeTab) {
        case 0:
          _repoItems = items
              .map((item) => {
                    'owner': {
                      'login': item['author'],
                      'avatarUrl': item['avatar']
                    },
                    'name': item['name'],
                    'description': item['description'],
                    'stargazers': {
                      'totalCount': item['stars'],
                    },
                    'forks': {
                      'totalCount': item['forks'],
                    },
                    'primaryLanguage': item['language'] == null
                        ? null
                        : {
                            'name': item['language'],
                            'color': item['languageColor'],
                          },
                    'isPrivate': false,
                    'isFork': false // TODO:
                  })
              .toList();
          break;
        case 1:
          _userItems = items;
          break;
        default:
      }
    });
  }

  Widget build(BuildContext context) {
    return TabScaffold(
      title: AppBarTitle('Trending'),
      tabs: ['Repositories', 'Users'],
      onRefresh: _refresh,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: join(borderView, _buildItems()).toList(),
      ),
      activeTab: _activeTab,
      onTabSwitch: (int index) {
        setState(() {
          _activeTab = index;
          _refresh();
        });
      },
    );
  }
}
