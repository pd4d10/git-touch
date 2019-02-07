import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import '../utils/utils.dart';

// Future queryUser(String login) async {
//   var data = await query('''
// {
//   user(login: "$login") {
//     name
//     avatarUrl
//     bio
//     email
//     repositories {
//       totalCount
//     }
//     starredRepositories {
//       totalCount
//     }
//     followers {
//       totalCount
//     }
//     following {
//       totalCount
//     }
//   }
// }

// ''');
//   return data['user'];
// }

class UserBloc {
  Map<String, dynamic> _userDict = {};

  final _user = BehaviorSubject(seedValue: null);

  fetchUser(String login) async {
    // var user = await queryUser(login);
    // _userDict[login] = user;
    // return user;
  }

  UserBloc() {}
}

class UserProvider extends InheritedWidget {
  final UserBloc bloc;

  UserProvider({
    Key key,
    Widget child,
    @required UserBloc bloc,
  })  : bloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UserBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(UserProvider) as UserProvider).bloc;
}
