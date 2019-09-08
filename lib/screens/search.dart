import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/settings.dart';
import '../scaffolds/simple.dart';
import '../utils/utils.dart';
import '../widgets/repo_item.dart';
import '../widgets/loading.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int active = 0;
  bool loading = false;
  List repos = [];

  _onSubmitted(String value) async {
    setState(() {
      loading = true;
    });
    try {
      // TODO: search other types
      var data = await Provider.of<SettingsModel>(context).query('''
{
  search(first: $pageSize, type: REPOSITORY, query: "$value") {
    nodes {
      ... on Repository {
        $repoChunk
      }
    }
  }
}
        ''');
      repos = data['search']['nodes'];
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Widget _buildInput() {
    switch (Provider.of<ThemeModel>(context).theme) {
      case ThemeMap.cupertino:
        return CupertinoTextField(
          // padding: EdgeInsets.all(10),
          placeholder: 'Type to search',
          clearButtonMode: OverlayVisibilityMode.editing,
          onSubmitted: _onSubmitted,
        );
      default:
        return TextField(onSubmitted: _onSubmitted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: Text('Search GitHub Repositories'),
      bodyBuilder: () {
        return Column(
          children: <Widget>[
            Container(padding: EdgeInsets.all(8), child: _buildInput()),
            loading
                ? Loading()
                : Column(
                    children: repos.map((repo) => RepoItem(repo)).toList(),
                  )
          ],
        );
      },
    );
  }
}
