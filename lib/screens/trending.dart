import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import '../scaffolds/refresh.dart';
import '../widgets/repo_item.dart';

// class TrendingRepo {
//   String owner;
//   String name;
//   String description;
//   String languageName;
//   String languageColor;
//   int starCount;
//   int forkCount;
//   int stars;
// }

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  Future<List<dynamic>> _fetchTrendingRepos() async {
    var res = await http.get('https://github.com/trending');
    // print(res.body);
    var document = parse(res.body);
    var items = document.querySelectorAll('.repo-list>li');

    return items.map((item) {
      Map<String, String> lang;
      var colorNode = item.querySelector('.repo-language-color');
      if (colorNode != null) {
        lang = {
          'name': colorNode.nextElementSibling.innerHtml.trim(),
          'color': RegExp(r'(#\w{6})')
              .firstMatch(colorNode.attributes['style'])
              .group(0),
        };
      }

      var payload = {
        'owner': {
          'login': item
              .querySelector('h3>a>span')
              ?.innerHtml
              ?.replaceFirst('/', '')
              ?.trim()
        },
        'name': item
            .querySelector('h3>a')
            ?.innerHtml
            ?.replaceFirst(RegExp(r'^[\s\S]*span>'), '')
            ?.trim(),
        'description': item.children[2]
            .querySelector('p')
            ?.innerHtml
            ?.trim()
            ?.replaceAll(RegExp(r'<g-emoji.*?>'), '')
            ?.replaceAll(RegExp(r'</g-emoji>'), ''),
        'stargazers': {
          'totalCount': item.children[3]
              .querySelectorAll('a')[0]
              ?.innerHtml
              ?.replaceFirst(RegExp(r'^[\s\S]*svg>'), '')
              ?.trim()
        },
        'forks': {
          'totalCount': item.children[3]
              .querySelectorAll('a')[1]
              ?.innerHtml
              ?.replaceFirst(RegExp(r'^[\s\S]*svg>'), '')
              ?.trim(),
        },
        'primaryLanguage': lang,
        'isPrivate': false,
        'isFork': false // TODO:
      };
      // print(payload);
      return payload;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshScaffold(
      title: Text('Trending'),
      onRefresh: _fetchTrendingRepos,
      bodyBuilder: (payload) {
        return Column(
          children: payload.map<Widget>((repo) {
            return Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: RepoItem(repo),
            );
          }).toList(),
        );
      },
    );
  }
}
