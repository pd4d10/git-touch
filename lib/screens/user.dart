import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_flux/utils/utils.dart';

Future queryUser(String login) async {
  var data = await query('''
{
  user(login: "$login") {
    name
    avatarUrl
    bio
    email
    repositories {
      totalCount
    }
    starredRepositories {
      totalCount
    }
    followers {
      totalCount
    }
    following {
      totalCount
    }
  }
}
''');
  return data['user'];
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

class UserScreen extends StatefulWidget {
  final String login;

  UserScreen(this.login);

  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var user = null;

  @override
  void initState() {
    super.initState();
    queryUser(widget.login).then((_user) {
      setState(() {
        user = _user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          var _user = await queryUser(widget.login);
          setState(() {
            user = _user;
          });
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: ClipOval(
                child: Image.network(
                  user['avatarUrl'],
                  fit: BoxFit.fill,
                  width: 64,
                  height: 64,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Column(
                    children: <Widget>[
                      Text(user['followers']['totalCount'].toString()),
                      Text('Followers'),
                    ],
                  ),
                  onTap: () {
                    // print(1);
                  },
                ),
                Column(
                  children: <Widget>[
                    Text(user['following']['totalCount'].toString()),
                    Text('Following')
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
