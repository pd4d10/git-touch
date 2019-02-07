import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import '../utils/utils.dart';

// Future search(String keyword, String type) async {
//   var data = await query('''
// {
//   search(query: "$keyword", type: $type, first: 10) {
//     nodes {
//       ... on User {
//         avatarUrl
//         login
//       }
//       ... on Repository {
//         nameWithOwner
//         url
//         description
//         forkCount
//         stargazers {
//           totalCount
//         }
//         primaryLanguage {
//           name
//           color
//         }
//       }
//     }
//   }
// }
// ''');
//   return data['search']['nodes'];
// }

class SearchBloc {
  final _keyword = BehaviorSubject(seedValue: '');
  final _active = BehaviorSubject(seedValue: 0);
  final _loading = BehaviorSubject(seedValue: false);
  final _users = BehaviorSubject(seedValue: []);
  final _repos = BehaviorSubject(seedValue: []);
  final _submit = StreamController();

  Stream<String> get keyword => _keyword.stream;
  Stream<int> get active => _active.stream;
  Stream<bool> get loading => _loading.stream;
  Stream get users => _users.stream;
  Stream get repos => _repos.stream;

  Sink<int> get activeUpdate => _active.sink;
  Sink<String> get keywordUpdate => _keyword.sink;
  Sink get submit => _submit.sink;

  _getTypeByIndex(int index) {
    switch (index) {
      case 0:
        return 'REPOSITORY';
      case 1:
        return 'USER';
    }
  }

  _querySearch(_) async {
    _loading.add(true);
    // await search(_keyword.value, _getTypeByIndex(_active.value));
    _loading.add(false);
  }

  SearchBloc() {
    _submit.stream.listen(_querySearch);
  }
}

class SearchProvider extends InheritedWidget {
  final SearchBloc bloc;

  SearchProvider({
    Key key,
    Widget child,
    @required SearchBloc bloc,
  })  : bloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SearchBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(SearchProvider) as SearchProvider)
          .bloc;
}
